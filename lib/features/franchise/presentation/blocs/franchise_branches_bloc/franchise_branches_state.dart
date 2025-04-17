part of 'franchise_branches_bloc.dart';

abstract class FranchiseBranchesState extends Equatable {
  const FranchiseBranchesState();

  @override
  List<Object> get props => [];
}

class FranchiseBranchesInitial extends FranchiseBranchesState {}

class FranchiseBranchesLoading extends FranchiseBranchesState {}

class FranchiseBranchesLoaded extends FranchiseBranchesState {
  final List<FranchiseBranch> branches;

  const FranchiseBranchesLoaded(this.branches);

  @override
  List<Object> get props => [branches];
}

class FranchiseBranchesError extends FranchiseBranchesState {
  final String message;

  const FranchiseBranchesError(this.message);

  @override
  List<Object> get props => [message];
}
