
// GetFilteredTransactionsUseCase
import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/transactions/domain/entities/transaction.dart';
import 'package:franch_hub/features/transactions/domain/repository/transaction_repository.dart';

class GetFilteredTransactionsUseCase extends UseCase<List<TransactionEntity>, TransactionFilterParams> {
  final TransactionRepository repository = sl();
  GetFilteredTransactionsUseCase();

  @override
  Future<List<TransactionEntity>> call({TransactionFilterParams? params}) {
    if (params == null) throw ArgumentError('transaction is required');

    return repository.getFilteredTransactions(
      branchId: params.branchId,
      type: params.type,
      startDate: params.startDate,
      endDate: params.endDate,
    );
  }
}

// Параметры фильтрации
class TransactionFilterParams {
  final String branchId;
  final String? type;
  final DateTime? startDate;
  final DateTime? endDate;

  TransactionFilterParams({
    required this.branchId,
    this.type,
    this.startDate,
    this.endDate,
  });
}