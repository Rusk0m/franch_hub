import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/features/transactions/domain/entities/transaction.dart';
import 'package:franch_hub/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:franch_hub/features/transactions/presentation/screen/transactions_page/widgets/add_transactions_dialog.dart';
import 'package:franch_hub/features/transactions/presentation/screen/transactions_page/widgets/transactions_filters.dart';
import 'package:franch_hub/features/transactions/presentation/screen/transactions_page/widgets/transactions_list.dart';

class TransactionsPage extends StatelessWidget {
  final String branchId;

  const TransactionsPage({super.key, required this.branchId});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
      onPressed: () async {
        final result = await showDialog<TransactionEntity?>(
          context: context,
          builder: (context) => AddTransactionDialog(branchId: branchId),
        );
        if (result != null) {
          context.read<TransactionBloc>().add(CreateTransaction(result));
        }
      },child: Icon(Icons.add),),
      body: Column(
        children: [
          TransactionFilters(),
          Expanded(child: TransactionList())
        ],
      ),
    );
  }
}
