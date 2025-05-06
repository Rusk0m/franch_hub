import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/presentation/bloc/branches_bloc/branch_bloc.dart';
import 'package:franch_hub/generated/l10n.dart';

class MyBranchesPage extends StatefulWidget {
  const MyBranchesPage({super.key});

  @override
  _MyBranchesPageState createState() => _MyBranchesPageState();
}

class _MyBranchesPageState extends State<MyBranchesPage> {
  final String userId = sl<FirebaseAuth>().currentUser!.uid;

  @override
  void initState() {
    super.initState();
    // Reset BranchBloc state and load user's branches
    context.read<BranchBloc>().add(ResetBranchState());
    context.read<BranchBloc>().add(LoadMyBranches(ownerId: userId, context: context));
  }

  @override
  Widget build(BuildContext context) {
    print('MyBranchesPage: Loading franchiseBranches for userId: $userId');
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context)!.myBranchesTitle),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRouter.addBranchPage,
            arguments: {'userId': userId, 'isFranchisee': true},
          );
        },
      ),
      body: BlocListener<BranchBloc, BranchState>(
        listener: (context, state) {
          if (state is BranchSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(S.of(context)!.operationSuccessMessage)),
            );
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
        child: BlocBuilder<BranchBloc, BranchState>(
          builder: (context, state) {
            print('MyBranchesPage: Current state: ${state.runtimeType}');
            if (state is BranchLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BranchLoaded) {
              print('MyBranchesPage: Loaded ${state.branches.length} franchiseBranches');
              if (state.branches.isEmpty) {
                return Center(child: Text(S.of(context)!.noUserBranchesMessage));
              }
              return ListView.builder(
                itemCount: state.branches.length,
                itemBuilder: (context, index) {
                  final branch = state.branches[index];
                  return ListTile(
                    title: Text(branch.name),
                    subtitle: Text(
                      S.of(context)!.branchInfo(
                        branch.location,
                        branch.workingHours,
                        branch.phone,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRouter.editBranchPage,
                              arguments: branch,
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(S.of(context)!.deleteBranchDialogTitle),
                                content: Text(
                                    S.of(context)!.deleteBranchDialogContent(branch.name)),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(S.of(context)!.cancelButton),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.read<BranchBloc>().add(
                                          DeleteBranch(
                                              branchId: branch.id, context: context));
                                      Navigator.pop(context);
                                    },
                                    child: Text(S.of(context)!.deleteButton),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRouter.branchDetailsPage,
                        arguments: branch,
                      );
                    },
                  );
                },
              );
            } else if (state is BranchError) {
              print('MyBranchesPage: Error: ${state.message}');
              return Center(child: Text(state.message));
            }
            return Center(child: Text(S.of(context)!.waitingForData));
          },
        ),
      ),
    );
  }
}