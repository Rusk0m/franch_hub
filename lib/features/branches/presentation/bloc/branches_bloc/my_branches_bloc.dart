import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/use_case/get_branches_for_franchise_use_case.dart';
import 'package:franch_hub/features/branches/domain/use_case/get_my_branches_use_case.dart';

part 'my_branches_event.dart';

part 'my_branches_state.dart';

class BranchesBloc extends Bloc<BranchesEvent, BranchesState> {
  final GetMyBranchesUseCase getMyBranches = sl();
  final GetBranchesForFranchiseUseCase getBranchesForFranchiseUseCase = sl();

  BranchesBloc() : super(BranchesInitial()) {
    on<LoadMyBranches>(_onLoadMyBranches);
    on<LoadFranchiseBranches>(_onLoadFranchiseBranches);
  }

  Future<void> _onLoadMyBranches(
    LoadMyBranches event,
    Emitter<BranchesState> emit,
  ) async {
    emit(BranchesLoading());
    try {
      final result = await getMyBranches(params: event.ownerId);
      emit(BranchesLoaded(branches: result));
    } catch (e) {
      emit(BranchesError(e.toString()));
    }
  }

  Future<void> _onLoadFranchiseBranches(
    LoadFranchiseBranches event,
    Emitter<BranchesState> emit,
  ) async {
    emit(BranchesLoading());
    try {
      final branches =
          await getBranchesForFranchiseUseCase(params: event.franchiseId);
      emit(BranchesLoaded(branches: branches));
    } catch (e) {
      emit(BranchesError(e.toString()));
    }
  }
}
