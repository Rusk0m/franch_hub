part of 'profile_bloc.dart';

class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadProfile extends ProfileEvent {
  final String uid;
  const LoadProfile(this.uid);

  @override
  List<Object> get props => [uid];
}

class UpdateProfile extends ProfileEvent {
  final String uid;
  final String? name;
  final String? phone;
  final String? avatarUrl;

  const UpdateProfile({
    required this.uid,
    this.name,
    this.phone,
    this.avatarUrl,
  });

  @override
  List<Object> get props => [uid];
}

class UpdatePassword extends ProfileEvent {
  final String uid;
  final String oldPassword;
  final String newPassword;

  const UpdatePassword({
    required this.uid,
    required this.oldPassword,
    required this.newPassword,
  });

  @override
  List<Object> get props => [uid, oldPassword, newPassword];
}

class UploadAvatar extends ProfileEvent {
  final String uid;
  final File imageFile;

  const UploadAvatar({
    required this.uid,
    required this.imageFile,
  });

  @override
  List<Object> get props => [uid, imageFile];
}

class ResetProfileState extends ProfileEvent {}