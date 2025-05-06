import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/features/franchise/data/models/franchise/franchise_model.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';

abstract class ModerationRemoteDataSource {
  Future<List<Franchise>> getPendingFranchises();
  Future<void> moderateFranchise(String franchiseId, String status);
}

class ModerationRemoteDataSourceImpl implements ModerationRemoteDataSource {
  final FirebaseFirestore firestore;

  ModerationRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<Franchise>> getPendingFranchises() async {
    try {
      final snapshot = await firestore
          .collection('pending_franchises')
          .where('status', isEqualTo: 'pending')
          .get();
      return snapshot.docs
          .map((doc) => FranchiseModel.fromJson(doc.data()).toEntity())
          .toList();
    } catch (e) {
      throw Exception('failedToGetPendingFranchises|$e');
    }
  }

  @override
  Future<void> moderateFranchise(String franchiseId, String status) async {
    try {
      await firestore.collection('pending_franchises').doc(franchiseId).update({
        'status': status,
        'moderatedAt': Timestamp.now(),
      });
      if (status == 'approved') {
        final pendingDoc = await firestore.collection('pending_franchises').doc(franchiseId).get();
        if (pendingDoc.exists && pendingDoc.data() != null) {
          final franchiseData = pendingDoc.data()!;
          await firestore.collection('franchises').doc(franchiseId).set(franchiseData);
        }
      }
    } catch (e) {
      throw Exception('failedToModerateFranchise|$e');
    }
  }
}