import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/features/auth/domain/repository/authentication_repository.dart';

class GetUserUseCase implements UseCase<UserEntity, GetUserParams> {
  final AuthenticationRepository _authRepository;

  GetUserUseCase(this._authRepository);

  @override
  Future<UserEntity> call({GetUserParams? params}) {
    if (params == null) {
      throw ArgumentError("Params can't be null");
    }
    return _authRepository.getUser(params.uid);
  }
}

class GetUserParams {
  final String uid;

  GetUserParams({required this.uid});
}
