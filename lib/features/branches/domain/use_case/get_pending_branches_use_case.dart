import 'package:franch_hub/core/usecases/stream_use_case.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/domain/entities/panding_franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/repositories/branch_repository.dart';

class GetPendingBranchesUseCase implements StreamUseCase<List<PendingFranchiseBranch>, String> {
  final BranchRepository repository =sl();

  GetPendingBranchesUseCase();

  @override
  Stream<List<PendingFranchiseBranch>> call({String? params}) {
    if (params == null) throw ArgumentError('ownerId is required');
    return repository.getPendingBranches(params);
  }
}