import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/features/franchise/data/models/franchise/franchise_model.dart';

abstract class ModerationRemoteDataSource {
  Future<List<FranchiseModel>> getPendingFranchises();
  Future<void> moderateFranchise(String franchiseId, String status);
}

class ModerationRemoteDataSourceImpl implements ModerationRemoteDataSource {
  final FirebaseFirestore firestore;

  ModerationRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<FranchiseModel>> getPendingFranchises() async {
    final snapshot = await firestore
        .collection('pending_franchises')
        .where('status', isEqualTo: 'pending')
        .get();
    return snapshot.docs
        .map((doc) => FranchiseModel.fromJson({
      ...doc.data(),
      'id': doc.id,
    }))
        .toList();
  }

  @override
  Future<void> moderateFranchise(String franchiseId, String status) async {
    final docRef = firestore.collection('pending_franchises').doc(franchiseId);
    if (status == 'approved') {
      final franchiseData = await docRef.get();
      if (franchiseData.exists) {
        await firestore
            .collection('franchises')
            .doc(franchiseId)
            .set(franchiseData.data()!);
        await docRef.delete();
      }
    } else if (status == 'rejected') {
      await docRef.update({'status': 'rejected'});
    }
  }
}