import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/features/franchise/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/franchise/domain/use_case/get_economic_indicators_for_branch_use_case.dart';


part 'economic_indicators_event.dart';
part 'economic_indicators_state.dart';

class EconomicIndicatorsBloc extends Bloc<EconomicIndicatorsEvent, EconomicIndicatorsState> {
  final GetEconomicIndicatorsForBranchUseCase getIndicatorsUseCase;

  EconomicIndicatorsBloc(this.getIndicatorsUseCase) : super(EconomicIndicatorsInitial()) {
    on<LoadEconomicIndicatorsEvent>(_onLoad);
  }

  Future<void> _onLoad(LoadEconomicIndicatorsEvent event, Emitter<EconomicIndicatorsState> emit) async {
    emit(EconomicIndicatorsLoading());
    try {
      final indicators = await getIndicatorsUseCase(params: event.branchId);
      emit(EconomicIndicatorsLoaded(indicators));
    } catch (e) {
      emit(EconomicIndicatorsError(e.toString()));
    }
  }
}

