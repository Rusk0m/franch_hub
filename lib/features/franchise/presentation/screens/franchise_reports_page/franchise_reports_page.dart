import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/features/franchise/domain/entities/finantion_report.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/financial_report_bloc/financial_report_bloc.dart';

class FranchiseReportsPage extends StatelessWidget {
  final String franchiseId;

  const FranchiseReportsPage({super.key, required this.franchiseId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Отчёты по франшизе')),
      body: BlocBuilder<FinancialReportBloc, FinancialReportState>(
        builder: (context, state) {
          if (state is FinancialReportInitial) {
            context.read<FinancialReportBloc>().add(LoadReportsForFranchiseEvent(franchiseId));
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FinancialReportLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FinancialReportLoaded) {
            final reports = state.reports;
            if (reports.isEmpty) {
              return const Center(child: Text('Отчётов по франшизе пока нет'));
            }

            return ListView.builder(
              itemCount: reports.length,
              itemBuilder: (context, index) {
                final report = reports[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('Филиал: ${report.branchId}'),
                    subtitle: Text('${report.month}/${report.year} — Выручка: ${report.revenue.toStringAsFixed(2)}₽'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => _FranchiseReportDetails(report: report),
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

class _FranchiseReportDetails extends StatelessWidget {
  final FinancialReport report;

  const _FranchiseReportDetails({required this.report});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Отчёт ${report.month}/${report.year} — филиал ${report.branchId}'),
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
