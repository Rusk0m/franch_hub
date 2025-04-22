import 'package:franch_hub/features/franchise/domain/entities/transaction.dart';

abstract class TransactionRepository {
  Future<void> createTransaction(TransactionEntity transaction);
  Future<List<TransactionEntity>> getTransactionsForBranch(String branchId);
  Future<List<TransactionEntity>> getFilteredTransactions({
    required String branchId,
    String? type,         // Например: income, expense
    DateTime? startDate,
    DateTime? endDate,
  });
}
