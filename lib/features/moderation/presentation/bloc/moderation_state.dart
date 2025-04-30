part of 'moderation_bloc.dart';

abstract class ModerationState extends Equatable {
  const ModerationState();

  @override
  List<Object?> get props => [];
}

class ModerationInitial extends ModerationState {}

class ModerationLoading extends ModerationState {}

class ModerationLoaded extends ModerationState {
  final Map<Franchise, UserEntity> franchises;

  const ModerationLoaded({required this.franchises});

  @override
  List<Object?> get props => [franchises];
}

class ModerationError extends ModerationState {
  final String message;

  const ModerationError({required this.message});

  @override
  List<Object?> get props => [message];
}