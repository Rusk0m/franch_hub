import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/features/franchise/domain/entities/transaction.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/transactions_bloc/transactions_bloc.dart';
import 'package:franch_hub/features/franchise/presentation/screens/transactions_page/widgets/add_transactions_dialog.dart';
import 'package:franch_hub/features/franchise/presentation/screens/transactions_page/widgets/transactions_filters.dart';
import 'package:franch_hub/features/franchise/presentation/screens/transactions_page/widgets/transactions_list.dart';

class TransactionsPage extends StatelessWidget {
  final String branchId;

  const TransactionsPage({Key? key, required this.branchId}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TransactionFilters(),
          Expanded(child: TransactionList()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Добавить транзакцию'),
              onPressed: () async {
                final result = await showDialog<TransactionEntity?>(
                  context: context,
                  builder: (context) => AddTransactionDialog(branchId: branchId),
                );
                if (result != null) {
                  context.read<TransactionBloc>().add(CreateTransaction(result));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
