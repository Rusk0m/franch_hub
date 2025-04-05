import 'package:flutter/material.dart';

class FinancialCalculator {
  // 1. Ликвидность
  static double currentRatio(double assets, double liabilities) =>
      liabilities != 0 ? assets / liabilities : 0;

  static double quickRatio(double assets, double inventory, double liabilities) =>
      liabilities != 0 ? (assets - inventory) / liabilities : 0;

  // 2. Рентабельность
  static double returnOnSales(double netProfit, double revenue) =>
      revenue != 0 ? (netProfit / revenue) * 100 : 0;

  static double returnOnAssets(double netProfit, double avgAssets) =>
      avgAssets != 0 ? (netProfit / avgAssets) * 100 : 0;

  static double roi(double profit, double investment) =>
      investment != 0 ? ((profit - investment) / investment) * 100 : 0;

  // 3. Финансовая устойчивость
  static double autonomyRatio(double ownCapital, double totalAssets) =>
      totalAssets != 0 ? (ownCapital / totalAssets) * 100 : 0;

  static double debtLoad(double debt, double ownCapital) =>
      ownCapital != 0 ? (debt / ownCapital) * 100 : 0;

  // 4. Франчайзинг
  static double royaltyPayment(double revenue, double percent) =>
      (revenue * percent) / 100;

  static double breakevenPoint(double fixed, double unitPrice, double variablePerUnit) {
    final margin = unitPrice - variablePerUnit;
    return margin != 0 ? fixed / margin : 0;
  }

  // 5. Денежные потоки
  static double netCashFlow(double inflow, double outflow) => inflow - outflow;

  /*static double discountedCashFlow(List<double> cashFlows, double discountRate) {
    double dcf = 0;
    for (int t = 0; t < cashFlows.length; t++) {
      dcf += cashFlows[t] / (pow(1 + discountRate, t + 1));
    }
    return dcf;
  }*/
}
