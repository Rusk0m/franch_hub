import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/features/moderation/domain/use_cases/get_pending_franchises.dart';
import 'package:franch_hub/features/moderation/domain/use_cases/moderate_franchise.dart';

part 'moderation_event.dart';
part 'moderation_state.dart';

class ModerationBloc extends Bloc<ModerationEvent, ModerationState> {
  final GetPendingFranchisesUseCase getPendingFranchises = sl();
  final ModerateFranchiseUseCase moderateFranchise = sl();

  ModerationBloc() : super(ModerationInitial()) {
    on<LoadPendingFranchises>((event, emit) async {
      emit(ModerationLoading());
      try {
        final franchises = await getPendingFranchises();
        emit(ModerationLoaded(franchises: franchises));
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
        emit(ModerationLoaded(franchises: franchises));
      } catch (e) {
        emit(ModerationError(message: e.toString()));
      }
    });
  }
}