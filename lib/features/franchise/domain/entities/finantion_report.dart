class FinancialReport {
  final String id;
  final String franchiseId;
  final String branchId;
  final int year;
  final int month;

  final double revenue; // Выручка
  final double netProfit; // Чистая прибыль
  final double totalAssets; // Общие активы
  final double ownCapital; // Собственный капитал
  final double liabilities; // Обязательства
  final double inventory; // Запасы

  final double initialInvestment;
  final double fixedCosts;
  final double unitPrice;
  final double variableCostsPerUnit;
  final double cashInflow;
  final double cashOutflow;
  final double royaltyPercent;

  const FinancialReport({
    required this.id,
    required this.franchiseId,
    required this.branchId,
    required this.year,
    required this.month,
    required this.revenue,
    required this.netProfit,
    required this.totalAssets,
    required this.ownCapital,
    required this.liabilities,
    required this.inventory,
    required this.initialInvestment,
    required this.fixedCosts,
    required this.unitPrice,
    required this.variableCostsPerUnit,
    required this.cashInflow,
    required this.cashOutflow,
    required this.royaltyPercent,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'franchiseId' :franchiseId,
      'branchId': branchId,
      'year': year,
      'month': month,
      'revenue': revenue,
      'netProfit': netProfit,
      'totalAssets': totalAssets,
      'ownCapital': ownCapital,
      'liabilities': liabilities,
      'inventory': inventory,
      'initialInvestment': initialInvestment,
      'fixedCosts': fixedCosts,
      'unitPrice': unitPrice,
      'variableCostsPerUnit': variableCostsPerUnit,
      'cashInflow': cashInflow,
      'cashOutflow': cashOutflow,
      'royaltyPercent': royaltyPercent,
    };
  }

}
