import 'package:franch_hub/core/usecases/usecase.dart';
import 'package:franch_hub/features/auth/domain/repository/authentication_repository.dart';

class SignUpUseCase implements UseCase<void, SignUpParams> {
  final AuthenticationRepository _authRepository;

  SignUpUseCase(this._authRepository);

  @override
  Future<void> call({SignUpParams? params}) {
    if (params == null) {
      throw ArgumentError("Params can't be null");
    }
    return _authRepository.signUp(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;

  SignUpParams({required this.name, required this.email, required this.password});
}
