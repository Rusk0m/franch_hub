part of 'my_branches_bloc.dart';

abstract class BranchesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadMyBranches extends BranchesEvent {
  final String ownerId;

  LoadMyBranches(this.ownerId);

  @override
  List<Object> get props => [ownerId];
}

class LoadFranchiseBranches extends BranchesEvent {
  final String franchiseId;

  LoadFranchiseBranches(this.franchiseId);

  @override
  List<Object> get props => [franchiseId];
}
