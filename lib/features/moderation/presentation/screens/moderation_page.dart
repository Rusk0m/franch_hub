import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:franch_hub/features/moderation/presentation/bloc/moderation_bloc.dart';

class ModerationPage extends StatelessWidget {
  const ModerationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ModerationBloc>()..add(LoadPendingFranchises()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Franchise Moderation'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthBloc>().add(LogoutRequested());
              },
            ),
          ],
        ),
        body: BlocBuilder<ModerationBloc, ModerationState>(
          builder: (context, state) {
            if (state is ModerationLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ModerationLoaded) {
              return ListView.builder(
                itemCount: state.franchises.length,
                itemBuilder: (context, index) {
                  final franchise = state.franchises.keys.elementAt(index);
                  final owner = state.franchises[franchise]!;
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
                          const SizedBox(height: 8),
                          Text(
                            'Owner: ${owner.name ?? 'Unknown'} (${owner.email})',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
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
            } else if (state is ModerationError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('No franchises to moderate'));
          },
        ),
      ),
    );
  }
}