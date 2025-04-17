import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/franchise/domain/use_case/get_branches_for_franchise_use_case.dart';

part 'franchise_branches_event.dart';
part 'franchise_branches_state.dart';

class FranchiseBranchesBloc extends Bloc<FranchiseBranchesEvent, FranchiseBranchesState> {
  final GetBranchesForFranchiseUseCase getBranchesForFranchiseUseCase = sl();

  FranchiseBranchesBloc()
      : super(FranchiseBranchesInitial()) {
    on<LoadFranchiseBranches>(_onLoadFranchiseBranches);
  }

  Future<void> _onLoadFranchiseBranches(
      LoadFranchiseBranches event,
      Emitter<FranchiseBranchesState> emit,
      ) async {
    emit(FranchiseBranchesLoading());
    try {
      final branches = await getBranchesForFranchiseUseCase(params: event.franchiseId);
      emit(FranchiseBranchesLoaded(branches));
    } catch (e) {
      emit(FranchiseBranchesError(e.toString()));
    }
  }
}
