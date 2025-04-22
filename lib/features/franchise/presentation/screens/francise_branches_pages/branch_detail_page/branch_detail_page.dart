import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/transactions_bloc/transactions_bloc.dart';
import 'package:franch_hub/features/franchise/presentation/screens/branch_indicators_page/branch_indicators_page.dart';
import 'package:franch_hub/features/franchise/presentation/screens/branch_reports_page/branch_reports_page.dart';
import 'package:franch_hub/features/franchise/presentation/screens/transactions_page/transactions_page.dart';


class BranchDetailsPage extends StatelessWidget {
  final FranchiseBranch branch;

  const BranchDetailsPage({Key? key, required this.branch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(branch.name),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Отчёты'),
              Tab(text: 'Транзакции'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //BranchReportsPage(branchId: branch.id,),
            BranchIndicatorsPage(branchId: branch.id),
            BlocProvider<TransactionBloc>(
              create: (_) => sl<TransactionBloc>()..add(LoadTransactions(branch.id)),
              child: TransactionsPage(branchId: branch.id),
            ),
          ],
        ),
      ),
    );
  }
}
