import 'package:franch_hub/core/usecases/usecase.dart';
import 'package:franch_hub/features/auth/domain/repository/authentication_repository.dart';

class LogInWithGoogleUseCase implements UseCase<void,void>{
  final AuthenticationRepository _authRepository;

  LogInWithGoogleUseCase(this._authRepository);

  @override
  Future call({params}) {
    return _authRepository.logInWithGoogle();
  }
}