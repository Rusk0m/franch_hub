import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/data/data_soureces/branch_remote_data_source.dart';
import 'package:franch_hub/features/branches/data/models/franchise_branch/franchise_branch_model.dart';
import 'package:franch_hub/features/branches/data/models/pending_franchise_branch/pending_franchise_branch_model.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/entities/panding_franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/repositories/branch_repository.dart';

class BranchRepositoryImpl implements BranchRepository {
  final BranchRemoteDataSource remoteDataSource = sl();

  @override
  Future<List<FranchiseBranch>> getBranchesForFranchise(String franchiseId) async {
    try {
      final models = await remoteDataSource.getBranchesForFranchise(franchiseId);
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get branches for franchise: $e');
    }
  }

  @override
  Future<List<FranchiseBranch>> getMyBranches(String ownerId) async {
    try {
      final models = await remoteDataSource.getMyBranches(ownerId);
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get my branches: $e');
    }
  }

  @override
  Future<void> createPendingBranch(PendingFranchiseBranch pendingBranch) async {
    try {
      final pendingBranchModel = PendingFranchiseBranchModel.fromEntity(pendingBranch);
      await remoteDataSource.createPendingBranch(pendingBranchModel);
    } catch (e) {
      throw Exception('Failed to create pending branch: $e');
    }
  }

  @override
  Stream<List<PendingFranchiseBranch>> getPendingBranches(String ownerId) {
    try {
      return remoteDataSource.getPendingBranches(ownerId).map(
            (models) => models.map((model) => model.toEntity()).toList(),
      );
    } catch (e) {
      throw Exception('Failed to get pending branches: $e');
    }
  }

  @override
  Future<void> moderateBranch(String pendingBranchId, String status, FranchiseBranch? branch) async {
    try {
      final branchModel = branch != null ? FranchiseBranchModel.fromEntity(branch) : null;
      await remoteDataSource.moderateBranch(pendingBranchId, status, branchModel);
    } catch (e) {
      throw Exception('Failed to moderate branch: $e');
    }
  }

  @override
  Future<void> addBranch(FranchiseBranch branch) async {
    try {
      final branchModel = FranchiseBranchModel.fromEntity(branch);
      await remoteDataSource.addBranch(branchModel);
    } catch (e) {
      throw Exception('Failed to add branch: $e');
    }
  }
  @override
  Future<void> deleteBranch(String branchId) async {
    try {
      await remoteDataSource.deleteBranch(branchId);
    } catch (e) {
      throw Exception('Failed to delete branch: $e');
    }
  }

  @override
  Future<void> editBranch(FranchiseBranch branch) async {
    try {
      final branchModel = FranchiseBranchModel.fromEntity(branch);
      await remoteDataSource.editBranch(branchModel);
    } catch (e) {
      throw Exception('Failed to edit branch: $e');
    }
  }
}