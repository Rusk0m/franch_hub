part of 'franchise_bloc.dart';

abstract class FranchiseEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadMyFranchises extends FranchiseEvent {
  final String ownerId;

  LoadMyFranchises(this.ownerId);

  @override
  List<Object> get props => [ownerId];
}

class LoadFranchiseBranches extends FranchiseEvent {
  final String franchiseId;

  LoadFranchiseBranches(this.franchiseId);

  @override
  List<Object> get props => [franchiseId];
}
