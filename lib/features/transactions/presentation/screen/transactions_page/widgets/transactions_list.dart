import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TransactionLoaded) {
          if (state.transactions.isEmpty) {
            return const Center(child: Text('Нет транзакций'));
          }
          return ListView.builder(
            itemCount: state.transactions.length,
            itemBuilder: (_, index) {
              final tx = state.transactions[index];
              return ListTile(
                title: Text('${tx.type}: ${tx.amount.toStringAsFixed(2)} ₽'),
                subtitle: Text(DateFormat('d MMM y, HH:mm').format(tx.date)),
              );
            },
          );
        } else if (state is TransactionError) {
          return Center(child: Text('Ошибка: ${state.message}'));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
