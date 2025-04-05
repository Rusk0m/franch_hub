import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/features/auth/domain/repository/authentication_repository.dart';

class LogInWithEmailUseCase implements UseCase<void, LogInParams> {
  final AuthenticationRepository repository;

  LogInWithEmailUseCase(this.repository);

  @override
  Future<void> call({LogInParams? params}) {
    if (params == null) {
      throw ArgumentError("Params can't be null");
    }
    return repository.logInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class LogInParams {
  final String email;
  final String password;

  LogInParams({required this.email, required this.password});
}
