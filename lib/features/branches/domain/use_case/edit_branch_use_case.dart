import 'package:franch_hub/core/usecases/usecase.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/repositories/branch_repository.dart';

class EditBranchUseCase implements UseCase<void, FranchiseBranch> {
  final BranchRepository repository =sl();

  EditBranchUseCase();

  @override
  Future<void> call({FranchiseBranch? params}) async {
    if (params == null) throw ArgumentError('FranchiseBranch is required');
    await repository.editBranch(params);
  }
}