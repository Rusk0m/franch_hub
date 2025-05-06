import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/financial_report.dart';
import 'package:franch_hub/features/financial_reports/presentation/bloc/financial_report_bloc/financial_report_bloc.dart';
import 'package:franch_hub/generated/l10n.dart';
class BranchReportsPage extends StatelessWidget {
  final FranchiseBranch branch;

  const BranchReportsPage({super.key, required this.branch});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.branchReportsTitle)),
      body: BlocBuilder<FinancialReportBloc, FinancialReportState>(
        builder: (context, state) {
          if (state is FinancialReportInitial) {
            context.read<FinancialReportBloc>().add(LoadReportsForBranchEvent(branch.id));
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FinancialReportLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FinancialReportLoaded) {
            final reports = state.reports;
            if (reports.isEmpty) {
              return Center(child: Text(l10n.noReportsAvailable));
            }
            return ListView.builder(
              itemCount: reports.length,
              itemBuilder: (context, index) {
                final report = reports[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('${report.month}/${report.year}'),
                    subtitle: Text('${l10n.revenueLabel}: ${report.revenue.toStringAsFixed(2)}₽'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => _ReportDetailsDialog(report: report),
                      );
                    },
                  ),
                );
              },
            );
          }
          if (state is FinancialReportError) {
            return Center(child: Text(l10n.errorMessage(state.message)));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRouter.submitFinancialReportPage, arguments: branch);
        },
        tooltip: l10n.submitReportButton,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ReportDetailsDialog extends StatelessWidget {
  final FinancialReport report;

  const _ReportDetailsDialog({required this.report});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context)!;
    return AlertDialog(
      title: Text(l10n.reportDetailsTitle(
          report.month.toString(),
          report.year.toString())),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _info(l10n.revenueLabel, report.revenue),
            _info(l10n.netProfitLabel, report.netProfit),
            _info(l10n.totalAssetsLabel, report.totalAssets),
            _info(l10n.ownCapitalLabel, report.ownCapital),
            _info(l10n.liabilitiesLabel, report.liabilities),
            _info(l10n.inventoryLabel, report.inventory),
            _info(l10n.initialInvestmentLabel, report.initialInvestment),
            _info(l10n.fixedCostsLabel, report.fixedCosts),
            _info(l10n.unitPriceLabel, report.unitPrice),
            _info(l10n.variableCostsLabel, report.variableCostsPerUnit),
            _info(l10n.cashInflowLabel, report.cashInflow),
            _info(l10n.cashOutflowLabel, report.cashOutflow),
            _info(l10n.royaltyPercentLabelReport, report.royaltyPercent),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text(l10n.closeButton),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  Widget _info(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text('$label: ${value.toStringAsFixed(2)}'),
    );
  }
}