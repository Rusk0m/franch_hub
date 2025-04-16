part of 'economic_indicators_bloc.dart';

abstract class EconomicIndicatorsEvent {}

class LoadEconomicIndicatorsEvent extends EconomicIndicatorsEvent {
  final String branchId;

  LoadEconomicIndicatorsEvent(this.branchId);
}
class LoadAllBranchesIndicatorsEvent extends EconomicIndicatorsEvent {}

