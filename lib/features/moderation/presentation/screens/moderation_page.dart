import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:franch_hub/features/moderation/presentation/bloc/moderation_bloc.dart';

class ModerationPage extends StatelessWidget {
  final String currentUserId = sl<FirebaseAuth>().currentUser!.uid;

  ModerationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ModerationBloc>()
        ..add(LoadModerationData(userId: currentUserId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Moderation'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthBloc>().add(LogoutRequested());
              },
            ),
          ],
        ),
        body: BlocListener<ModerationBloc, ModerationState>(
          listener: (context, state) {
            if (state is ModerationError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.message}')),
              );
            } else if (state is ModerateBranchLoaded) {
              if (state.pendingBranches.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Branch moderation successful')),
                );
              }
            } else if (state is ModerationFranchiseSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Franchise moderation successful')),
              );
            }
          },
          child: BlocBuilder<ModerationBloc, ModerationState>(
            builder: (context, state) {
              if (state is ModerationLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ModerationFranchiseLoaded) {
                if (state.franchises.isEmpty) {
                  return const Center(child: Text('No pending franchise requests'));
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
                            Text('Description: ${franchise.description}'),
                            Text('Industry: ${franchise.industry}'),
                            Text('City: ${franchise.city}'),
                            Text('Startup Cost: \$${franchise.startupCost.toStringAsFixed(2)}'),
                            Text('Royalty: ${franchise.royaltyPercent.toStringAsFixed(1)}%'),
                            Text('Created At: ${franchise.createdAt.toString()}'),
                            Text('Status: ${franchise.status}'),
                            Text('Owner ID: ${franchise.ownerId}'),
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
                  return const Center(child: Text('No pending branch requests'));
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
                            Text('Franchise: $franchiseName'),
                            const SizedBox(height: 8),
                            Text('Location: ${branch.location}'),
                            Text('Royalty: ${branch.royaltyPercent.toStringAsFixed(1)}%'),
                            Text('Working Hours: ${branch.workingHours}'),
                            Text('Phone: ${branch.phone}'),
                            Text('Status: ${branch.status}'),
                            Text('Requested by: ${branch.requesterId}'),
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
                return Center(child: Text('Error: ${state.message}'));
              }
              return const Center(child: Text('No pending requests'));
            },
          ),
        ),
      ),
    );
  }
}