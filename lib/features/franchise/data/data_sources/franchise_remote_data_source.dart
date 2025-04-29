import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/features/franchise/data/models/franchise/franchise_model.dart';

abstract class FranchiseRemoteDataSource {
  Future<List<FranchiseModel>> getMyFranchises(String ownerId);
  Future<void> createFranchise(FranchiseModel franchise);
  Future<List<FranchiseModel>> getAllFranchises();
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
        .map((doc) => FranchiseModel.fromJson({
      ...doc.data(),
      'id': doc.id,
    }))
        .toList();
  }

  @override
  Future<void> createFranchise(FranchiseModel franchise) async {
    final docRef = firestore.collection('pending_franchises').doc();
    final franchiseWithId = FranchiseModel(
      id: docRef.id,
      ownerId: franchise.ownerId,
      name: franchise.name,
      description: franchise.description,
      industry: franchise.industry,
      city: franchise.city,
      startupCost: franchise.startupCost,
      royaltyPercent: franchise.royaltyPercent,
      createdAt: franchise.createdAt,
      status: 'pending',
    );
    await docRef.set(franchiseWithId.toJson());
  }

  @override
  Future<List<FranchiseModel>> getAllFranchises() async {
    final snapshot = await firestore.collection('franchises').get();
    return snapshot.docs
        .map((doc) => FranchiseModel.fromJson({
      ...doc.data(),
      'id': doc.id,
    }))
        .toList();
  }
}