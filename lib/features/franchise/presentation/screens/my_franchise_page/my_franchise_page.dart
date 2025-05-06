import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/franchise_bloc/franchise_bloc.dart';
import 'package:franch_hub/features/franchise/presentation/screens/create_franchise_page/create_franchise_page.dart';
import 'package:franch_hub/generated/l10n.dart';

class MyFranchisesPage extends StatelessWidget {
  final userId = sl<FirebaseAuth>().currentUser?.uid;

  MyFranchisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.myFranchisesTitle),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateFranchisePage()),
          );
        },
      ),
      body: BlocListener<FranchiseBloc, FranchiseState>(
        listener: (context, state) {
          if (state is MyFranchisesError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.errorMessage(state.message))),
            );
          }
        },
        child: BlocBuilder<FranchiseBloc, FranchiseState>(
          builder: (context, state) {
            if (state is FranchiseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FranchiseLoaded) {
              if (state.franchises.isEmpty) {
                return Center(child: Text(l10n.noFranchisesYet));
              }
              return ListView.builder(
                itemCount: state.franchises.length,
                itemBuilder: (context, index) {
                  final franchise = state.franchises[index];
                  return ListTile(
                    title: Text(franchise.name),
                    subtitle: Text(franchise.description),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRouter.franchiseBranchesPage,
                        arguments: franchise,
                      );
                    },
                  );
                },
              );
            } else if (state is MyFranchisesError) {
              return Center(child: Text(l10n.errorMessage(state.message)));
            }
            if (userId != null) {
              context.read<FranchiseBloc>().add(LoadMyFranchises(userId!));
            }
            return Center(child: Text(l10n.waitingForData));
          },
        ),
      ),
    );
  }
}