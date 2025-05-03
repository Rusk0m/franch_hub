part of 'moderation_bloc.dart';

abstract class ModerationState extends Equatable {
  const ModerationState();

  @override
  List<Object?> get props => [];
}

class ModerationInitial extends ModerationState {}

class ModerationLoading extends ModerationState {}

class ModerationFranchiseLoaded extends ModerationState {
  final Map<Franchise, UserEntity> franchises;

  const ModerationFranchiseLoaded({required this.franchises});

  @override
  List<Object?> get props => [franchises];
}

class ModerateBranchLoaded extends ModerationState {
  final List<PendingFranchiseBranch> pendingBranches;

  const ModerateBranchLoaded({required this.pendingBranches});

  @override
  List<Object?> get props => [pendingBranches];
}

class ModerateBranchSuccess extends ModerationState {}

class ModerationError extends ModerationState {
  final String message;

  const ModerationError({required this.message});

  @override
  List<Object?> get props => [message];
}