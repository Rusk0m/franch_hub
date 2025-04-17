import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/features/franchise/data/models/franchise/franchise_model.dart';
import 'package:franch_hub/features/franchise/data/models/franchise_branch/franchise_branch_model.dart';

abstract class FranchiseRemoteDataSource {
  Future<List<FranchiseModel>> getMyFranchises(String ownerId);
  Future<List<FranchiseBranchModel>> getBranchesForFranchise(String franchiseId);
  Future<List<FranchiseBranchModel>> getMyBranches(String ownerId);
}
class FranchiseRemoteDataSourceImpl implements FranchiseRemoteDataSource {
  final FirebaseFirestore firestore;

  FranchiseRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<FranchiseModel>> getMyFranchises(String ownerId) async {
    final snapshot = await firestore
        .collection('franchises')
        .where('ownerId', isEqualTo: ownerId)
        .get();

    return snapshot.docs
        .map((doc) => FranchiseModel.fromJson(doc.data()))
        .toList();
  }

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
