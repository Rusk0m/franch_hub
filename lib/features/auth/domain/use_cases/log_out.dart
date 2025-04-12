import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/features/auth/domain/repository/authentication_repository.dart';

class LogOutUseCase implements UseCase<void,void>{
  final AuthenticationRepository _authrepository;

  LogOutUseCase(this._authrepository);

  @override
  Future call({params}) {
    return _authrepository.logOut();
  }

}