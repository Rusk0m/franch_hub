import 'package:franch_hub/features/franchise/domain/entities/economic_indicators.dart';
import 'package:json_annotation/json_annotation.dart';

part 'economic_indicators_model.g.dart'; // Этот файл будет сгенерирован

@JsonSerializable()
class EconomicIndicatorsModel extends EconomicIndicators {
  EconomicIndicatorsModel({
    required double currentRatio,
    required double quickRatio,
    required double returnOnSales,
    required double returnOnAssets,
    required double roi,
    required double autonomyRatio,
    required double debtLoad,
    required double royaltyPayment,
    required double breakevenPoint,
    required double netCashFlow,
  }) : super(
    currentRatio: currentRatio,
    quickRatio: quickRatio,
    returnOnSales: returnOnSales,
    returnOnAssets: returnOnAssets,
    roi: roi,
    autonomyRatio: autonomyRatio,
    debtLoad: debtLoad,
    royaltyPayment: royaltyPayment,
    breakevenPoint: breakevenPoint,
    netCashFlow: netCashFlow,
  );

  factory EconomicIndicatorsModel.fromJson(Map<String, dynamic> json) =>
      _$EconomicIndicatorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$EconomicIndicatorsModelToJson(this);
}
