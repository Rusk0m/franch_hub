import 'dart:math';

/// Класс с финансовыми формулами, который можно использовать в аналитике и отчетности.
class FinancialCalculator {
  // 1. Ликвидность

  /// Коэффициент текущей ликвидности (Current Ratio)
  static double currentRatio(double assets, double liabilities) =>
      liabilities != 0 ? assets / liabilities : 0;

  /// Быстрая ликвидность (Quick Ratio)
  static double quickRatio(double assets, double inventory, double liabilities) =>
      liabilities != 0 ? (assets - inventory) / liabilities : 0;

  // 2. Рентабельность

  /// Рентабельность продаж (Return on Sales)
  static double returnOnSales(double netProfit, double revenue) =>
      revenue != 0 ? (netProfit / revenue) * 100 : 0;

  /// Рентабельность активов (Return on Assets)
  static double returnOnAssets(double netProfit, double avgAssets) =>
      avgAssets != 0 ? (netProfit / avgAssets) * 100 : 0;

  /// ROI (окупаемость инвестиций)
  static double roi(double profit, double investment) =>
      investment != 0 ? (profit  / investment) * 100 : 0;

  // 3. Финансовая устойчивость

  /// Коэффициент автономии (доля собственного капитала в активах)
  static double autonomyRatio(double ownCapital, double totalAssets) =>
      totalAssets != 0 ? (ownCapital / totalAssets) * 100 : 0;

  /// Долговая нагрузка
  static double debtLoad(double debt, double ownCapital) =>
      ownCapital != 0 ? (debt / ownCapital) * 100 : 0;

  // 4. Франчайзинг

  /// Размер роялти
  static double royaltyPayment(double revenue, double percent) =>
      (revenue * percent) / 100;

  /// Точка безубыточности (в единицах товара/услуги)
  static double breakevenPoint(double fixedCosts, double unitPrice, double variableCostPerUnit) {
    final margin = unitPrice - variableCostPerUnit;
    return margin != 0 ? fixedCosts / margin : 0;
  }

  // 5. Денежные потоки

  /// Чистый денежный поток
  static double netCashFlow(double inflow, double outflow) => inflow - outflow;

}
