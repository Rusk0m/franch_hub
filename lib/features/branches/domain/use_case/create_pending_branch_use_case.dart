import 'package:franch_hub/core/usecases/usecase.dart';
import 'package:franch_hub/features/branches/domain/entities/panding_franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/repositories/branch_repository.dart';

class CreatePendingBranchUseCase implements UseCase<void, PendingFranchiseBranch> {
  final BranchRepository repository;

  CreatePendingBranchUseCase(this.repository);

  @override
  Future<void> call({PendingFranchiseBranch? params}) async {
    if (params == null) throw ArgumentError('PendingFranchiseBranch is required');
    await repository.createPendingBranch(params);
  }
}