part of 'my_branches_bloc.dart';

abstract class BranchesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BranchesInitial extends BranchesState {}

class BranchesLoading extends BranchesState {}

class BranchesLoaded extends BranchesState {
  final List<FranchiseBranch> branches;

  BranchesLoaded({required this.branches});

  @override
  List<Object> get props => [branches];
}
class BranchesError extends BranchesState {
  final String message;

  BranchesError(this.message);
}