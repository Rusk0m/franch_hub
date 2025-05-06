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
  final BuildContext context;

  const CreatePendingBranch({
    required this.franchiseId,
    required this.ownerId,
    required this.requesterId,
    required this.name,
    required this.location,
    required this.royaltyPercent,
    required this.workingHours,
    required this.phone,
    required this.context,
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
    context,
  ];
}

class LoadMyBranches extends BranchEvent {
  final String ownerId;
  final BuildContext context;

  const LoadMyBranches({required this.ownerId, required this.context});

  @override
  List<Object?> get props => [ownerId, context];
}

class LoadBranchesForFranchise extends BranchEvent {
  final String franchiseId;
  final BuildContext context;

  const LoadBranchesForFranchise({required this.franchiseId, required this.context});

  @override
  List<Object?> get props => [franchiseId, context];
}

class AddBranch extends BranchEvent {
  final FranchiseBranch branch;
  final BuildContext context;

  const AddBranch({required this.branch, required this.context});

  @override
  List<Object?> get props => [branch, context];
}

class DeleteBranch extends BranchEvent {
  final String branchId;
  final BuildContext context;

  const DeleteBranch({required this.branchId, required this.context});

  @override
  List<Object?> get props => [branchId, context];
}

class EditBranch extends BranchEvent {
  final FranchiseBranch branch;
  final BuildContext context;

  const EditBranch({required this.branch, required this.context});

  @override
  List<Object?> get props => [branch, context];
}

class ModeratePendingBranch extends BranchEvent {
  final String pendingBranchId;
  final String status;
  final FranchiseBranch? branch;
  final String franchiseOwnerId;
  final BuildContext context;

  const ModeratePendingBranch({
    required this.pendingBranchId,
    required this.status,
    required this.branch,
    required this.franchiseOwnerId,
    required this.context,
  });

  @override
  List<Object?> get props => [pendingBranchId, status, branch, franchiseOwnerId, context];
}

class ResetBranchState extends BranchEvent {}