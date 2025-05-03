import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/use_case/get_pending_branches_use_case.dart';
import 'package:franch_hub/features/branches/presentation/bloc/branches_bloc/branch_bloc.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';

import '../../../../domain/entities/panding_franchise_branch.dart';

class FranchiseBranchesPage extends StatelessWidget {
  final Franchise franchise;
  GetPendingBranchesUseCase getPendingBranches =sl();

  FranchiseBranchesPage({super.key, required this.franchise});

  @override
  Widget build(BuildContext context) {
    final currentUserId = sl<FirebaseAuth>().currentUser!.uid;
    final isFranchisor = franchise.ownerId == currentUserId;

    print('FranchiseBranchesPage: Loading franchiseBranches for franchiseId: ${franchise.id}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Точки франшизы: ${franchise.name}'),
        actions: isFranchisor
            ? [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRouter.addBranchPage,
                arguments: {
                  'franchise': franchise,
                  'isFranchisee': false,
                  'userId': currentUserId,
                },
              );
            },
          ),
        ]
            : [],
      ),
      body: BlocProvider(
        create: (context) => sl<BranchBloc>()
          ..add(LoadBranchesForFranchise(franchiseId: franchise.id)),
        child: BlocListener<BranchBloc, BranchState>(
          listener: (context, state) {
            if (state is BranchSuccess) {
              // Fallback reload to ensure consistency
              context.read<BranchBloc>().add(LoadBranchesForFranchise(franchiseId: franchise.id));
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
              print('FranchiseBranchesPage: Current state: ${state.runtimeType}');
              if (state is BranchLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is BranchLoaded) {
                print('FranchiseBranchesPage: Loaded ${state.branches.length} franchiseBranches');
                return Column(
                  children: [
                    // Branch list
                    Expanded(
                      child: state.branches.isEmpty
                          ? const Center(child: Text('У этой франшизы пока нет точек.'))
                          : ListView.builder(
                        itemCount: state.branches.length,
                        itemBuilder: (context, index) {
                          final branch = state.branches[index];
                          final canEditDelete = isFranchisor || branch.ownerId == currentUserId;
                          return ListTile(
                            title: Text(branch.name),
                            subtitle: Text(
                              'Адрес: ${branch.location}\n'
                                  'Часы работы: ${branch.workingHours}\n'
                                  'Телефон: ${branch.phone}',
                            ),
                            trailing: canEditDelete
                                ? Row(
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
                            )
                                : null,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRouter.branchIndicatorsPage,
                                arguments: branch,
                              );
                            },
                          );
                        },
                      ),
                    ),
                    // Pending branches for moderation (franchisor only)
                    if (isFranchisor)
                      StreamBuilder<List<PendingFranchiseBranch>>(
                        stream: getPendingBranches(params: franchise.ownerId),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const SizedBox.shrink();
                          }
                          final pendingBranches = snapshot.data!;
                          if (pendingBranches.isEmpty) {
                            return const SizedBox.shrink();
                          }
                          return ExpansionTile(
                            title: const Text('Заявки на модерацию'),
                            children: pendingBranches.map((pendingBranch) {
                              return ListTile(
                                title: Text(pendingBranch.name),
                                subtitle: Text('Статус: ${pendingBranch.status}'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.check),
                                      onPressed: () {
                                        final branch = FranchiseBranch(
                                          id: pendingBranch.id,
                                          franchiseId: pendingBranch.franchiseId,
                                          ownerId: pendingBranch.requesterId,
                                          name: pendingBranch.name,
                                          location: pendingBranch.location,
                                          royaltyPercent: pendingBranch.royaltyPercent,
                                          workingHours: pendingBranch.workingHours,
                                          phone: pendingBranch.phone,
                                          createdAt: pendingBranch.createdAt,
                                        );
                                        context.read<BranchBloc>().add(ModeratePendingBranch(
                                          pendingBranchId: pendingBranch.id,
                                          status: 'approved',
                                          branch: branch,
                                          franchiseOwnerId: franchise.ownerId,
                                        ));
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: () {
                                        context.read<BranchBloc>().add(ModeratePendingBranch(
                                          pendingBranchId: pendingBranch.id,
                                          status: 'rejected',
                                          branch: null,
                                          franchiseOwnerId: franchise.ownerId,
                                        ));
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                  ],
                );
              } else if (state is BranchError) {
                print('FranchiseBranchesPage: Error: ${state.message}');
                return Center(child: Text('Ошибка: ${state.message}'));
              }
              return const Center(child: Text('Ожидание данных...'));
            },
          ),
        ),
      ),
    );
  }
}