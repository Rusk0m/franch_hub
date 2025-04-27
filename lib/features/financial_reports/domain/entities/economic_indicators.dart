class EconomicIndicators {
  final int month;
  final int year;

  final double currentRatio;
  final double quickRatio;
  final double returnOnSales;
  final double returnOnAssets;
  final double roi;
  final double autonomyRatio;
  final double debtLoad;
  final double royaltyPayment;
  final double breakevenPoint;
  final double netCashFlow;


  EconomicIndicators({
    required this.month,
    required this.year,
    required this.currentRatio,
    required this.quickRatio,
    required this.returnOnSales,
    required this.returnOnAssets,
    required this.roi,
    required this.autonomyRatio,
    required this.debtLoad,
    required this.royaltyPayment,
    required this.breakevenPoint,
    required this.netCashFlow,
  });

  factory EconomicIndicators.empty() => EconomicIndicators(
    month: 1,
    year: 2024,
    currentRatio: 0,
    quickRatio: 0,
    returnOnSales: 0,
    returnOnAssets: 0,
    roi: 0,
    autonomyRatio: 0,
    debtLoad: 0,
    royaltyPayment: 0,
    breakevenPoint: 0,
    netCashFlow: 0,
  );

  EconomicIndicators operator +(EconomicIndicators other) => EconomicIndicators(
    month: month,
    year: year,
    currentRatio: currentRatio + other.currentRatio,
    quickRatio: quickRatio + other.quickRatio,
    returnOnSales: returnOnSales + other.returnOnSales,
    returnOnAssets: returnOnAssets + other.returnOnAssets,
    roi: roi + other.roi,
    autonomyRatio: autonomyRatio + other.autonomyRatio,
    debtLoad: debtLoad + other.debtLoad,
    royaltyPayment: royaltyPayment + other.royaltyPayment,
    breakevenPoint: breakevenPoint + other.breakevenPoint,
    netCashFlow: netCashFlow + other.netCashFlow,
  );

  EconomicIndicators operator /(num divisor) => EconomicIndicators(
    month: month,
    year: year,
    currentRatio: currentRatio / divisor,
    quickRatio: quickRatio / divisor,
    returnOnSales: returnOnSales / divisor,
    returnOnAssets: returnOnAssets / divisor,
    roi: roi / divisor,
    autonomyRatio: autonomyRatio / divisor,
    debtLoad: debtLoad / divisor,
    royaltyPayment: royaltyPayment / divisor,
    breakevenPoint: breakevenPoint / divisor,
    netCashFlow: netCashFlow / divisor,
  );
}
