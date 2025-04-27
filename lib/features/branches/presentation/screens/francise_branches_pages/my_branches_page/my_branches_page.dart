// my_branches_page.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/presentation/bloc/branches_bloc/my_branches_bloc.dart';

class MyBranchesPage extends StatelessWidget {
  final String userId = sl<FirebaseAuth>().currentUser!.uid;

  MyBranchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Мои точки')),
      body: BlocProvider(
        create: (_) => BranchesBloc()..add(LoadMyBranches(userId)),
        child: BlocBuilder<BranchesBloc, BranchesState>(
          builder: (context, state) {
            if (state is BranchesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is BranchesLoaded) {
              return ListView.builder(
                itemCount: state.branches.length,
                itemBuilder: (context, index) {
                  final branch = state.branches[index];
                  return ListTile(
                    title: Text(branch.name),
                    subtitle: Text('Адрес: ${branch.location}'),
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
            } else if (state is BranchesError) {
              return Center(child: Text('Ошибка: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
