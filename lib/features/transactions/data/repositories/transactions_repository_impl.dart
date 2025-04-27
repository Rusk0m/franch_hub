import 'package:franch_hub/features/transactions/data/data_source/transaction_remote_data_source.dart';
import 'package:franch_hub/features/transactions/data/models/transaction/transaction_model.dart';
import 'package:franch_hub/features/transactions/domain/entities/transaction.dart';
import 'package:franch_hub/features/transactions/domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource remoteDataSource;

  TransactionRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> createTransaction(TransactionEntity transaction) async {
    await remoteDataSource
        .createTransaction(TransactionModel.fromEntity(transaction));
  }

  @override
  Future<List<TransactionEntity>> getTransactionsForBranch(
      String branchId) async {
    final models = await remoteDataSource.getTransactionsForBranch(branchId);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<TransactionEntity>> getFilteredTransactions({
    required String branchId,
    String? type, // Например: income, expense
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final models = await remoteDataSource.getFilteredTransactions(
      branchId: branchId,
      type: type,
      endDate: endDate,
      startDate: startDate,
    );
    return models.map((model) => model.toEntity()).toList();
  }
}
