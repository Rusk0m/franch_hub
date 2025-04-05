import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/features/auth/data/repository/authentication_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepositoryImpl _authRepository;

  AuthBloc({required AuthenticationRepositoryImpl authRepository})
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
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(AuthError(message: e.toString()));
    }
    catch(e){
      emit(AuthError(message: 'Unknown error occurred'));
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

      print(user.name);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', user.uid);
      // Если пользователь найден, эмитим Authenticated
      emit(Authenticated(user: user));

    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(AuthError(message: e.toString()));
      emit(Unauthenticated());
    }
    catch(e){
      emit(AuthError(message: 'Unknown error occurred'));
      emit(Unauthenticated());
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


  Future<void> _onCheckAuthStatus(
      CheckAuthStatus event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final firebaseUser = _authRepository.currentUser;

      if (firebaseUser != null) {
        final user = await _authRepository.getUser(firebaseUser.uid);
        emit(Authenticated(user: user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: 'Ошибка проверки авторизации'));
      emit(Unauthenticated());
    }
  }

  Future<void> _onToggleAuthMode(
      ToggleAuthMode event, Emitter<AuthState>emit) async {
    // Переключаем между Unauthenticated и AuthRegistering
    if (state is AuthRegistering) {
      emit(Unauthenticated());
    } else {
      emit(AuthRegistering()); // <--- Используем новое состояние
    }
    print('Current state: ${state.runtimeType}');
  }
  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepository.logOut();
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(message: 'Ошибка выхода'));
      emit(Unauthenticated());
    }
  }
}
