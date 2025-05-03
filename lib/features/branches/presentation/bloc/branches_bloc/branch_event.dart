part of 'branch_bloc.dart';

abstract class BranchEvent extends Equatable {
  const BranchEvent();

  @override
  List<Object?> get props => [];
}

class CreatePendingBranch extends BranchEvent {
  final String franchiseId;
  final String ownerId;
  final String requesterId;
  final String name;
  final String location;
  final double royaltyPercent;
  final String workingHours;
  final String phone;

  const CreatePendingBranch({
    required this.franchiseId,
    required this.ownerId,
    required this.requesterId,
    required this.name,
    required this.location,
    required this.royaltyPercent,
    required this.workingHours,
    required this.phone,
  });

  @override
  List<Object?> get props => [
    franchiseId,
    ownerId,
    requesterId,
    name,
    location,
    royaltyPercent,
    workingHours,
    phone,
  ];
}

class LoadMyBranches extends BranchEvent {
  final String ownerId;

  const LoadMyBranches({required this.ownerId});

  @override
  List<Object?> get props => [ownerId];
}

class LoadBranchesForFranchise extends BranchEvent {
  final String franchiseId;

  const LoadBranchesForFranchise({required this.franchiseId});

  @override
  List<Object?> get props => [franchiseId];
}

class AddBranch extends BranchEvent {
  final FranchiseBranch branch;

  const AddBranch({required this.branch});

  @override
  List<Object?> get props => [branch];
}

class DeleteBranch extends BranchEvent {
  final String branchId;

  const DeleteBranch({required this.branchId});

  @override
  List<Object?> get props => [branchId];
}

class EditBranch extends BranchEvent {
  final FranchiseBranch branch;

  const EditBranch({required this.branch});

  @override
  List<Object?> get props => [branch];
}

class ModeratePendingBranch extends BranchEvent {
  final String pendingBranchId;
  final String status;
  final FranchiseBranch? branch;
  final String franchiseOwnerId;

  const ModeratePendingBranch({
    required this.pendingBranchId,
    required this.status,
    this.branch,
    required this.franchiseOwnerId,
  });

  @override
  List<Object?> get props => [pendingBranchId, status, branch, franchiseOwnerId];
}