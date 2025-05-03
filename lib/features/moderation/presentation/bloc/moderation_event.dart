part of 'moderation_bloc.dart';

abstract class ModerationEvent extends Equatable {
  const ModerationEvent();

  @override
  List<Object?> get props => [];
}

class LoadModerationData extends ModerationEvent {
  final String userId;

  const LoadModerationData({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class ModerateFranchiseEvent extends ModerationEvent {
  final String franchiseId;
  final String status;

  const ModerateFranchiseEvent({
    required this.franchiseId,
    required this.status,
  });

  @override
  List<Object?> get props => [franchiseId, status];
}

class ModerateBranch extends ModerationEvent {
  final String pendingBranchId;
  final String status;
  final String franchiseId;
  final String ownerId;
  final String name;
  final String location;
  final double royaltyPercent;
  final String workingHours;
  final String phone;
  final String requesterId;

  const ModerateBranch({
    required this.pendingBranchId,
    required this.status,
    required this.franchiseId,
    required this.ownerId,
    required this.name,
    required this.location,
    required this.royaltyPercent,
    required this.workingHours,
    required this.phone,
    required this.requesterId,
  });

  @override
  List<Object?> get props => [
    pendingBranchId,
    status,
    franchiseId,
    ownerId,
    name,
    location,
    royaltyPercent,
    workingHours,
    phone,
    requesterId,
  ];
}