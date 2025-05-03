import 'package:franch_hub/core/usecases/usecase.dart';
import 'package:franch_hub/features/profile/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase implements UseCase<void, UpdateProfileParams> {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  @override
  Future<void> call({UpdateProfileParams? params}) async {
    if (params == null) throw ArgumentError("Params can't be null");

    // Проверка на наличие хотя бы одного изменения
    final hasChanges = params.name != null ||
        params.phone != null ||
        params.avatarUrl != null;

    if (!hasChanges) {
      throw Exception();
    }

    await repository.updateProfile(params);
  }
}
class UpdateProfileParams {
  final String uid;
  final String? name;
  final String? phone;
  final String? avatarUrl;

  UpdateProfileParams({
    required this.uid,
    required this.name,
    required this.phone,
    required this.avatarUrl,
  });
}