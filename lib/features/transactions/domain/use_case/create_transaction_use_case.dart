import 'package:franch_hub/core/usecases/usecase.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/transactions/domain/entities/transaction.dart';
import 'package:franch_hub/features/transactions/domain/repository/transaction_repository.dart';

class CreateTransactionUseCase extends UseCase<void, TransactionEntity> {
  final TransactionRepository repository = sl();
  CreateTransactionUseCase();
  @override
  Future<void> call({TransactionEntity? params}) {
    if (params == null) throw ArgumentError('transaction is required');
    return repository.createTransaction(params);
  }
}