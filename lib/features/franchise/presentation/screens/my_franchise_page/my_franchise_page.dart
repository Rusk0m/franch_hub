import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/franchise_bloc/franchise_bloc.dart';
import 'package:franch_hub/features/franchise/presentation/screens/create_franchise_page/create_franchise_page.dart';

class MyFranchisesPage extends StatelessWidget {
  final userId = sl<FirebaseAuth>().currentUser?.uid;

  MyFranchisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои франшизы'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
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
              SnackBar(content: Text('Ошибка: ${state.message}')),
            );
          }
        },
        child: BlocBuilder<FranchiseBloc, FranchiseState>(
          builder: (context, state) {
            print('MyFranchisesPage: Current state: ${state.runtimeType}');
            if (state is FranchiseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FranchiseLoaded) {
              print(
                  'MyFranchisesPage: Loaded ${state.franchises.length} franchises');
              if (state.franchises.isEmpty) {
                return const Center(child: Text('У вас пока нет франшиз.'));
              }
              return ListView.builder(
                itemCount: state.franchises.length,
                itemBuilder: (context, index) {
                  final franchise = state.franchises[index];
                  return ListTile(
                    title: Text(franchise.name),
                    subtitle: Text(franchise.description),
                    onTap: () {
                      print(franchise.name);
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
              print('MyFranchisesPage: Error: ${state.message}');
              return Center(child: Text('Ошибка: ${state.message}'));
            }
            // Trigger initial load if state is FranchiseInitial
            if (userId != null) {
              context.read<FranchiseBloc>().add(LoadMyFranchises(userId!));
            }
            return const Center(child: Text('Ожидание данных...'));
          },
        ),
      ),
    );
  }
}