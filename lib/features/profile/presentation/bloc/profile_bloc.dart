import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/auth/domain/repository/authentication_repository.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:franch_hub/features/profile/domain/use_cases/update_password.dart';
import 'package:franch_hub/features/profile/domain/use_cases/update_profile.dart';
import 'dart:io';

part 'profile_state.dart';
part 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthenticationRepository authRepository; // Добавляем репозиторий

  // Получаем use cases через get_it
  final UpdateProfileUseCase _updateProfile = sl<UpdateProfileUseCase>();
  final UpdatePasswordUseCase _updatePassword = sl<UpdatePasswordUseCase>();

  ProfileBloc({
    required this.authRepository,
  }) : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
    on<UpdatePassword>(_onUpdatePassword);
  }

  Future<void> _onLoadProfile(
      LoadProfile event,
      Emitter<ProfileState> emit,
      ) async {
    emit(ProfileLoading());

    try {
      final user = await authRepository.getUser(event.uid);

      emit(ProfileEditReady(
        uid: user.uid,
        name: user.name ?? '',
        phone: user.phone ?? '',
        avatarUrl: user.avatarUrl,
      ));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
  Future<void> _onUpdateProfile(
      UpdateProfile event,
      Emitter<ProfileState> emit,
      ) async {
    try {
      await _updateProfile.call(
        params: UpdateProfileParams(
          uid: event.uid,
          name: event.name,
          phone: event.phone,
          avatarUrl: event.avatarUrl,
        ),
      );

      // Получаем обновлённого пользователя
      final updatedUser = await authRepository.getUser(event.uid);

      // Обновляем AuthBloc
      sl<AuthBloc>().add(UpdateUser(updatedUser));

      emit(ProfileUpdateSuccess());
      add(LoadProfile(event.uid));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }


  Future<void> _onUpdatePassword(
      UpdatePassword event,
      Emitter<ProfileState> emit,
      ) async {
    try {
      await _updatePassword.call(
        params: UpdatePasswordParams(
          uid: event.uid,
          newPassword: event.newPassword,
        ),
      );
      emit(ProfileUpdateSuccess());
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}