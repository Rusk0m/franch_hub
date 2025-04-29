part of 'franchise_bloc.dart';

abstract class FranchiseState extends Equatable {
  const FranchiseState();

  @override
  List<Object?> get props => [];
}

class FranchiseInitial extends FranchiseState {}

class FranchiseLoading extends FranchiseState {}

class FranchiseLoaded extends FranchiseState {
  final List<Franchise> franchises;

  const FranchiseLoaded({required this.franchises});

  @override
  List<Object?> get props => [franchises];
}

class FranchiseBranchesLoaded extends FranchiseState {
  final List<FranchiseBranch> branches;

  const FranchiseBranchesLoaded({required this.branches});

  @override
  List<Object?> get props => [branches];
}

class MyFranchisesError extends FranchiseState {
  final String message;

  const MyFranchisesError(this.message);

  @override
  List<Object?> get props => [message];
}

class FranchiseCreated extends FranchiseState {}