import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/core/utils/timestamp_converter.dart';
import 'package:franch_hub/features/franchise/domain/entities/finantion_report.dart';
import 'package:json_annotation/json_annotation.dart';

part 'financial_report_model.g.dart';  // Этот файл будет сгенерирован

@JsonSerializable()
class FinancialReportModel extends FinancialReport {

  @TimestampConverter()
  final DateTime submittedAt;
  FinancialReportModel({
    required super.id,
    required super.franchiseId,
    required super.branchId,
    required super.year,
    required super.month,
    required this.submittedAt,
    required super.revenue,
    required super.netProfit,
    required super.totalAssets,
    required super.ownCapital,
    required super.liabilities,
    required super.inventory,
    required super.initialInvestment,
    required super.fixedCosts,
    required super.unitPrice,
    required super.variableCostsPerUnit,
    required super.cashInflow,
    required super.cashOutflow,
    required super.royaltyPercent,
  }) : super(
    submittedAt: submittedAt,
  );
  factory FinancialReportModel.fromJson(Map<String, dynamic> json) =>
      _$FinancialReportModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FinancialReportModelToJson(this);

  FinancialReport toEntity() => FinancialReport(
    id: id,
    franchiseId: franchiseId,
    branchId: branchId,
    year: year,
    month: month,
    submittedAt: submittedAt,
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

  static FinancialReportModel fromEntity(FinancialReport report) =>
      FinancialReportModel(
        id: report.id,
        franchiseId: report.franchiseId,
        branchId: report.branchId,
        year: report.year,
        month: report.month,
        submittedAt: report.submittedAt,
        revenue: report.revenue,
        netProfit: report.netProfit,
        totalAssets: report.totalAssets,
        ownCapital: report.ownCapital,
        liabilities: report.liabilities,
        inventory: report.inventory,
        initialInvestment: report.initialInvestment,
        fixedCosts: report.fixedCosts,
        unitPrice: report.unitPrice,
        variableCostsPerUnit: report.variableCostsPerUnit,
        cashInflow: report.cashInflow,
        cashOutflow: report.cashOutflow,
        royaltyPercent: report.royaltyPercent,
      );
}
