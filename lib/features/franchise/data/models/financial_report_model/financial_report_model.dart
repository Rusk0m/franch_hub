import 'package:franch_hub/features/franchise/domain/entities/finantion_report.dart';
import 'package:json_annotation/json_annotation.dart';

part 'financial_report_model.g.dart';  // Этот файл будет сгенерирован

@JsonSerializable()
class FinancialReportModel extends FinancialReport {
  FinancialReportModel({
    required String id,
    required String franchiseId,
    required String branchId,
    required int year,
    required int month,
    required double revenue,
    required double netProfit,
    required double totalAssets,
    required double ownCapital,
    required double liabilities,
    required double inventory,
    required double initialInvestment,
    required double fixedCosts,
    required double unitPrice,
    required double variableCostsPerUnit,
    required double cashInflow,
    required double cashOutflow,
    required double royaltyPercent,
  }) : super(
    id: id,
    franchiseId:franchiseId,
    branchId: branchId,
    year: year,
    month: month,
    revenue: revenue,
    netProfit: netProfit,
    totalAssets: totalAssets,
    ownCapital: ownCapital,
    liabilities: liabilities,
    inventory: inventory,
    initialInvestment: initialInvestment,
    fixedCosts: fixedCosts,
    unitPrice: unitPrice,
    variableCostsPerUnit: variableCostsPerUnit,
    cashInflow: cashInflow,
    cashOutflow: cashOutflow,
    royaltyPercent: royaltyPercent,
  );

  factory FinancialReportModel.fromJson(Map<String, dynamic> json) =>
      _$FinancialReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$FinancialReportModelToJson(this);
}
