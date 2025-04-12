import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/features/auth/domain/repository/authentication_repository.dart';

class CheckAuthStatusUseCase implements UseCase<UserEntity?,void> {
  final AuthenticationRepository repository;

  CheckAuthStatusUseCase(this.repository);

  @override
  Future<UserEntity?> call({params}) async {
    return repository.currentUser;
  }
}