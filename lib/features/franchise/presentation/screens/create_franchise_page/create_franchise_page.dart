import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/theme/theme.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/franchise_bloc/franchise_bloc.dart';
import 'package:franch_hub/generated/l10n.dart';

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

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _industryController.dispose();
    _cityController.dispose();
    _startupCostController.dispose();
    _royaltyPercentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context)!;
    final userId = sl<FirebaseAuth>().currentUser?.uid;
    if (userId == null) {
      return Scaffold(
        body: Center(child: Text(l10n.pleaseLogIn)),
      );
    }

    return BlocProvider(
      create: (_) => sl<FranchiseBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.createFranchiseTitle)),
        body: BlocConsumer<FranchiseBloc, FranchiseState>(
          listener: (context, state) {
            if (state is FranchiseCreated) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.franchiseSentForModeration)),
              );
              Navigator.pop(context);
            } else if (state is MyFranchisesError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.errorMessage(state.message))),
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
                      decoration: InputDecoration(labelText: l10n.nameLabel),
                      validator: (value) => value!.isEmpty ? l10n.nameRequiredError : null,
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(labelText: l10n.descriptionLabel),
                      maxLines: 3,
                      validator: (value) => value!.isEmpty ? l10n.descriptionRequiredError : null,
                    ),
                    TextFormField(
                      controller: _industryController,
                      decoration: InputDecoration(labelText: l10n.industryLabel),
                      validator: (value) => value!.isEmpty ? l10n.industryRequiredError : null,
                    ),
                    TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(labelText: l10n.cityLabel),
                      validator: (value) => value!.isEmpty ? l10n.cityRequiredError : null,
                    ),
                    TextFormField(
                      controller: _startupCostController,
                      decoration: InputDecoration(labelText: l10n.startupCostLabelfirst),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) return l10n.startupCostRequiredError;
                        if (double.tryParse(value) == null) {
                          return l10n.invalidStartupCostError;
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _royaltyPercentController,
                      decoration: InputDecoration(labelText: l10n.royaltyPercentLabelFranchise),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) return l10n.royaltyPercentRequiredError;
                        final parsed = double.tryParse(value);
                        if (parsed == null || parsed < 0 || parsed > 100) {
                          return l10n.invalidRoyaltyPercentError;
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
                              industry: _industryController.text,
                              city: _cityController.text,
                              startupCost: double.parse(_startupCostController.text),
                              royaltyPercent: double.parse(_royaltyPercentController.text),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.infinity, 50),
                      ),
                      child: Text(
                        l10n.submitForModerationButton,
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