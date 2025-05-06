import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/presentation/bloc/branches_bloc/branch_bloc.dart';
import 'package:franch_hub/generated/l10n.dart';

class EditBranchPage extends StatefulWidget {
  final FranchiseBranch branch;

  const EditBranchPage({super.key, required this.branch});

  @override
  _EditBranchPageState createState() => _EditBranchPageState();
}

class _EditBranchPageState extends State<EditBranchPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _royaltyPercentController = TextEditingController();
  final _workingHoursController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.branch.name;
    _locationController.text = widget.branch.location;
    _royaltyPercentController.text = widget.branch.royaltyPercent.toString();
    _workingHoursController.text = widget.branch.workingHours;
    _phoneController.text = widget.branch.phone;
  }

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
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context)!.editBranchTitle)),
      body: BlocListener<BranchBloc, BranchState>(
        listener: (context, state) {
          if (state is BranchSuccess || state is BranchLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(S.of(context)!.branchUpdatedMessage)),
            );
            Navigator.pop(context);
          } else if (state is BranchError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                action: state.message.contains(S.of(context)!.branchNotFoundError)
                    ? SnackBarAction(
                  label: S.of(context)!.backButton,
                  onPressed: () => Navigator.pop(context),
                )
                    : null,
              ),
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
                  decoration:
                  InputDecoration(labelText: S.of(context)!.branchNameLabel),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context)!.enterNameError;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _locationController,
                  //decoration: InputDecoration(labelText: S.of(context)!.locationLabel),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context)!.enterLocationError;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _royaltyPercentController,
                  decoration:
                  InputDecoration(labelText: S.of(context)!.royaltyPercentLabel),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context)!.enterRoyaltyError;
                    }
                    if (double.tryParse(value) == null) {
                      return S.of(context)!.invalidRoyaltyError;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _workingHoursController,
                  decoration:
                  InputDecoration(labelText: S.of(context)!.workingHoursLabel),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context)!.enterWorkingHoursError;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration:
                  InputDecoration(labelText: S.of(context)!.phoneLabel),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context)!.enterPhoneError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final updatedBranch = FranchiseBranch(
                        id: widget.branch.id,
                        franchiseId: widget.branch.franchiseId,
                        ownerId: widget.branch.ownerId,
                        name: _nameController.text,
                        location: _locationController.text,
                        royaltyPercent: double.parse(_royaltyPercentController.text),
                        workingHours: _workingHoursController.text,
                        phone: _phoneController.text,
                        createdAt: widget.branch.createdAt,
                      );
                      context
                          .read<BranchBloc>()
                          .add(EditBranch(branch: updatedBranch, context: context));
                    }
                  },
                  child: Text(S.of(context)!.saveChangesButton),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}