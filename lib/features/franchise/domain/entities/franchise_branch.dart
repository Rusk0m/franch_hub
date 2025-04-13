class FranchiseBranch {
  final String id;
  final String franchiseId;
  final String ownerId;

  // Финансовые показатели
  final double assets; // Активы
  final double liabilities; // Обязательства
  final double inventory; // Запасы
  final double netProfit; // Чистая прибыль
  final double revenue; // Выручка
  final double totalAssets; // Общие активы
  final double ownCapital; // Собственный капитал
  final double initialInvestment; // Инвестиции
  final double royaltyPercent; // Роялти в %
  final double fixedCosts; // Постоянные расходы
  final double unitPrice; // Цена единицы товара
  final double variableCostsPerUnit; // Переменные расходы на единицу
  final double cashInflow; // Поступления
  final double cashOutflow; // Выплаты

  FranchiseBranch({
    required this.id,
    required this.franchiseId,
    required this.ownerId,
    required this.assets,
    required this.liabilities,
    required this.inventory,
    required this.netProfit,
    required this.revenue,
    required this.totalAssets,
    required this.ownCapital,
    required this.initialInvestment,
    required this.royaltyPercent,
    required this.fixedCosts,
    required this.unitPrice,
    required this.variableCostsPerUnit,
    required this.cashInflow,
    required this.cashOutflow,
  });
}
