import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/data/models/franchise_branch/franchise_branch_model.dart';

abstract class BranchRemoteDataSource{
  Future<List<FranchiseBranchModel>> getBranchesForFranchise(String franchiseId);
  Future<List<FranchiseBranchModel>> getMyBranches(String ownerId);
}

class BranchRemoteDataSourceImpl implements BranchRemoteDataSource{
  final FirebaseFirestore firestore = sl();
  @override
  Future<List<FranchiseBranchModel>> getBranchesForFranchise(String franchiseId) async {
    final snapshot = await firestore
        .collection('franchiseBranches')
        .where('franchiseId', isEqualTo: franchiseId)
        .get();

    return snapshot.docs
        .map((doc) => FranchiseBranchModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<List<FranchiseBranchModel>> getMyBranches(String ownerId) async {
    final snapshot = await firestore
        .collection('franchiseBranches')
        .where('ownerId', isEqualTo: ownerId)
        .get();

    return snapshot.docs
        .map((doc) => FranchiseBranchModel.fromJson(doc.data()))
        .toList();
  }

}