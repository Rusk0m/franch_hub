import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/%20economic_indicators/economic_indicators_bloc.dart';
import 'package:franch_hub/features/franchise/domain/entities/economic_indicators.dart';
import 'package:fl_chart/fl_chart.dart';

class AllBranchesIndicatorsPage extends StatelessWidget {
  const AllBranchesIndicatorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Аналитика по филиалам')),
      body: BlocBuilder<EconomicIndicatorsBloc, EconomicIndicatorsState>(
        builder: (context, state) {
          if (state is EconomicIndicatorsInitial) {
            context
                .read<EconomicIndicatorsBloc>()
                .add(LoadAllBranchesIndicatorsEvent()); // событие для всех
            return const Center(child: CircularProgressIndicator());
          }

          if (state is EconomicIndicatorsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is EconomicIndicatorsLoaded) {
            final indicators = state.indicators;

            if (indicators.isEmpty) {
              return const Center(child: Text('Нет данных для анализа.'));
            }

            // Группируем по месяцам/годам
            final Map<String, List<EconomicIndicators>> grouped = {};
            for (final ind in indicators) {
              final key = '${ind.month}/${ind.year}';
              grouped.putIfAbsent(key, () => []).add(ind);
            }

            // Средние значения по каждому месяцу
            final List<String> months = [];
            final List<double> avgRoi = [];

            grouped.forEach((monthYear, list) {
              months.add(monthYear);
              final avg = list.map((e) => e.roi).reduce((a, b) => a + b) / list.length;
              avgRoi.add(avg);
            });

            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Средний ROI по всем филиалам',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      _buildChart(months, avgRoi),
                    ],
                  ),
                ),
              ],
            );
          }

          if (state is EconomicIndicatorsError) {
            return Center(child: Text('Ошибка: ${state.message}'));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildChart(List<String> labels, List<double> values) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index >= 0 && index < labels.length) {
                    return Text(labels[index], style: const TextStyle(fontSize: 10));
                  }
                  return const Text('');
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                  values.length, (i) => FlSpot(i.toDouble(), values[i])),
              isCurved: true,
              color: Colors.green,
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}
