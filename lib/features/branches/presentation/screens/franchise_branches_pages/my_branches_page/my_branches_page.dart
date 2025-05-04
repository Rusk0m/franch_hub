import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/presentation/bloc/branches_bloc/branch_bloc.dart';

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
    context.read<BranchBloc>().add(LoadMyBranches(ownerId: userId));
  }

  @override
  Widget build(BuildContext context) {
    print('MyBranchesPage: Loading franchiseBranches for userId: $userId');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои точки'),
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
              const SnackBar(content: Text('Операция выполнена успешно')),
            );
          } else if (state is BranchError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                action: state.message.contains('no longer exists')
                    ? SnackBarAction(
                  label: 'Назад',
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
                return const Center(child: Text('У вас пока нет точек.'));
              }
              return ListView.builder(
                itemCount: state.branches.length,
                itemBuilder: (context, index) {
                  final branch = state.branches[index];
                  return ListTile(
                    title: Text(branch.name),
                    subtitle: Text(
                      'Адрес: ${branch.location}\n'
                          'Часы работы: ${branch.workingHours}\n'
                          'Телефон: ${branch.phone}',
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
                                title: const Text('Удалить филиал?'),
                                content: Text('Вы уверены, что хотите удалить "${branch.name}"?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Отмена'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.read<BranchBloc>().add(DeleteBranch(branchId: branch.id));
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Удалить'),
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
              return Center(child: Text('Ошибка: ${state.message}'));
            }
            return const Center(child: Text('Ожидание данных...'));
          },
        ),
      ),
    );
  }
}