import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/features/franchise/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/franchise/domain/use_case/get_economic_indicators_for_branch_use_case.dart';
import 'package:franch_hub/features/franchise/domain/use_case/get_economic_indicators_for_all_branches_use_case.dart';

part 'economic_indicators_event.dart';
part 'economic_indicators_state.dart';

class EconomicIndicatorsBloc extends Bloc<EconomicIndicatorsEvent, EconomicIndicatorsState> {
  final GetEconomicIndicatorsForBranchUseCase getIndicatorsForBranch;
  //final GetEconomicIndicatorsForAllBranchesUseCase getIndicatorsForAll;

  EconomicIndicatorsBloc({
    required this.getIndicatorsForBranch,
    //required this.getIndicatorsForAll,
  }) : super(EconomicIndicatorsInitial()) {
    on<LoadEconomicIndicatorsEvent>(_onLoadForBranch);
    //on<LoadAllBranchesIndicatorsEvent>(_onLoadForAll);
  }

  Future<void> _onLoadForBranch(
      LoadEconomicIndicatorsEvent event,
      Emitter<EconomicIndicatorsState> emit) async {
    emit(EconomicIndicatorsLoading());
    try {
      final indicators = await getIndicatorsForBranch(params: event.branchId);
      emit(EconomicIndicatorsLoaded(indicators));
    } catch (e) {
      emit(EconomicIndicatorsError(e.toString()));
    }
  }

  // Future<void> _onLoadForAll(
  //     LoadAllBranchesIndicatorsEvent event,
  //     Emitter<EconomicIndicatorsState> emit) async {
  //   emit(EconomicIndicatorsLoading());
  //   try {
  //     final indicators = await getIndicatorsForAll();
  //     emit(EconomicIndicatorsLoaded(indicators));
  //   } catch (e) {
  //     emit(EconomicIndicatorsError(e.toString()));
  //   }
  // }
}
