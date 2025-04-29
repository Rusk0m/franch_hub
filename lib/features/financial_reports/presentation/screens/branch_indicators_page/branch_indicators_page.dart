import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/%20economic_indicators/economic_indicators_bloc.dart';

class BranchIndicatorsPage extends StatelessWidget {
  final FranchiseBranch branch;

  const BranchIndicatorsPage({super.key, required this.branch});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EconomicIndicatorsBloc()..add(LoadEconomicIndicatorsEvent(branch.id)),
      child: Scaffold(
        body: BlocBuilder<EconomicIndicatorsBloc, EconomicIndicatorsState>(
          builder: (context, state) {
            if (state is EconomicIndicatorsLoading || state is EconomicIndicatorsInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is EconomicIndicatorsLoaded) {
              final indicatorsList = state.indicators;

              if (indicatorsList.isEmpty) {
                return const Center(child: Text('Нет данных по показателям'));
              }

              final months = indicatorsList.map((e) => '${e.month}/${e.year}').toList();
              final roiValues = indicatorsList.map((e) => e.roi).toList();

              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('ROI по месяцам',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        _buildRoiChart(months, roiValues),
                      ],
                    ),
                  ),
                  const Divider(),
                  ...List.generate(indicatorsList.length, (index) {
                    final ind = indicatorsList[index];
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text('${ind.month}/${ind.year}'),
                        subtitle: Text('ROI: ${ind.roi.toStringAsFixed(2)}%'),
                        trailing: const Icon(Icons.bar_chart),
                        onTap: () => showDialog(
                          context: context,
                          builder: (_) => _IndicatorsDetails(ind),
                        ),
                      ),
                    );
                  }),
                ],
              );
            }

            if (state is EconomicIndicatorsError) {
              return Center(child: Text('Ошибка: ${state.message}'));
            }

            return const SizedBox.shrink();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouter.submitFinancialReportPage,
                arguments: branch);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildRoiChart(List<String> months, List<double> values) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index >= 0 && index < months.length) {
                    return Text(months[index], style: const TextStyle(fontSize: 10));
                  }
                  return const Text('');
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(values.length,
                      (i) => FlSpot(i.toDouble(), values[i])),
              isCurved: true,
              color: Colors.blue,
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}

class _IndicatorsDetails extends StatelessWidget {
  final EconomicIndicators indicators;

  const _IndicatorsDetails(this.indicators);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Показатели ${indicators.month}/${indicators.year}'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _info('Рентабельность инвестиций (ROI)', indicators.roi),
          _info('Точка безубыточности', indicators.breakevenPoint),
          _info('Коэффициент ликвидности', indicators.quickRatio),
          _info('Рентабельность активов', indicators.returnOnAssets),
          _info('Долговая нагрузка', indicators.debtLoad),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Закрыть'),
          onPressed: () => Navigator.pop(context),
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
