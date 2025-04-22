part of 'transactions_bloc.dart';

abstract class TransactionEvent {}

class LoadTransactions extends TransactionEvent {
  final String branchId;
  LoadTransactions(this.branchId);
}

class FilterTransactions extends TransactionEvent {
  final TransactionFilterParams filterParams;
  FilterTransactions(this.filterParams);
}

class CreateTransaction extends TransactionEvent {
  final TransactionEntity transaction;
  CreateTransaction(this.transaction);
}

