part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}
class AuthInitial extends AuthState {}

// Состояние для регистрации
class AuthRegistering extends AuthState {}

//Показывает индикатор загрузки
class AuthLoading extends AuthState {}

//Пользователь вошел в систему
class Authenticated extends AuthState {
  final User user;
  Authenticated({required this.user});

  @override
  List<Object?> get props => [user];
}

//Ошибка входа
class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}

//Пользователь вышел из системы
class Unauthenticated extends AuthState {}

