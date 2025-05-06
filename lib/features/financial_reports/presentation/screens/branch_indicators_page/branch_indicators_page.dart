import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/%20economic_indicators/economic_indicators_bloc.dart';
import 'package:franch_hub/generated/l10n.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class BranchIndicatorsPage extends StatelessWidget {
  final FranchiseBranch branch;

  const BranchIndicatorsPage({super.key, required this.branch});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context)!;
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
                return Center(child: Text(l10n.noIndicatorsData));
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
                        Text(l10n.roiByMonths,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                        subtitle: Text('${l10n.roiLabel}: ${ind.roi.toStringAsFixed(2)}%'),
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
              return Center(child: Text(l10n.errorMessage(state.message)));
            }

            return const SizedBox.shrink();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouter.submitFinancialReportPage,
                arguments: branch);
          },
          tooltip: l10n.submitReportButton,
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

  Future<void> _generateAndSavePdf(BuildContext context) async {
    final l10n = S.of(context)!;
    final pdfDoc = pw.Document();

    pdfDoc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
              pw.Text(l10n.indicatorsDetailsTitle( indicators.month.toString(),
          indicators.year.toString())),
          pw.SizedBox(height: 10),
          pw.Text(l10n.indicatorsDetailsTitle(
          indicators.month.toString(),
          indicators.year.toString()),
          style: pw.TextStyle(fontSize: 18)),
          pw.Divider(),
          _buildPdfRow(l10n.roiLabel, '${indicators.roi.toStringAsFixed(2)}%'),
          _buildPdfRow(l10n.breakevenPointLabel, indicators.breakevenPoint.toStringAsFixed(2)),
          _buildPdfRow(l10n.quickRatioLabel, indicators.quickRatio.toStringAsFixed(2)),
          _buildPdfRow(l10n.returnOnAssetsLabel, indicators.returnOnAssets.toStringAsFixed(2)),
          _buildPdfRow(l10n.debtLoadLabel, indicators.debtLoad.toStringAsFixed(2)),
          _buildPdfRow(l10n.currentRatioLabel, indicators.currentRatio.toStringAsFixed(2)),
          _buildPdfRow(l10n.returnOnSalesLabel, indicators.returnOnSales.toStringAsFixed(2)),
          _buildPdfRow(l10n.autonomyRatioLabel, indicators.autonomyRatio.toStringAsFixed(2)),
          _buildPdfRow(l10n.royaltyPaymentLabel, indicators.royaltyPayment.toStringAsFixed(2)),
          _buildPdfRow(l10n.netCashFlowLabel, indicators.netCashFlow.toStringAsFixed(2)),
          pw.SizedBox(height: 20),
          //pw.Text(l10n.generatedOn(DateTime.now().toString()),
          ],
          );
          },
      ),
    );

    try {
      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdfDoc.save(),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("l10n.pdfGenerationError")),
      );
    }
  }

  pw.Widget _buildPdfRow(String title, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 4),
      child: pw.Row(
        children: [
          pw.Expanded(
            flex: 2,
            child: pw.Text(title/*, style: const pw.TextStyle(fontWeight: pw.FontWeight.bold)*/),
          ),
          pw.Expanded(
            flex: 1,
            child: pw.Text(value, textAlign: pw.TextAlign.right),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context)!;
    return AlertDialog(
      title: Text(l10n.indicatorsDetailsTitle(
          indicators.month.toString(),
          indicators.year.toString())),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _info(l10n.roiLabel, indicators.roi),
          _info(l10n.breakevenPointLabel, indicators.breakevenPoint),
          _info(l10n.quickRatioLabel, indicators.quickRatio),
          _info(l10n.returnOnAssetsLabel, indicators.returnOnAssets),
          _info(l10n.debtLoadLabel, indicators.debtLoad),
          _info(l10n.currentRatioLabel, indicators.currentRatio),
          _info(l10n.returnOnSalesLabel, indicators.returnOnSales),
          _info(l10n.autonomyRatioLabel, indicators.autonomyRatio),
          _info(l10n.royaltyPaymentLabel, indicators.royaltyPayment),
          _info(l10n.netCashFlowLabel, indicators.netCashFlow),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => _generateAndSavePdf(context),
          child: Text(/*l10n.saveAsPdfButton*/''),
        ),
        TextButton(
          child: Text(l10n.closeButton),
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