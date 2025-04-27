import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';

abstract class BranchRepository {
  Future<List<FranchiseBranch>> getBranchesForFranchise(String franchiseId); // точки одной франшизы
  Future<List<FranchiseBranch>> getMyBranches(String ownerId); // франчайзи
}