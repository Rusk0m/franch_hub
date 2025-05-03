import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/auth/data/models/user_model.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/entities/panding_franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/use_case/get_pending_branches_use_case.dart';
import 'package:franch_hub/features/branches/domain/use_case/moderate_branch_use_case.dart';
import 'package:franch_hub/features/chat/domain/entities/message.dart';
import 'package:franch_hub/features/chat/domain/use_case/send_message_use_case.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/features/moderation/domain/use_cases/get_pending_franchises.dart';
import 'package:franch_hub/features/moderation/domain/use_cases/moderate_franchise.dart';
import 'package:uuid/uuid.dart';

part 'moderation_event.dart';
part 'moderation_state.dart';

class ModerationBloc extends Bloc<ModerationEvent, ModerationState> {
  final GetPendingFranchisesUseCase getPendingFranchises = sl();
  final ModerateFranchiseUseCase moderateFranchise = sl();
  final GetPendingBranchesUseCase getPendingBranchesUseCase = sl();
  final ModerateBranchUseCase moderateBranchUseCase = sl();
  final SendMessageUseCase sendMessageUseCase = sl();
  final FirebaseFirestore firestore = sl();

  ModerationBloc() : super(ModerationInitial()) {
    on<LoadModerationData>(_onLoadModerationData);
    on<ModerateFranchiseEvent>(_onModerateFranchise);
    on<ModerateBranch>(_onModerateBranch);
  }

  Future<void> _onLoadModerationData(
      LoadModerationData event, Emitter<ModerationState> emit) async {
    emit(ModerationLoading());
    try {
      // Проверяем роль пользователя
      final userDoc = await firestore.collection('users').doc(event.userId).get();
      if (!userDoc.exists) {
        emit(const ModerationError(message: 'User not found'));
        return;
      }
      final user = UserModel.fromFirestore(userDoc).toEntity();
      if (user.role == 'admin') {
        // Загружаем заявки на франшизы для админа
        final franchises = await getPendingFranchises(params: null);
        final franchiseWithOwners = <Franchise, UserEntity>{};
        for (var franchise in franchises) {
          final ownerDoc = await firestore.collection('users').doc(franchise.ownerId).get();
          final owner = ownerDoc.exists
              ? UserModel.fromFirestore(ownerDoc).toEntity()
              : UserEntity.empty;
          franchiseWithOwners[franchise] = owner;
        }
        emit(ModerationFranchiseLoaded(franchises: franchiseWithOwners));
      } else {
        // Загружаем заявки на филиалы для франчайзера
        final branchesStream = getPendingBranchesUseCase(params: event.userId);
        await for (final branches in branchesStream) {
          emit(ModerateBranchLoaded(pendingBranches: branches));
        }
      }
    } catch (e) {
      emit(ModerationError(message: 'Failed to load moderation data: $e'));
    }
  }

  Future<void> _onModerateFranchise(
      ModerateFranchiseEvent event, Emitter<ModerationState> emit) async {
    emit(ModerationLoading());
    try {
      // Проверяем существование документа
      final franchiseDoc = await firestore.collection('pending_franchises').doc(event.franchiseId).get();
      if (!franchiseDoc.exists) {
        emit(const ModerationError(message: 'Franchise request not found'));
        return;
      }
      final franchiseData = franchiseDoc.data();
      if (franchiseData == null) {
        emit(const ModerationError(message: 'Franchise request data is empty'));
        return;
      }

      // Выполняем модерацию
      await moderateFranchise(
        params: ModerateFranchiseParams(
          franchiseId: event.franchiseId,
          status: event.status,
        ),
      );

      // Отправка уведомления владельцу франшизы через чат
      final ownerId = franchiseData['ownerId'] as String;
      final franchiseName = franchiseData['name'] as String;
      final chatId = _generateChatId('system', ownerId);
      final messageContent = event.status == 'approved'
          ? 'Ваша заявка на франшизу "$franchiseName" одобрена.'
          : 'Ваша заявка на франшизу "$franchiseName" отклонена.';
      await sendMessageUseCase(
        params: SendMessageParams(
          message: Message(
            id: const Uuid().v4(),
            senderId: 'system',
            receiverId: ownerId,
            content: messageContent,
            sentAt: DateTime.now(),
            isSystemMessage: true,
          ),
          chatId: chatId,
        ),
      );

      // Обновляем список заявок
      final franchises = await getPendingFranchises(params: null);
      final franchiseWithOwners = <Franchise, UserEntity>{};
      for (var franchise in franchises) {
        final userDoc = await firestore.collection('users').doc(franchise.ownerId).get();
        final user = userDoc.exists
            ? UserModel.fromFirestore(userDoc).toEntity()
            : UserEntity.empty;
        franchiseWithOwners[franchise] = user;
      }
      emit(ModerationFranchiseLoaded(franchises: franchiseWithOwners));
    } catch (e) {
      emit(ModerationError(message: 'Failed to moderate franchise: $e'));
    }
  }

  Future<void> _onModerateBranch(
      ModerateBranch event, Emitter<ModerationState> emit) async {
    emit(ModerationLoading());
    try {
      FranchiseBranch? branch;
      if (event.status == 'approved') {
        branch = FranchiseBranch(
          id: const Uuid().v4(),
          franchiseId: event.franchiseId,
          ownerId: event.ownerId,
          name: event.name,
          location: event.location,
          royaltyPercent: event.royaltyPercent,
          workingHours: event.workingHours,
          phone: event.phone,
          createdAt: DateTime.now(),
        );
      }

      await moderateBranchUseCase(
        params: ModerateBranchParams(
          pendingBranchId: event.pendingBranchId,
          status: event.status,
          branch: branch,
        ),
      );

      // Отправка уведомления пользователю через чат
      final chatId = _generateChatId(event.ownerId, event.requesterId);
      final messageContent = event.status == 'approved'
          ? 'Ваша заявка на филиал "${event.name}" одобрена.'
          : 'Ваша заявка на филиал "${event.name}" отклонена.';
      await sendMessageUseCase(
        params: SendMessageParams(
          message: Message(
            id: const Uuid().v4(),
            senderId: 'system',
            receiverId: event.requesterId,
            content: messageContent,
            sentAt: DateTime.now(),
            isSystemMessage: true,
          ),
          chatId: chatId,
        ),
      );

      emit(ModerateBranchSuccess());
    } catch (e) {
      emit(ModerationError(message: 'Failed to moderate branch: $e'));
    }
  }

  String _generateChatId(String uid1, String uid2) {
    final ids = [uid1, uid2]..sort();
    return '${ids[0]}_${ids[1]}';
  }
}