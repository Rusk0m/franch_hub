import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import '../entities/franchise.dart';

abstract class FranchiseRepository {
  Future<List<Franchise>> getMyFranchises(String ownerId); // франчайзер
}