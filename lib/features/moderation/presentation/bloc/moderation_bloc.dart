import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
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
  final GetPendingBranchesUseCase getPendingBranchesUseCase = sl();
  final ModerateBranchUseCase moderateBranchUseCase = sl();
  final GetPendingFranchisesUseCase getPendingFranchisesUseCase = sl();
  final ModerateFranchiseUseCase moderateFranchiseUseCase = sl();
  final SendMessageUseCase sendMessageUseCase = sl();
  final FirebaseFirestore firestore = sl();

  ModerationBloc() : super(ModerationInitial()) {
    on<LoadModerationData>(_onLoadModerationData);
    on<ModerateBranch>(_onModerateBranch);
    on<ModerateFranchiseEvent>(_onModerateFranchise);
  }

  Future<void> _onLoadModerationData(
      LoadModerationData event, Emitter<ModerationState> emit) async {
    emit(ModerationLoading());
    try {
      final userDoc = await firestore.collection('users').doc(event.userId).get();
      if (!userDoc.exists) {
        emit(const ModerationError(message: 'userNotFoundError'));
        return;
      }
      final user = UserModel.fromFirestore(userDoc).toEntity();

      if (user.role == 'admin') {
        final franchises = await getPendingFranchisesUseCase(params: null);
        emit(ModerationFranchiseLoaded(franchises: franchises));
      } else {
        final franchiseQuery = await firestore
            .collection('franchises')
            .where('ownerId', isEqualTo: event.userId)
            .get();
        final franchiseIds = franchiseQuery.docs.map((doc) => doc.id).toList();
        final franchiseNames = {
          for (var doc in franchiseQuery.docs) doc.id: doc.data()['name'] as String
        };

        if (franchiseIds.isEmpty) {
          emit(const ModerateBranchLoaded(pendingBranches: [], franchiseNames: {}));
          return;
        }

        final branchesStream = getPendingBranchesUseCase(params: event.userId);
        await for (final branches in branchesStream) {
          final filteredBranches = branches
              .where((branch) => franchiseIds.contains(branch.franchiseId))
              .toList();
          emit(ModerateBranchLoaded(
            pendingBranches: filteredBranches,
            franchiseNames: franchiseNames,
          ));
        }
      }
    } catch (e) {
      emit(ModerationError(message: 'failedToLoadModerationData|$e'));
    }
  }

  Future<void> _onModerateBranch(
      ModerateBranch event, Emitter<ModerationState> emit) async {
    emit(ModerationLoading());
    try {
      final franchiseDoc =
      await firestore.collection('franchises').doc(event.franchiseId).get();
      if (!franchiseDoc.exists || franchiseDoc.data()?['ownerId'] != event.ownerId) {
        emit(const ModerationError(message: 'notAuthorizedToModerateBranch'));
        return;
      }

      FranchiseBranch? branch;
      if (event.status == 'approved') {
        branch = FranchiseBranch(
          id: const Uuid().v4(),
          franchiseId: event.franchiseId,
          ownerId: event.requesterId,
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

      final chatId = _generateChatId(event.ownerId, event.requesterId);
      final messageKey =
      event.status == 'approved' ? 'branchApprovedMessage' : 'branchRejectedMessage';
      await sendMessageUseCase(
        params: SendMessageParams(
          message: Message(
            id: const Uuid().v4(),
            senderId: 'system',
            receiverId: event.requesterId,
            content: '$messageKey|${event.name}',
            sentAt: DateTime.now(),
            isSystemMessage: true,
          ),
          chatId: chatId,
        ),
      );

      final franchiseQuery = await firestore
          .collection('franchises')
          .where('ownerId', isEqualTo: event.ownerId)
          .get();
      final franchiseIds = franchiseQuery.docs.map((doc) => doc.id).toList();
      final franchiseNames = {
        for (var doc in franchiseQuery.docs) doc.id: doc.data()['name'] as String
      };

      if (franchiseIds.isEmpty) {
        emit(const ModerateBranchLoaded(pendingBranches: [], franchiseNames: {}));
        return;
      }

      final branchesStream = getPendingBranchesUseCase(params: event.ownerId);
      await for (final branches in branchesStream) {
        final filteredBranches = branches
            .where((branch) => franchiseIds.contains(branch.franchiseId))
            .toList();
        emit(ModerateBranchLoaded(
          pendingBranches: filteredBranches,
          franchiseNames: franchiseNames,
        ));
        break;
      }
    } catch (e) {
      emit(ModerationError(message: 'failedToModerateBranch|$e'));
    }
  }

  Future<void> _onModerateFranchise(
      ModerateFranchiseEvent event, Emitter<ModerationState> emit) async {
    emit(ModerationLoading());
    try {
      final franchiseDoc =
      await firestore.collection('pending_franchises').doc(event.franchiseId).get();
      if (!franchiseDoc.exists) {
        emit(const ModerationError(message: 'franchiseRequestNotFound'));
        return;
      }
      final franchiseData = franchiseDoc.data();
      if (franchiseData == null) {
        emit(const ModerationError(message: 'franchiseRequestDataEmpty'));
        return;
      }

      await moderateFranchiseUseCase(
        params: ModerateFranchiseParams(
          franchiseId: event.franchiseId,
          status: event.status,
        ),
      );

      final ownerId = franchiseData['ownerId'] as String;
      final franchiseName = franchiseData['name'] as String;
      final chatId = _generateChatId('system', ownerId);
      final messageKey = event.status == 'approved'
          ? 'franchiseApprovedMessage'
          : 'franchiseRejectedMessage';
      await sendMessageUseCase(
        params: SendMessageParams(
          message: Message(
            id: const Uuid().v4(),
            senderId: 'system',
            receiverId: ownerId,
            content: '$messageKey|$franchiseName',
            sentAt: DateTime.now(),
            isSystemMessage: true,
          ),
          chatId: chatId,
        ),
      );

      final franchises = await getPendingFranchisesUseCase(params: null);
      emit(ModerationFranchiseLoaded(franchises: franchises));
    } catch (e) {
      emit(ModerationError(message: 'failedToModerateFranchise|$e'));
    }
  }

  String _generateChatId(String uid1, String uid2) {
    final ids = [uid1, uid2]..sort();
    return '${ids[0]}_${ids[1]}';
  }
}