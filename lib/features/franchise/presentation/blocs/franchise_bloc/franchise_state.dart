part of 'franchise_bloc.dart';

abstract class FranchiseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FranchiseInitial extends FranchiseState {}

class FranchiseLoading extends FranchiseState {}

class FranchiseLoaded extends FranchiseState {
  final List<Franchise> franchises;

  FranchiseLoaded({required this.franchises});

  @override
  List<Object> get props => [franchises];
}

class FranchiseBranchesLoaded extends FranchiseState {
  final List<FranchiseBranch> branches;

  FranchiseBranchesLoaded({required this.branches});

  @override
  List<Object> get props => [branches];
}
class MyFranchisesError extends FranchiseState {
  final String message;

  MyFranchisesError(this.message);
}