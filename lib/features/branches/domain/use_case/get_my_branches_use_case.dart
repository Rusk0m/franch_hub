import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/repositories/branch_repository.dart';

class GetMyBranchesUseCase implements UseCase<List<FranchiseBranch>, String> {
  final BranchRepository repository;

  GetMyBranchesUseCase(this.repository);

  @override
  Future<List<FranchiseBranch>> call({String? params}) {
    if (params == null) throw ArgumentError('ownerId is required');

    return repository.getMyBranches(params);
  }
}
