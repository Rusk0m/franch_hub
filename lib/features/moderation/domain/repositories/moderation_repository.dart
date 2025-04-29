import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';

abstract class ModerationRepository {
  Future<List<Franchise>> getPendingFranchises();
  Future<void> moderateFranchise(String franchiseId, String status);
}