part of 'economic_indicators_bloc.dart';

abstract class EconomicIndicatorsState {}

class EconomicIndicatorsInitial extends EconomicIndicatorsState {}

class EconomicIndicatorsLoading extends EconomicIndicatorsState {}

class EconomicIndicatorsLoaded extends EconomicIndicatorsState {
  final List<EconomicIndicators> indicators;

  EconomicIndicatorsLoaded(this.indicators);
}

class EconomicIndicatorsError extends EconomicIndicatorsState {
  final String message;

  EconomicIndicatorsError(this.message);
}
