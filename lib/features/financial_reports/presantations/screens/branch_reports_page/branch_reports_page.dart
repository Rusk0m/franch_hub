import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/finantion_report.dart';
import 'package:franch_hub/features/financial_reports/presantations/bloc/financial_report_bloc/financial_report_bloc.dart';

class BranchReportsPage extends StatelessWidget {
  final String branchId;

  const BranchReportsPage({super.key, required this.branchId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Отчёты филиала')),
      body: BlocBuilder<FinancialReportBloc, FinancialReportState>(
        builder: (context, state) {
          if (state is FinancialReportInitial) {
            // Загрузка данных сразу после создания виджета
            context.read<FinancialReportBloc>().add(LoadReportsForBranchEvent(branchId));
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FinancialReportLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FinancialReportLoaded) {
            final reports = state.reports;
            if (reports.isEmpty) {
              return const Center(child: Text('Нет доступных отчётов'));
            }

            return ListView.builder(
              itemCount: reports.length,
              itemBuilder: (context, index) {
                final report = reports[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('${report.month}/${report.year}'),
                    subtitle: Text('Выручка: ${report.revenue.toStringAsFixed(2)}₽'),
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
            return Center(child: Text('Ошибка: ${state.message}'));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _ReportDetailsDialog extends StatelessWidget {
  final FinancialReport report;

  const _ReportDetailsDialog({required this.report});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Детали отчета ${report.month}/${report.year}'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _info('Выручка', report.revenue),
            _info('Чистая прибыль', report.netProfit),
            _info('Общие активы', report.totalAssets),
            _info('Собственный капитал', report.ownCapital),
            _info('Обязательства', report.liabilities),
            _info('Запасы', report.inventory),
            _info('Начальные инвестиции', report.initialInvestment),
            _info('Постоянные издержки', report.fixedCosts),
            _info('Цена за единицу', report.unitPrice),
            _info('Переменные издержки', report.variableCostsPerUnit),
            _info('Приток средств', report.cashInflow),
            _info('Отток средств', report.cashOutflow),
            _info('Роялти (%)', report.royaltyPercent),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Закрыть'),
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
