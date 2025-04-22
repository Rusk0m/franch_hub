import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/features/franchise/domain/use_case/get_filtered_transactions_use_case.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/transactions_bloc/transactions_bloc.dart';

class TransactionFilters extends StatefulWidget {
  @override
  State<TransactionFilters> createState() => TransactionFiltersState();
}

class TransactionFiltersState extends State<TransactionFilters> {
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        DropdownButton<String>(
          hint: const Text("Фильтр по типу"),
          value: selectedType,
          items: ['income', 'expense']
              .map((type) => DropdownMenuItem(value: type, child: Text(type)))
              .toList(),
          onChanged: (value) {
            setState(() => selectedType = value);
            context.read<TransactionBloc>().add(FilterTransactions(value as TransactionFilterParams));
          },
        ),
      ],
    );
  }
}
