part of 'my_branches_bloc.dart';

abstract class MyBranchesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadMyBranches extends MyBranchesEvent {
  final String ownerId;

  LoadMyBranches(this.ownerId);

  @override
  List<Object> get props => [ownerId];
}
