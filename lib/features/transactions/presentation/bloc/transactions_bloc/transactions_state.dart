part of 'transactions_bloc.dart';

abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<TransactionEntity> transactions;
  TransactionLoaded(this.transactions);
}

class TransactionCreated extends TransactionState {}

class TransactionError extends TransactionState {
  final String message;
  TransactionError(this.message);
}
