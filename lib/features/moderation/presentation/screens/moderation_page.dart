import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/moderation/presentation/bloc/moderation_bloc.dart';

class ModerationPage extends StatelessWidget {
  const ModerationPage({super.key});

  Future<bool> _isAdmin() async {
    final user = sl<FirebaseAuth>().currentUser;
    if (user == null) return false;
    final userDoc = await sl<FirebaseFirestore>()
        .collection('users')
        .doc(user.uid)
        .get();
    return userDoc.exists && userDoc.data()?['role'] == 'admin';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isAdmin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasData && snapshot.data == true) {
          return BlocProvider(
            create: (_) => sl<ModerationBloc>()..add(LoadPendingFranchises()),
            child: Scaffold(
              appBar: AppBar(title: const Text('Franchise Moderation')),
              body: BlocBuilder<ModerationBloc, ModerationState>(
                builder: (context, state) {
                  if (state is ModerationLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ModerationLoaded) {
                    return ListView.builder(
                      itemCount: state.franchises.length,
                      itemBuilder: (context, index) {
                        final franchise = state.franchises[index];
                        return ListTile(
                          title: Text(franchise.name),
                          subtitle: Text(franchise.description),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
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
        return const Scaffold(
          body: Center(child: Text('Access denied: Admin only')),
        );
      },
    );
  }
}