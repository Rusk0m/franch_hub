import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/repositories/branch_repository.dart';

class GetBranchesForFranchiseUseCase implements UseCase<List<FranchiseBranch>, String> {
  final BranchRepository repository;

  GetBranchesForFranchiseUseCase(this.repository);

  @override
  Future<List<FranchiseBranch>> call({String? params}) {
    if (params == null) throw ArgumentError('franchiseId is required');

    return repository.getBranchesForFranchise(params);
  }
}
