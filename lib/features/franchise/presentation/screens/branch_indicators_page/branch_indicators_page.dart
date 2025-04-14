import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/features/franchise/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/%20economic_indicators/economic_indicators_bloc.dart';

class BranchIndicatorsPage extends StatelessWidget {
  final String branchId;

  const BranchIndicatorsPage({super.key, required this.branchId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Экономические показатели')),
      body: BlocBuilder<EconomicIndicatorsBloc, EconomicIndicatorsState>(
        builder: (context, state) {
          if (state is EconomicIndicatorsInitial) {
            context.read<EconomicIndicatorsBloc>().add(LoadEconomicIndicatorsEvent(branchId));
            return const Center(child: CircularProgressIndicator());
          }

          if (state is EconomicIndicatorsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is EconomicIndicatorsLoaded) {
            final indicatorsList = state.indicators;
            if (indicatorsList.isEmpty) {
              return const Center(child: Text('Нет данных по показателям'));
            }

            return ListView.builder(
              itemCount: indicatorsList.length,
              itemBuilder: (context, index) {
                final ind = indicatorsList[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('${ind.month}/${ind.year}'),
                    subtitle: Text('ROI: ${ind.returnOnInvestment.toStringAsFixed(2)}%'),
                    trailing: const Icon(Icons.bar_chart),
                    onTap: () => showDialog(
                      context: context,
                      builder: (_) => _IndicatorsDetails(ind),
                    ),
                  ),
                );
              },
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
          _info('Рентабельность инвестиций (ROI)', indicators.returnOnInvestment),
          _info('Точка безубыточности', indicators.breakEvenPoint),
          _info('Коэффициент ликвидности', indicators.liquidityRatio),
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
