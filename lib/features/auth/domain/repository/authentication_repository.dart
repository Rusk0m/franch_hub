import 'package:franch_hub/core/entities/user.dart';

abstract class AuthenticationRepository {
  /// Поток данных аутентифицированного пользователя
  Stream<UserEntity> get user;

  /// Регистрация с email и паролем
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  });

  /// Вход с email и паролем
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Вход через Google
  Future<void> logInWithGoogle();

  /// Выход из системы
  Future<void> logOut();

  /// Получение пользователя по ID
  Future<UserEntity> getUser(String uid);

  UserEntity? get currentUser;
}