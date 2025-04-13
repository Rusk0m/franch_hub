// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinancialReportModel _$FinancialReportModelFromJson(
        Map<String, dynamic> json) =>
    FinancialReportModel(
      id: json['id'] as String,
      franchiseId: json['franchiseId'] as String,
      branchId: json['branchId'] as String,
      year: (json['year'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      revenue: (json['revenue'] as num).toDouble(),
      netProfit: (json['netProfit'] as num).toDouble(),
      totalAssets: (json['totalAssets'] as num).toDouble(),
      ownCapital: (json['ownCapital'] as num).toDouble(),
      liabilities: (json['liabilities'] as num).toDouble(),
      inventory: (json['inventory'] as num).toDouble(),
      initialInvestment: (json['initialInvestment'] as num).toDouble(),
      fixedCosts: (json['fixedCosts'] as num).toDouble(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      variableCostsPerUnit: (json['variableCostsPerUnit'] as num).toDouble(),
      cashInflow: (json['cashInflow'] as num).toDouble(),
      cashOutflow: (json['cashOutflow'] as num).toDouble(),
      royaltyPercent: (json['royaltyPercent'] as num).toDouble(),
    );

Map<String, dynamic> _$FinancialReportModelToJson(
        FinancialReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'franchiseId': instance.franchiseId,
      'branchId': instance.branchId,
      'year': instance.year,
      'month': instance.month,
      'revenue': instance.revenue,
      'netProfit': instance.netProfit,
      'totalAssets': instance.totalAssets,
      'ownCapital': instance.ownCapital,
      'liabilities': instance.liabilities,
      'inventory': instance.inventory,
      'initialInvestment': instance.initialInvestment,
      'fixedCosts': instance.fixedCosts,
      'unitPrice': instance.unitPrice,
      'variableCostsPerUnit': instance.variableCostsPerUnit,
      'cashInflow': instance.cashInflow,
      'cashOutflow': instance.cashOutflow,
      'royaltyPercent': instance.royaltyPercent,
    };
