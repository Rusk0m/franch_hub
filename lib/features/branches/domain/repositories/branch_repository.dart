import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/entities/panding_franchise_branch.dart';

abstract class BranchRepository {
  Future<List<FranchiseBranch>> getBranchesForFranchise(String franchiseId); // точки одной франшизы
  Future<List<FranchiseBranch>> getMyBranches(String ownerId); // франчайзи
  Future<void> createPendingBranch(PendingFranchiseBranch pendingBranch);
  Stream<List<PendingFranchiseBranch>> getPendingBranches(String ownerId);
  Future<void> moderateBranch(String pendingBranchId, String status, FranchiseBranch? branch);
  Future<void> addBranch(FranchiseBranch branch);
  Future<void> deleteBranch(String branchId);
  Future<void> editBranch(FranchiseBranch branch);
}