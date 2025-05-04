import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/presentation/bloc/branches_bloc/branch_bloc.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:uuid/uuid.dart';

class AddBranchPage extends StatefulWidget {
  final Map<String, dynamic> arguments;

  const AddBranchPage({super.key, required this.arguments});

  @override
  _AddBranchPageState createState() => _AddBranchPageState();
}

class _AddBranchPageState extends State<AddBranchPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _royaltyPercentController = TextEditingController();
  final _workingHoursController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _royaltyPercentController.dispose();
    _workingHoursController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFranchisee = widget.arguments['isFranchisee'] as bool;
    final userId = sl<FirebaseAuth>().currentUser!.uid;
    final franchise = widget.arguments['franchise'] as Franchise?;

    return Scaffold(
      appBar: AppBar(
        title: Text(isFranchisee ? 'Создать заявку на филиал' : 'Добавить филиал'),
      ),
      body: BlocListener<BranchBloc, BranchState>(
        listener: (context, state) {
          if (state is BranchSuccess || state is BranchLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(isFranchisee ? 'Заявка отправлена на модерацию' : 'Филиал успешно добавлен'),
              ),
            );
            Navigator.pop(context);
          } else if (state is BranchError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Ошибка: ${state.message}')),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Название филиала'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите название';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(labelText: 'Адрес'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите адрес';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _royaltyPercentController,
                  decoration: const InputDecoration(labelText: 'Роялти (%)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите роялти';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Введите число';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _workingHoursController,
                  decoration: const InputDecoration(labelText: 'Часы работы (например, 9:00-18:00)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите часы работы';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Телефон'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите телефон';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (isFranchisee) {
                        if (franchise == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Ошибка: данные франшизы не переданы')),
                          );
                          return;
                        }
                        context.read<BranchBloc>().add(CreatePendingBranch(
                          franchiseId: franchise.id,
                          ownerId: franchise.ownerId,
                          requesterId: userId,
                          name: _nameController.text,
                          location: _locationController.text,
                          royaltyPercent: double.parse(_royaltyPercentController.text),
                          workingHours: _workingHoursController.text,
                          phone: _phoneController.text,
                        ));
                      } else {
                        final branch = FranchiseBranch(
                          id: const Uuid().v4(),
                          franchiseId: franchise!.id,
                          ownerId: userId,
                          name: _nameController.text,
                          location: _locationController.text,
                          royaltyPercent: double.parse(_royaltyPercentController.text),
                          workingHours: _workingHoursController.text,
                          phone: _phoneController.text,
                          createdAt: DateTime.now(),
                        );
                        context.read<BranchBloc>().add(AddBranch(branch: branch));
                      }
                    }
                  },
                  child: Text(isFranchisee ? 'Отправить заявку' : 'Добавить филиал'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}