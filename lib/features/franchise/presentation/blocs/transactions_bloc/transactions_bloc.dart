import 'package:bloc/bloc.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/franchise/domain/entities/transaction.dart';
import 'package:franch_hub/features/franchise/domain/use_case/create_transaction_use_case.dart';
import 'package:franch_hub/features/franchise/domain/use_case/get_filtered_transactions_use_case.dart';
import 'package:franch_hub/features/franchise/domain/use_case/get_transactions_for_branch_use_case.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final GetTransactionsForBranchUseCase getTransactions = sl();
  final GetFilteredTransactionsUseCase getFilteredTransactions = sl();
  final CreateTransactionUseCase createTransaction = sl();

  TransactionBloc() : super(TransactionInitial()) {
    on<LoadTransactions>(_onLoad);
    on<FilterTransactions>(_onFilter);
    on<CreateTransaction>(_onCreate);
  }

  Future<void> _onLoad(LoadTransactions event, Emitter<TransactionState> emit) async {
    emit(TransactionLoading());
    try {
      final result = await getTransactions(params: event.branchId);
      emit(TransactionLoaded(result));
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }

  Future<void> _onFilter(FilterTransactions event, Emitter<TransactionState> emit) async {
    emit(TransactionLoading());
    try {
      final result = await getFilteredTransactions(params: event.filterParams);
      emit(TransactionLoaded(result));
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }

  Future<void> _onCreate(CreateTransaction event, Emitter<TransactionState> emit) async {
    emit(TransactionLoading());
    try {
      await createTransaction(params: event.transaction);
      emit(TransactionCreated());
      final result = await getTransactions(params: event.transaction.branchId);
      emit(TransactionLoaded(result));
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }
}
