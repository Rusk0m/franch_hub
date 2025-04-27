import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/data/data_soureces/branch_remote_data_source.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/repositories/branch_repository.dart';

class BranchRepositoryImpl implements BranchRepository{
  BranchRemoteDataSource remoteDataSource = sl();
  @override
  Future<List<FranchiseBranch>> getBranchesForFranchise(String franchiseId) async {
    final models = await remoteDataSource.getBranchesForFranchise(franchiseId);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<FranchiseBranch>> getMyBranches(String ownerId) async {
    final models = await remoteDataSource.getMyBranches(ownerId);
    return models.map((model) => model.toEntity()).toList();
  }

}