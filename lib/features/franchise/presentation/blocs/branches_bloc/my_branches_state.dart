part of 'my_branches_bloc.dart';

abstract class MyBranchesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MyBranchesInitial extends MyBranchesState {}

class MyBranchesLoading extends MyBranchesState {}

class MyBranchesLoaded extends MyBranchesState {
  final List<FranchiseBranch> branches;

  MyBranchesLoaded({required this.branches});

  @override
  List<Object> get props => [branches];
}
class MyBranchesError extends MyBranchesState {
  final String message;

  MyBranchesError(this.message);
}