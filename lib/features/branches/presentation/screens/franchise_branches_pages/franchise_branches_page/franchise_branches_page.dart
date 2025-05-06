import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/entities/panding_franchise_branch.dart';
import 'package:franch_hub/features/branches/domain/use_case/get_pending_branches_use_case.dart';
import 'package:franch_hub/features/branches/presentation/bloc/branches_bloc/branch_bloc.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/generated/l10n.dart';

class FranchiseBranchesPage extends StatefulWidget {
  final Franchise franchise;

  const FranchiseBranchesPage({super.key, required this.franchise});

  @override
  _FranchiseBranchesPageState createState() => _FranchiseBranchesPageState();
}

class _FranchiseBranchesPageState extends State<FranchiseBranchesPage> {
  final GetPendingBranchesUseCase getPendingBranches = sl();

  @override
  void initState() {
    super.initState();
    // Reset BranchBloc state and load branches for the current franchise
    context.read<BranchBloc>().add(ResetBranchState());
    context
        .read<BranchBloc>()
        .add(LoadBranchesForFranchise(franchiseId: widget.franchise.id, context: context));
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = sl<FirebaseAuth>().currentUser!.uid;
    final isFranchisor = widget.franchise.ownerId == currentUserId;

    print(
        'FranchiseBranchesPage: Loading franchiseBranches for franchiseId: ${widget.franchise.id}');
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context)!.franchiseBranchesTitle(widget.franchise.name)),
      ),
      floatingActionButton: isFranchisor
          ? FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRouter.addBranchPage,
            arguments: {
              'franchise': widget.franchise,
              'isFranchisee': false,
              'franchiseId': widget.franchise.id,
            },
          );
        },
      )
          : null,
      body: BlocListener<BranchBloc, BranchState>(
        listener: (context, state) {
          if (state is BranchError) {
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
            print('FranchiseBranchesPage: Current state: ${state.runtimeType}');
            if (state is BranchLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BranchLoaded) {
              print(
                  'FranchiseBranchesPage: Loaded ${state.branches.length} franchiseBranches');
              return Column(
                children: [
                  // Branch list
                  Expanded(
                    child: state.branches.isEmpty
                        ? Center(child: Text(S.of(context)!.noBranchesMessage))
                        : ListView.builder(
                      itemCount: state.branches.length,
                      itemBuilder: (context, index) {
                        final branch = state.branches[index];
                        final canEditDelete =
                            isFranchisor || branch.ownerId == currentUserId;
                        return ListTile(
                          title: Text(branch.name),
                          subtitle: Text(
                            S.of(context)!.branchInfo(
                              branch.location,
                              branch.workingHours,
                              branch.phone,
                            ),
                          ),
                          trailing: canEditDelete
                              ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (currentUserId == branch.ownerId)
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRouter.editBranchPage,
                                      arguments: {'branch': branch},
                                    );
                                  },
                                ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                          S.of(context)!
                                              .deleteBranchDialogTitle),
                                      content: Text(
                                          S.of(context)!
                                              .deleteBranchDialogContent(
                                              branch.name)),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(S.of(context)!
                                              .cancelButton),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            context.read<BranchBloc>().add(
                                                DeleteBranch(
                                                    branchId: branch.id,
                                                    context: context));
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                              S.of(context)!
                                                  .deleteButton),
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
                      stream: getPendingBranches(params: widget.franchise.ownerId),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const SizedBox.shrink();
                        }
                        final pendingBranches = snapshot.data!;
                        if (pendingBranches.isEmpty) {
                          return const SizedBox.shrink();
                        }
                        return ExpansionTile(
                          title: Text(S.of(context)!.pendingRequestsTitle),
                          children: pendingBranches.map((pendingBranch) {
                            return ListTile(
                              title: Text(pendingBranch.name),
                              subtitle: Text(S.of(context)!
                                  .statusLabel(pendingBranch.status)),
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
                                      context.read<BranchBloc>().add(
                                        ModeratePendingBranch(
                                          pendingBranchId: pendingBranch.id,
                                          status: 'approved',
                                          branch: branch,
                                          franchiseOwnerId: widget.franchise.ownerId,
                                          context: context,
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      context.read<BranchBloc>().add(
                                        ModeratePendingBranch(
                                          pendingBranchId: pendingBranch.id,
                                          status: 'rejected',
                                          branch: null,
                                          franchiseOwnerId: widget.franchise.ownerId,
                                          context: context,
                                        ),
                                      );
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
              return Center(child: Text(state.message));
            }
            return Center(child: Text(S.of(context)!.waitingForData));
          },
        ),
      ),
    );
  }
}