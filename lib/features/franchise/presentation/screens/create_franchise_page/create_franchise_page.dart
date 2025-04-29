import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/theme/theme.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/franchise_bloc/franchise_bloc.dart';

class CreateFranchisePage extends StatefulWidget {
  const CreateFranchisePage({super.key});

  @override
  _CreateFranchisePageState createState() => _CreateFranchisePageState();
}

class _CreateFranchisePageState extends State<CreateFranchisePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _industryController = TextEditingController();
  final _cityController = TextEditingController();
  final _startupCostController = TextEditingController();
  final _royaltyPercentController = TextEditingController();
  final _industryenamesController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _industryController.dispose();
    _cityController.dispose();
    _startupCostController.dispose();
    _royaltyPercentController.dispose();
    _industryenamesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userId = sl<FirebaseAuth>().currentUser?.uid;
    if (userId == null) {
      return const Scaffold(
        body: Center(child: Text('Please log in')),
      );
    }

    return BlocProvider(
      create: (_) => sl<FranchiseBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Create Franchise')),
        body: BlocConsumer<FranchiseBloc, FranchiseState>(
          listener: (context, state) {
            if (state is FranchiseCreated) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Franchise sent for moderation')),
              );
              Navigator.pop(context);
            } else if (state is MyFranchisesError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.message}')),
              );
            }
          },
          builder: (context, state) {
            if (state is FranchiseLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) =>
                      value!.isEmpty ? 'Name is required' : null,
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(labelText: 'Description'),
                      maxLines: 3,
                      validator: (value) =>
                      value!.isEmpty ? 'Description is required' : null,
                    ),
                    TextFormField(
                      controller: _industryController,
                      decoration: const InputDecoration(labelText: 'Industry'),
                      validator: (value) =>
                      value!.isEmpty ? 'Industry is required' : null,
                    ),
                    TextFormField(
                      controller: _cityController,
                      decoration: const InputDecoration(labelText: 'City'),
                      validator: (value) =>
                      value!.isEmpty ? 'City is required' : null,
                    ),
                    TextFormField(
                      controller: _startupCostController,
                      decoration:
                      const InputDecoration(labelText: 'Startup Cost (RUB)'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) return 'Startup cost is required';
                        if (double.tryParse(value) == null) {
                          return 'Enter a valid number';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _royaltyPercentController,
                      decoration:
                      const InputDecoration(labelText: 'Royalty Percent (%)'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) return 'Royalty percent is required';
                        final parsed = double.tryParse(value);
                        if (parsed == null || parsed < 0 || parsed > 100) {
                          return 'Enter a valid percentage (0-100)';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<FranchiseBloc>().add(
                            CreateFranchise(
                              ownerId: userId,
                              name: _nameController.text,
                              description: _descriptionController.text,
                              industry: _industryenamesController.text,
                              city: _cityController.text,
                              startupCost:
                              double.parse(_startupCostController.text),
                              royaltyPercent:
                              double.parse(_royaltyPercentController.text),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.infinity, 50),
                      ),
                      child: Text(
                        'Submit for Moderation',
                        style: FlutterTextTheme.titleLarge(context),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}