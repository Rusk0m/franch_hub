import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/features/moderation/domain/repositories/moderation_repository.dart';

class ModerateFranchiseUseCase implements UseCase<void, ModerateFranchiseParams> {
  final ModerationRepository repository;

  ModerateFranchiseUseCase(this.repository);

  @override
  Future<void> call({ModerateFranchiseParams? params}) {
    if (params == null) throw ArgumentError('Params is required');
    return repository.moderateFranchise(params.franchiseId, params.status);
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