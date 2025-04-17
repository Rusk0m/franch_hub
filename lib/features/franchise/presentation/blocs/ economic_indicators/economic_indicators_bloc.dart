import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/franchise/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/franchise/domain/entities/finantion_report.dart';
import 'package:franch_hub/features/franchise/domain/repositories/financial_report_repository.dart';
import 'package:franch_hub/features/franchise/domain/services/economic_indicators_service.dart';

part 'economic_indicators_event.dart';
part 'economic_indicators_state.dart';

class EconomicIndicatorsBloc extends Bloc<EconomicIndicatorsEvent, EconomicIndicatorsState> {
  final FinancialReportRepository reportRepository = sl();
  final EconomicIndicatorsService indicatorsService = sl();

  EconomicIndicatorsBloc() : super(EconomicIndicatorsInitial()) {
    on<LoadEconomicIndicatorsEvent>(_onLoadForBranch);
  }

  Future<void> _onLoadForBranch(
      LoadEconomicIndicatorsEvent event,
      Emitter<EconomicIndicatorsState> emit,
      ) async {
    emit(EconomicIndicatorsLoading());
    try {
      final List<FinancialReport> reports = await reportRepository.getReportsForBranch(event.branchId);

      // Сортировка по дате, если надо:
      reports.sort((a, b) => DateTime(a.year, a.month).compareTo(DateTime(b.year, b.month)));

      final indicators = reports
          .map((report) => indicatorsService.calculateIndicators(report))
          .toList();

      emit(EconomicIndicatorsLoaded(indicators));
    } catch (e) {
      emit(EconomicIndicatorsError(e.toString()));
    }
  }
}
