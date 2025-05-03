
import 'package:franch_hub/core/usecases/usecase.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/moderation/domain/repositories/moderation_repository.dart';

class ModerateFranchiseUseCase implements UseCase<void, ModerateFranchiseParams> {
  final ModerationRepository repository = sl();

  ModerateFranchiseUseCase();

  @override
  Future<void> call({ModerateFranchiseParams? params}) async {
    if (params == null) throw ArgumentError('ModerateFranchiseParams is required');
    await repository.moderateFranchise(params.franchiseId, params.status);
  }
}

class ModerateFranchiseParams {
  final String franchiseId;
  final String status;

  ModerateFranchiseParams({
    required this.franchiseId,
    required this.status,
  });
}