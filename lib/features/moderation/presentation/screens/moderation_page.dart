import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:franch_hub/features/moderation/presentation/bloc/moderation_bloc.dart';
import 'package:franch_hub/generated/l10n.dart';

class ModerationPage extends StatelessWidget {
  final currentUser = sl<FirebaseAuth>().currentUser;

  ModerationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context)!;
    return BlocProvider(
      create: (_) => sl<ModerationBloc>()
        ..add(LoadModerationData(userId: currentUser!.uid)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.moderationTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthBloc>().add(LogoutRequested(context: context));
              },
            ),
          ],
        ),
        body: BlocListener<ModerationBloc, ModerationState>(
          listener: (context, state) {
            if (state is ModerationError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.errorMessage(state.message))),
              );
            } else if (state is ModerateBranchLoaded) {
              if (state.pendingBranches.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.branchModerationSuccess)),
                );
              }
            } else if (state is ModerationFranchiseSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.franchiseModerationSuccess)),
              );
            }
          },
          child: BlocBuilder<ModerationBloc, ModerationState>(
            builder: (context, state) {
              if (state is ModerationLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ModerationFranchiseLoaded) {
                if (state.franchises.isEmpty) {
                  return Center(child: Text(l10n.noPendingFranchiseRequests));
                }
                return ListView.builder(
                  itemCount: state.franchises.length,
                  itemBuilder: (context, index) {
                    final franchise = state.franchises[index];
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              franchise.name,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            const SizedBox(height: 8),
                            Text('${l10n.descriptionLabel}: ${franchise.description}'),
                            Text('${l10n.industryLabel}: ${franchise.industry}'),
                            Text('${l10n.cityLabel}: ${franchise.city}'),
                            Text('${l10n.startupCostLabel}: ${franchise.startupCost.toStringAsFixed(2)} RUB\n'),
                            Text('${l10n.royaltyPercentLabel}: ${franchise.royaltyPercent.toStringAsFixed(1)}%'),
                            Text(l10n.createdAtLabel(franchise.createdAt.toString())),
                            Text(l10n.franchiseStatusLabel(franchise.status)),
                            Text(l10n.franchiseOwnerIdLabel(franchise.ownerId)),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.check, color: Colors.green),
                                  onPressed: () {
                                    context.read<ModerationBloc>().add(
                                      ModerateFranchiseEvent(
                                        franchiseId: franchise.id,
                                        status: 'approved',
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close, color: Colors.red),
                                  onPressed: () {
                                    context.read<ModerationBloc>().add(
                                      ModerateFranchiseEvent(
                                        franchiseId: franchise.id,
                                        status: 'rejected',
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (state is ModerateBranchLoaded) {
                if (state.pendingBranches.isEmpty) {
                  return Center(child: Text(l10n.noPendingBranchRequests));
                }
                return ListView.builder(
                  itemCount: state.pendingBranches.length,
                  itemBuilder: (context, index) {
                    final branch = state.pendingBranches[index];
                    final franchiseName = state.franchiseNames[branch.franchiseId] ?? 'Unknown';
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              branch.name,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            Text('${l10n.franchiseLabel}: $franchiseName'),
                            const SizedBox(height: 8),
                            //Text('${l10n.locationLabel}: ${branch.location}'),
                            Text('${l10n.royaltyPercentLabel}: ${branch.royaltyPercent.toStringAsFixed(1)}%'),
                            Text('${l10n.workingHoursLabel}: ${branch.workingHours}'),
                            Text('${l10n.phoneLabel}: ${branch.phone}'),
                            Text('${l10n.branchStatusLabel}: ${branch.status}'),
                            Text('${l10n.branchRequestedByLabel}: ${branch.requesterId}'),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.check, color: Colors.green),
                                  onPressed: () {
                                    context.read<ModerationBloc>().add(
                                      ModerateBranch(
                                        pendingBranchId: branch.id,
                                        status: 'approved',
                                        franchiseId: branch.franchiseId,
                                        ownerId: branch.ownerId,
                                        name: branch.name,
                                        location: branch.location,
                                        royaltyPercent: branch.royaltyPercent,
                                        workingHours: branch.workingHours,
                                        phone: branch.phone,
                                        requesterId: branch.requesterId,
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close, color: Colors.red),
                                  onPressed: () {
                                    context.read<ModerationBloc>().add(
                                      ModerateBranch(
                                        pendingBranchId: branch.id,
                                        status: 'rejected',
                                        franchiseId: branch.franchiseId,
                                        ownerId: branch.ownerId,
                                        name: branch.name,
                                        location: branch.location,
                                        royaltyPercent: branch.royaltyPercent,
                                        workingHours: branch.workingHours,
                                        phone: branch.phone,
                                        requesterId: branch.requesterId,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (state is ModerationError) {
                return Center(child: Text(l10n.errorMessage(state.message)));
              }
              return Center(child: Text(l10n.noPendingFranchiseRequests));
            },
          ),
        ),
      ),
    );
  }
}