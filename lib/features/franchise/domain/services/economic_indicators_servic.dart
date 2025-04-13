import 'package:franch_hub/core/utils/financial_calculator.dart';
import 'package:franch_hub/features/franchise/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise_branch.dart';

class EconomicIndicatorsService {
  EconomicIndicators calculateIndicators(FranchiseBranch branch) {
    final liquidity = FinancialCalculator.currentRatio(branch.assets, branch.liabilities);
    final quickLiquidity = FinancialCalculator.quickRatio(branch.assets, branch.inventory, branch.liabilities);

    final profitability = FinancialCalculator.returnOnSales(branch.netProfit, branch.revenue);
    final returnOnAssets = FinancialCalculator.returnOnAssets(branch.netProfit, branch.totalAssets);
    final roi = FinancialCalculator.roi(branch.netProfit, branch.initialInvestment);

    final autonomy = FinancialCalculator.autonomyRatio(branch.ownCapital, branch.totalAssets);
    final debt = FinancialCalculator.debtLoad(branch.liabilities, branch.ownCapital);

    final royalty = FinancialCalculator.royaltyPayment(branch.revenue, branch.royaltyPercent);
    final breakeven = FinancialCalculator.breakevenPoint(branch.fixedCosts, branch.unitPrice, branch.variableCostsPerUnit);

    final netCashFlow = FinancialCalculator.netCashFlow(branch.cashInflow, branch.cashOutflow);

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

  /// Агрегация всех филиалов
  EconomicIndicators aggregateIndicators(List<FranchiseBranch> branches) {
    if (branches.isEmpty) return EconomicIndicators.empty();

    final summed = branches.map(calculateIndicators).reduce((a, b) => a + b);
    return summed / branches.length;
  }
}
