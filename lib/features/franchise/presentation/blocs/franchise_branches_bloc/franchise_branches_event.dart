part of 'franchise_branches_bloc.dart';

abstract class FranchiseBranchesEvent extends Equatable {
  const FranchiseBranchesEvent();

  @override
  List<Object> get props => [];
}

class LoadFranchiseBranches extends FranchiseBranchesEvent {
  final String franchiseId;

  const LoadFranchiseBranches(this.franchiseId);

  @override
  List<Object> get props => [franchiseId];
}
