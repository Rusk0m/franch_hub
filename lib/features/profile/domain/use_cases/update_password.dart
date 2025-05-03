import 'package:franch_hub/core/usecases/usecase.dart';
import 'package:franch_hub/features/profile/domain/repositories/profile_repository.dart';

class UpdatePasswordUseCase implements UseCase<void, UpdatePasswordParams> {
  ProfileRepository repository;

  UpdatePasswordUseCase(this.repository);

  @override
  Future<void> call({UpdatePasswordParams? params}) async {
    if (params == null) throw ArgumentError("Params can't be null");

    await repository.updatePassword(params);
  }
}

class UpdatePasswordParams {
  final String uid;
  final String newPassword;

  UpdatePasswordParams({required this.uid, required this.newPassword});
}
