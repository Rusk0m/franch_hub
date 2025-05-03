import 'package:franch_hub/core/usecases/usecase.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/repositories/branch_repository.dart';

class ModerateBranchUseCase implements UseCase<void, ModerateBranchParams> {
  final BranchRepository repository;

  ModerateBranchUseCase(this.repository);

  @override
  Future<void> call({ModerateBranchParams? params}) async {
    if (params == null) throw ArgumentError('ModerateBranchParams is required');
    await repository.moderateBranch(params.pendingBranchId, params.status, params.branch);
  }
}

class ModerateBranchParams {
  final String pendingBranchId;
  final String status;
  final FranchiseBranch? branch;

  ModerateBranchParams({
    required this.pendingBranchId,
    required this.status,
    this.branch,
  });
}