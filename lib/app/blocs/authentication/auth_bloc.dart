import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/app/models/user/user.dart';
import 'package:franch_hub/app/repositories/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository _authRepository;

  AuthBloc({required AuthenticationRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<SignUpRequested>(_onSignUpRequested);
    on<LoginRequested>(_onLoginRequested);
    on<GoogleLoginRequested>(_onGoogleLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<ToggleAuthMode>(_onToggleAuthMode);
  }

  Future<void> _onSignUpRequested(
      SignUpRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepository.signUp(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      emit(Authenticated(user: await _authRepository.user.first));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepository.logInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      // Получаем первого пользователя, если он существует
      final user = await _authRepository.user.first;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', user.uid);
      // Если пользователь найден, эмитим Authenticated
      emit(Authenticated(user: user));

    } catch (e) {
      emit(AuthError(message: e.toString()));
      print('Ошибка ${e.toString()}');
    }
  }

  Future<void> _onGoogleLoginRequested(
      GoogleLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepository.logInWithGoogle();
      emit(Authenticated(user: await _authRepository.user.first));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user_id');

      await _authRepository.logOut();
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onCheckAuthStatus(
      CheckAuthStatus event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id');

    if (userId != null) {
      // Получаем первого пользователя, если он существует
      final user = await _authRepository.user.first;
      // Пользователь найден, считаем его авторизованным
      emit(Authenticated(user: user));
    } else {
      // Пользователь не найден, отправляем на экран входа
      emit(Unauthenticated());
    }
  }

  Future<void> _onToggleAuthMode(
      ToggleAuthMode event, Emitter<AuthState>emit) async {
    emit(state is AuthInitial ? AuthRegistering() : AuthInitial());
  }
}