part of 'auth_bloc.dart';


abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class SignUpRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final BuildContext context;

  const SignUpRequested({
    required this.name,
    required this.email,
    required this.password,
    required this.context,
  });

  @override
  List<Object?> get props => [name, email, password, context];
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;

  const LoginRequested({
    required this.email,
    required this.password,
    required this.context,
  });

  @override
  List<Object?> get props => [email, password, context];
}

class GoogleLoginRequested extends AuthEvent {
  final BuildContext context;

  const GoogleLoginRequested({required this.context});

  @override
  List<Object?> get props => [context];
}

class LogoutRequested extends AuthEvent {
  final BuildContext context;

  const LogoutRequested({required this.context});

  @override
  List<Object?> get props => [context];
}

class CheckAuthStatus extends AuthEvent {
  final BuildContext context;

  const CheckAuthStatus({required this.context});

  @override
  List<Object?> get props => [context];
}

class ToggleAuthMode extends AuthEvent {}

class UpdateUser extends AuthEvent {
  final UserEntity user;

  const UpdateUser({required this.user});

  @override
  List<Object?> get props => [user];
}