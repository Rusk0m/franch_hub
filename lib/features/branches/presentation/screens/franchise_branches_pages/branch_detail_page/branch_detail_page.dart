import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/financial_reports/presentation/screens/branch_indicators_page/branch_indicators_page.dart';
import 'package:franch_hub/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
import 'package:franch_hub/features/transactions/presentation/screen/transactions_page/transactions_page.dart';
import 'package:franch_hub/generated/l10n.dart';

class BranchDetailsPage extends StatelessWidget {
  final FranchiseBranch branch;

  const BranchDetailsPage({super.key, required this.branch});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(branch.name),
          bottom: TabBar(
            tabs: [
              Tab(text: S.of(context)!.reportsTab),
              Tab(text: S.of(context)!.transactionsTab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BranchIndicatorsPage(branch: branch),
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