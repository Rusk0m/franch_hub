import 'package:franch_hub/features/franchise/domain/entities/franchise_branch.dart';
import '../entities/franchise.dart';

abstract class FranchiseRepository {
  Future<List<Franchise>> getMyFranchises(String ownerId); // франчайзер
  Future<List<FranchiseBranch>> getBranchesForFranchise(String franchiseId); // точки одной франшизы
  Future<List<FranchiseBranch>> getMyBranches(String ownerId); // франчайзи
}