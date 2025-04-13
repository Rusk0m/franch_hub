// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'economic_indicators_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EconomicIndicatorsModel _$EconomicIndicatorsModelFromJson(
        Map<String, dynamic> json) =>
    EconomicIndicatorsModel(
      currentRatio: (json['currentRatio'] as num).toDouble(),
      quickRatio: (json['quickRatio'] as num).toDouble(),
      returnOnSales: (json['returnOnSales'] as num).toDouble(),
      returnOnAssets: (json['returnOnAssets'] as num).toDouble(),
      roi: (json['roi'] as num).toDouble(),
      autonomyRatio: (json['autonomyRatio'] as num).toDouble(),
      debtLoad: (json['debtLoad'] as num).toDouble(),
      royaltyPayment: (json['royaltyPayment'] as num).toDouble(),
      breakevenPoint: (json['breakevenPoint'] as num).toDouble(),
      netCashFlow: (json['netCashFlow'] as num).toDouble(),
    );

Map<String, dynamic> _$EconomicIndicatorsModelToJson(
        EconomicIndicatorsModel instance) =>
    <String, dynamic>{
      'currentRatio': instance.currentRatio,
      'quickRatio': instance.quickRatio,
      'returnOnSales': instance.returnOnSales,
      'returnOnAssets': instance.returnOnAssets,
      'roi': instance.roi,
      'autonomyRatio': instance.autonomyRatio,
      'debtLoad': instance.debtLoad,
      'royaltyPayment': instance.royaltyPayment,
      'breakevenPoint': instance.breakevenPoint,
      'netCashFlow': instance.netCashFlow,
    };
