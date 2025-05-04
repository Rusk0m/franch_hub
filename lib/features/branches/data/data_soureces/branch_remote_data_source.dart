import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/data/models/franchise_branch/franchise_branch_model.dart';
import 'package:franch_hub/features/branches/data/models/pending_franchise_branch/pending_franchise_branch_model.dart';

abstract class BranchRemoteDataSource {
  Future<List<FranchiseBranchModel>> getBranchesForFranchise(String franchiseId);
  Future<List<FranchiseBranchModel>> getMyBranches(String ownerId);
  Future<void> createPendingBranch(PendingFranchiseBranchModel pendingBranch);
  Stream<List<PendingFranchiseBranchModel>> getPendingBranches(String ownerId);
  Future<void> moderateBranch(String pendingBranchId, String status, FranchiseBranchModel? branch);
  Future<void> addBranch(FranchiseBranchModel branch);
  Future<void> deleteBranch(String branchId);
  Future<void> editBranch(FranchiseBranchModel branch);
}

class BranchRemoteDataSourceImpl implements BranchRemoteDataSource {
  final FirebaseFirestore firestore = sl();

  @override
  Future<List<FranchiseBranchModel>> getBranchesForFranchise(String franchiseId) async {
    try {
      print('BranchRemoteDataSource: Querying franchiseBranches for franchiseId: $franchiseId');
      final snapshot = await firestore
          .collection('franchiseBranches')
          .where('franchiseId', isEqualTo: franchiseId)
          .get();
      print('BranchRemoteDataSource: Found ${snapshot.docs.length} franchiseBranches for franchiseId: $franchiseId');
      return snapshot.docs.map((doc) {
        final data = doc.data();
        print('BranchRemoteDataSource: Branch data: $data');
        if (data['id'] == null || data['ownerId'] == null || data['name'] == null) {
          print('BranchRemoteDataSource: Invalid branch data: $data');
          throw Exception('Invalid branch data for doc ${doc.id}');
        }
        return FranchiseBranchModel.fromJson(data);
      }).toList();
    } catch (e) {
      print('BranchRemoteDataSource: Error getting franchiseBranches: $e');
      throw Exception('Failed to get franchiseBranches: $e');
    }
  }

  @override
  Future<List<FranchiseBranchModel>> getMyBranches(String ownerId) async {
    try {
      print('BranchRemoteDataSource: Querying franchiseBranches for ownerId: $ownerId');
      final snapshot = await firestore
          .collection('franchiseBranches')
          .where('ownerId', isEqualTo: ownerId)
          .get();
      print('BranchRemoteDataSource: Found ${snapshot.docs.length} franchiseBranches for ownerId: $ownerId');
      return snapshot.docs.map((doc) {
        final data = doc.data();
        print('BranchRemoteDataSource: Branch data: $data');
        if (data['id'] == null || data['ownerId'] == null || data['name'] == null) {
          print('BranchRemoteDataSource: Invalid branch data: $data');
          throw Exception('Invalid branch data for doc ${doc.id}');
        }
        return FranchiseBranchModel.fromJson(data);
      }).toList();
    } catch (e) {
      print('BranchRemoteDataSource: Error getting my franchiseBranches: $e');
      throw Exception('Failed to get my franchiseBranches: $e');
    }
  }

  @override
  Future<void> createPendingBranch(PendingFranchiseBranchModel pendingBranch) async {
    try {
      await firestore
          .collection('pending_branches')
          .doc(pendingBranch.id)
          .set(pendingBranch.toJson());
    } catch (e) {
      print('BranchRemoteDataSource: Error creating pending branch: $e');
      throw Exception('Failed to create pending branch: $e');
    }
  }

  @override
  Stream<List<PendingFranchiseBranchModel>> getPendingBranches(String ownerId) {
    print('BranchRemoteDataSource: Streaming pending franchiseBranches for ownerId: $ownerId');
    return firestore
        .collection('pending_branches')
        .where('ownerId', isEqualTo: ownerId)
        .where('status', isEqualTo: 'pending')
        .snapshots()
        .map((snapshot) {
      print('BranchRemoteDataSource: Found ${snapshot.docs.length} pending franchiseBranches');
      return snapshot.docs
          .map((doc) => PendingFranchiseBranchModel.fromFirestore(doc))
          .toList();
    });
  }

  @override
  Future<void> moderateBranch(String pendingBranchId, String status, FranchiseBranchModel? branch) async {
    try {
      if (status == 'approved' && branch != null) {
        // Создаем филиал в franchiseBranches
        await firestore.collection('franchiseBranches').doc(branch.id).set(branch.toJson());
        // Удаляем заявку из pending_branches
        await firestore.collection('pending_branches').doc(pendingBranchId).delete();
      } else if (status == 'rejected') {
        // Удаляем заявку из pending_branches при отклонении
        await firestore.collection('pending_branches').doc(pendingBranchId).delete();
      } else {
        // Обновляем статус в pending_branches для других случаев
        await firestore.collection('pending_branches').doc(pendingBranchId).update({
          'status': status,
          'moderatedAt': Timestamp.now(),
        });
      }
    } catch (e) {
      print('BranchRemoteDataSource: Error moderating branch: $e');
      throw Exception('Failed to moderate branch: $e');
    }
  }

  @override
  Future<void> addBranch(FranchiseBranchModel branch) async {
    try {
      await firestore.collection('franchiseBranches').doc(branch.id).set(branch.toJson());
    } catch (e) {
      print('BranchRemoteDataSource: Error adding branch: $e');
      throw Exception('Failed to add branch: $e');
    }
  }

  @override
  Future<void> deleteBranch(String branchId) async {
    try {
      await firestore.collection('franchiseBranches').doc(branchId).delete();
    } catch (e) {
      print('BranchRemoteDataSource: Error deleting branch: $e');
      throw Exception('Failed to delete branch: $e');
    }
  }

  @override
  Future<void> editBranch(FranchiseBranchModel branch) async {
    try {
      // Check if the document exists
      final docSnapshot = await firestore.collection('franchiseBranches').doc(branch.id).get();
      if (!docSnapshot.exists) {
        print('BranchRemoteDataSource: Branch document with id ${branch.id} does not exist');
        throw Exception('Branch with ID ${branch.id} does not exist');
      }
      // Proceed with update
      await firestore.collection('franchiseBranches').doc(branch.id).update(branch.toJson());
      print('BranchRemoteDataSource: Successfully updated branch with id ${branch.id}');
    } catch (e) {
      print('BranchRemoteDataSource: Error editing branch: $e');
      throw Exception('Failed to edit branch: $e');
    }
  }
}