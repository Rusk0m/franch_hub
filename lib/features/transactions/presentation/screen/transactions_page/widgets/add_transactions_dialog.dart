import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/transactions/domain/entities/transaction.dart';
import 'package:uuid/uuid.dart';

class AddTransactionDialog extends StatefulWidget {
  final String branchId;

  const AddTransactionDialog({super.key, required this.branchId});

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  String type = 'income';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Новая транзакция'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Сумма'),
              keyboardType: TextInputType.number,
              validator: (val) => val == null || double.tryParse(val) == null ? 'Введите число' : null,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: type,
              items: ['income', 'expense']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) => setState(() => type = value!),
              decoration: const InputDecoration(labelText: 'Тип'),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final tx = TransactionEntity(
                id: const Uuid().v4(),
                uid: sl<FirebaseAuth>().currentUser!.uid,
                branchId: widget.branchId,
                amount: double.parse(_amountController.text),
                type: type,
                date: DateTime.now(),
              );
              Navigator.pop(context, tx);
            }
          },
          child: const Text('Добавить'),
        )
      ],
    );
  }
}
