import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/features/auth/data/repository/authentication_repository_impl.dart';
import 'package:franch_hub/features/auth/domain/repository/authentication_repository.dart';
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
    on<UpdateUser>((event, emit) {
      print('AuthBloc: UpdateUser with UID: ${event.user.uid}');
      emit(Authenticated(user: event.user));
    });
  }

  Future<void> _onSignUpRequested(
      SignUpRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      print('AuthBloc: SignUpRequested for ${event.email}');
      await _authRepository.signUp(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      final user = await _authRepository.user.first;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', user.uid);
      print('AuthBloc: SignUp successful, UID: ${user.uid}');
      emit(Authenticated(user: user));
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      print('AuthBloc: SignUp error: ${e.message}');
      emit(AuthError(message: e.message));
      emit(Unauthenticated());
    } catch (e) {
      print('AuthBloc: SignUp unknown error: $e');
      emit(AuthError(message: 'Unknown error occurred'));
      emit(Unauthenticated());
    }
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      print('AuthBloc: LoginRequested for ${event.email}');
      await _authRepository.logInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      final user = await _authRepository.user.first;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', user.uid);
      print('AuthBloc: Login successful, UID: ${user.uid}');
      emit(Authenticated(user: user));
    } catch (e) {
      print('AuthBloc: Login error: $e');
      emit(AuthError(message: 'Unknown error occurred'));
      emit(Unauthenticated());
    }
  }

  Future<void> _onGoogleLoginRequested(
      GoogleLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      print('AuthBloc: GoogleLoginRequested');
      await _authRepository.logInWithGoogle();
      final user = await _authRepository.user.first;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', user.uid);
      print('AuthBloc: Google login successful, UID: ${user.uid}');
      emit(Authenticated(user: user));
    } on LogInWithGoogleFailure catch (e) {
      print('AuthBloc: Google login error: ${e.message}');
      emit(AuthError(message: e.message));
      emit(Unauthenticated());
    } catch (e) {
      print('AuthBloc: Google login unknown error: $e');
      emit(AuthError(message: 'Unknown error occurred'));
      emit(Unauthenticated());
    }
  }

  Future<void> _onCheckAuthStatus(
      CheckAuthStatus event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      print('AuthBloc: CheckAuthStatus');
      final firebaseUser = _authRepository.currentUser;
      if (firebaseUser != null) {
        final user = await _authRepository.getUser(firebaseUser.uid);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_id', user.uid);
        print('AuthBloc: CheckAuthStatus - User found, UID: ${user.uid}');
        emit(Authenticated(user: user));
      } else {
        print('AuthBloc: CheckAuthStatus - No user');
        emit(Unauthenticated());
      }
    } catch (e) {
      print('AuthBloc: CheckAuthStatus error: $e');
      emit(AuthError(message: 'Ошибка проверки авторизации: $e'));
      emit(Unauthenticated());
    }
  }

  Future<void> _onToggleAuthMode(
      ToggleAuthMode event, Emitter<AuthState> emit) async {
    print('AuthBloc: ToggleAuthMode');
    if (state is AuthRegistering) {
      emit(Unauthenticated());
    } else {
      emit(AuthRegistering());
    }
  }

  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      print('AuthBloc: LogoutRequested');
      await _authRepository.logOut();
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user_id');
      print('AuthBloc: Logout successful');
      emit(Unauthenticated());
    } catch (e) {
      print('AuthBloc: Logout error: $e');
      emit(AuthError(message: 'Ошибка выхода: $e'));
      emit(Unauthenticated());
    }
  }
}
