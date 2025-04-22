import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/franchise/data/models/transaction/transaction_model.dart';
import 'package:franch_hub/features/franchise/domain/entities/transaction.dart';

abstract class TransactionRemoteDataSource {
  Future<void> createTransaction(TransactionModel transaction);
  Future<List<TransactionModel>> getTransactionsForBranch(String branchId);
  Future<List<TransactionModel>> getFilteredTransactions({
    required String branchId,
    String? type,
    DateTime? startDate,
    DateTime? endDate,
  });
}


class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  final FirebaseFirestore firestore = sl();

  TransactionRemoteDataSourceImpl();

  @override
  Future<void> createTransaction(TransactionModel transaction) async {
    await firestore.collection('transactions').doc(transaction.id).set(transaction.toJson());
  }

  @override
  Future<List<TransactionModel>> getTransactionsForBranch(String branchId) async {
    final snapshot = await firestore
        .collection('transactions')
        .where('branchId', isEqualTo: branchId)
        .get();

    return snapshot.docs
        .map((doc) => TransactionModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<List<TransactionModel>> getFilteredTransactions({
    required String branchId,
    String? type,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    var query = firestore.collection('transactions')
        .where('branchId', isEqualTo: branchId);

    if (type != null) {
      query = query.where('type', isEqualTo: type);
    }

    if (startDate != null) {
      query = query.where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate));
    }

    if (endDate != null) {
      query = query.where('date', isLessThanOrEqualTo: Timestamp.fromDate(endDate));
    }

    final snapshot = await query.get();

    return snapshot.docs.map((doc) => TransactionModel.fromJson(doc.data())).toList();
  }
}
