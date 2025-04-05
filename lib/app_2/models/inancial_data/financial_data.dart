import 'package:flutter/material.dart';

class FinancialData {
  double currentAssets;
  double currentLiabilities;
  double inventory;
  double netProfit;
  double revenue;
  double avgAssets;
  double ownCapital;
  double totalAssets;
  double debtCapital;
  double investment;
  double franchiseProfit;

  FinancialData({
    required this.currentAssets,
    required this.currentLiabilities,
    required this.inventory,
    required this.netProfit,
    required this.revenue,
    required this.avgAssets,
    required this.ownCapital,
    required this.totalAssets,
    required this.debtCapital,
    required this.investment,
    required this.franchiseProfit,
  });
}

class FranchiseData {
  double monthlyRevenue;
  double royaltyPercent;
  double fixedCosts;
  double variableCosts;
  double unitPrice;
  double variableCostPerUnit;
  int unitsSold;
  double initialFee;

  FranchiseData({
    required this.monthlyRevenue,
    required this.royaltyPercent,
    required this.fixedCosts,
    required this.variableCosts,
    required this.unitPrice,
    required this.variableCostPerUnit,
    required this.unitsSold,
    required this.initialFee,
  });
}

class CashFlow {
  double inflows;
  double outflows;

  CashFlow({required this.inflows, required this.outflows});
}
