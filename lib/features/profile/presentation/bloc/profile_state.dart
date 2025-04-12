part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileEditReady extends ProfileState {
  final String uid;
  final String name;
  final String phone;
  final String? avatarUrl;

  const ProfileEditReady({
    required this.uid,
    required this.name,
    required this.phone,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [uid, name, phone, avatarUrl];
}

class ProfileUpdateSuccess extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object> get props => [message];
}