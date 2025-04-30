import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/auth/data/models/user_model.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/features/moderation/domain/use_cases/get_pending_franchises.dart';
import 'package:franch_hub/features/moderation/domain/use_cases/moderate_franchise.dart';

part 'moderation_event.dart';
part 'moderation_state.dart';

class ModerationBloc extends Bloc<ModerationEvent, ModerationState> {
  final GetPendingFranchisesUseCase getPendingFranchises = sl();
  final ModerateFranchiseUseCase moderateFranchise = sl();
  final FirebaseFirestore firestore = sl();

  ModerationBloc() : super(ModerationInitial()) {
    on<LoadPendingFranchises>((event, emit) async {
      emit(ModerationLoading());
      try {
        final franchises = await getPendingFranchises();
        // Загружаем данные правобладателей
        final franchiseWithOwners = <Franchise, UserEntity>{};
        for (var franchise in franchises) {
          final userDoc = await firestore.collection('users').doc(franchise.ownerId).get();
          final user = userDoc.exists
              ? UserModel.fromFirestore(userDoc).toEntity()
              : UserEntity.empty;
          franchiseWithOwners[franchise] = user;
        }
        emit(ModerationLoaded(franchises: franchiseWithOwners));
      } catch (e) {
        emit(ModerationError(message: e.toString()));
      }
    });

    on<ModerateFranchiseEvent>((event, emit) async {
      emit(ModerationLoading());
      try {
        await moderateFranchise(
          params: ModerateFranchiseParams(
            franchiseId: event.franchiseId,
            status: event.status,
          ),
        );
        final franchises = await getPendingFranchises();
        final franchiseWithOwners = <Franchise, UserEntity>{};
        for (var franchise in franchises) {
          final userDoc = await firestore.collection('users').doc(franchise.ownerId).get();
          final user = userDoc.exists
              ? UserModel.fromFirestore(userDoc).toEntity()
              : UserEntity.empty;
          franchiseWithOwners[franchise] = user;
        }
        emit(ModerationLoaded(franchises: franchiseWithOwners));
      } catch (e) {
        emit(ModerationError(message: e.toString()));
      }
    });
  }
}