// my_branches_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/branches_bloc/my_branches_bloc.dart';

class MyBranchesPage extends StatelessWidget {
  final String userId;

  const MyBranchesPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Мои точки')),
      body: BlocProvider(
        create: (_) => MyBranchesBloc()..add(LoadMyBranches(userId)),
        child: BlocBuilder<MyBranchesBloc, MyBranchesState>(
          builder: (context, state) {
            if (state is MyBranchesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MyBranchesLoaded) {
              return ListView.builder(
                itemCount: state.branches.length,
                itemBuilder: (context, index) {
                  final branch = state.branches[index];
                  return ListTile(
                    title: Text(branch.name),
                    subtitle: Text('Адрес: ${branch.location}'),
                    onTap: () {
                      // Можно добавить переход к аналитике или отчётам точки
                    },
                  );
                },
              );
            } else if (state is MyBranchesError) {
              return Center(child: Text('Ошибка: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
