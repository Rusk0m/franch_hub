import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/transactions/domain/entities/transaction.dart';
import 'package:franch_hub/features/transactions/domain/repository/transaction_repository.dart';

class GetTransactionsForBranchUseCase extends UseCase<List<TransactionEntity>, String> {
  final TransactionRepository repository = sl();
  GetTransactionsForBranchUseCase();

  @override
  Future<List<TransactionEntity>> call({String? params}) {
    if (params == null) throw ArgumentError('transactions is required');

    return repository.getTransactionsForBranch(params);
  }
}