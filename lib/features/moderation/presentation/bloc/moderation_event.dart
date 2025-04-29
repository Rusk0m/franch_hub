part of 'moderation_bloc.dart';

abstract class ModerationEvent extends Equatable {
  const ModerationEvent();

  @override
  List<Object?> get props => [];
}

class LoadPendingFranchises extends ModerationEvent {}

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