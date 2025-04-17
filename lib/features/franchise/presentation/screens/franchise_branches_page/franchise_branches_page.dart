import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/franchise_branches_bloc/franchise_branches_bloc.dart';

class FranchiseBranchesPage extends StatelessWidget {
  final Franchise franchise;

  const FranchiseBranchesPage({super.key, required this.franchise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Точки франшизы: ${franchise.name}'),
      ),
      body: BlocProvider(
        create: (context) => FranchiseBranchesBloc()
          ..add(LoadFranchiseBranches(franchise.id)),
        child: BlocBuilder<FranchiseBranchesBloc, FranchiseBranchesState>(
          builder: (context, state) {
            if (state is FranchiseBranchesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FranchiseBranchesLoaded) {
              final branches = state.branches;

              if (branches.isEmpty) {
                return const Center(child: Text('У этой франшизы пока нет точек.'));
              }

              return ListView.builder(
                itemCount: branches.length,
                itemBuilder: (context, index) {
                  final branch = branches[index];
                  return ListTile(
                    title: Text(branch.name),
                    subtitle: Text('Адрес: ${branch.location}'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRouter.branchIndicatorsPage,
                        arguments: branch, // <-- это должен быть Franchise
                      );
                    },
                  );
                },
              );
            } else if (state is FranchiseBranchesError) {
              return Center(child: Text('Ошибка: ${state.message}'));
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
