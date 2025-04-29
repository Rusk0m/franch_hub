import 'package:franch_hub/core/usecase/no_params.dart';
import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/features/moderation/domain/repositories/moderation_repository.dart';

class GetPendingFranchisesUseCase implements UseCase<List<Franchise>, NoParams> {
  final ModerationRepository repository;

  GetPendingFranchisesUseCase(this.repository);

  @override
  Future<List<Franchise>> call({NoParams? params}) {
    return repository.getPendingFranchises();
  }
}