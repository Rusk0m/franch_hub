part of 'moderation_bloc.dart';

abstract class ModerationState extends Equatable {
  const ModerationState();

  @override
  List<Object?> get props => [];
}

class ModerationInitial extends ModerationState {}

class ModerationLoading extends ModerationState {}

class ModerationError extends ModerationState {
  final String message;

  const ModerationError({required this.message});

  @override
  List<Object?> get props => [message];
}

class ModerateBranchLoaded extends ModerationState {
  final List<PendingFranchiseBranch> pendingBranches;
  final Map<String, String> franchiseNames;

  const ModerateBranchLoaded({
    required this.pendingBranches,
    required this.franchiseNames,
  });

  @override
  List<Object?> get props => [pendingBranches, franchiseNames];
}

class ModerationFranchiseLoaded extends ModerationState {
  final List<Franchise> franchises;

  const ModerationFranchiseLoaded({required this.franchises});

  @override
  List<Object?> get props => [franchises];
}

class ModerationFranchiseSuccess extends ModerationState {}