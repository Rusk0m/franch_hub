import 'package:franch_hub/core/utils/financial_calculator.dart';
import 'package:franch_hub/features/franchise/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/franchise/domain/entities/finantion_report.dart';

class EconomicIndicatorsService {
  EconomicIndicators calculateIndicators(FinancialReport report) {
    final liquidity = FinancialCalculator.currentRatio(report.totalAssets, report.liabilities);
    final quickLiquidity = FinancialCalculator.quickRatio(report.totalAssets, report.inventory, report.liabilities);

    final profitability = FinancialCalculator.returnOnSales(report.netProfit, report.revenue);
    final returnOnAssets = FinancialCalculator.returnOnAssets(report.netProfit, report.totalAssets);
    final roi = FinancialCalculator.roi(report.netProfit, report.initialInvestment);

    final autonomy = FinancialCalculator.autonomyRatio(report.ownCapital, report.totalAssets);
    final debt = FinancialCalculator.debtLoad(report.liabilities, report.ownCapital);

    final royalty = FinancialCalculator.royaltyPayment(report.revenue, report.royaltyPercent);
    final breakeven = FinancialCalculator.breakevenPoint(report.fixedCosts, report.unitPrice, report.variableCostsPerUnit);

    final netCashFlow = FinancialCalculator.netCashFlow(report.cashInflow, report.cashOutflow);

    return EconomicIndicators(
      currentRatio: liquidity,
      quickRatio: quickLiquidity,
      returnOnSales: profitability,
      returnOnAssets: returnOnAssets,
      roi: roi,
      autonomyRatio: autonomy,
      debtLoad: debt,
      royaltyPayment: royalty,
      breakevenPoint: breakeven,
      netCashFlow: netCashFlow,
    );
  }

  /// Агрегация всех отчётов
  EconomicIndicators aggregateIndicators(List<FinancialReport> reports) {
    if (reports.isEmpty) return EconomicIndicators.empty();

    final summed = reports.map(calculateIndicators).reduce((a, b) => a + b);
    return summed / reports.length;
  }

  EconomicIndicators calculateFromReport(FinancialReport report) {
    final currentRatio = FinancialCalculator.currentRatio(report.totalAssets, report.liabilities);
    final quickRatio = FinancialCalculator.quickRatio(report.totalAssets, report.inventory, report.liabilities);
    final returnOnSales = FinancialCalculator.returnOnSales(report.netProfit, report.revenue);
    final returnOnAssets = FinancialCalculator.returnOnAssets(report.netProfit, report.totalAssets);
    final roi = FinancialCalculator.roi(report.netProfit, report.initialInvestment);
    final autonomyRatio = FinancialCalculator.autonomyRatio(report.ownCapital, report.totalAssets);
    final debtLoad = FinancialCalculator.debtLoad(report.liabilities, report.ownCapital);
    final royaltyPayment = FinancialCalculator.royaltyPayment(report.revenue, report.royaltyPercent);
    final breakevenPoint = FinancialCalculator.breakevenPoint(report.fixedCosts, report.unitPrice, report.variableCostsPerUnit);
    final netCashFlow = FinancialCalculator.netCashFlow(report.cashInflow, report.cashOutflow);

    return EconomicIndicators(
      currentRatio: currentRatio,
      quickRatio: quickRatio,
      returnOnSales: returnOnSales,
      returnOnAssets: returnOnAssets,
      roi: roi,
      autonomyRatio: autonomyRatio,
      debtLoad: debtLoad,
      royaltyPayment: royaltyPayment,
      breakevenPoint: breakevenPoint,
      netCashFlow: netCashFlow,
    );
  }

}