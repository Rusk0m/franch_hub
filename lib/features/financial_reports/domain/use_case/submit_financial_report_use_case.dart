import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/finantion_report.dart';
import 'package:franch_hub/features/financial_reports/domain/repositories/financial_report_repository.dart';
import 'package:franch_hub/features/franchise/domain/services/economic_indicators_service.dart';

class SubmitFinancialReportUseCase extends UseCase<void, FinancialReport> {
  final FinancialReportRepository repository;
  final EconomicIndicatorsService indicatorsService;

  SubmitFinancialReportUseCase({
    required this.repository,
    required this.indicatorsService,
  });

  @override
  Future<void> call( {FinancialReport? params}) async {
    if (params == null) throw ArgumentError("Params can't be null");

    final indicators = indicatorsService.calculateIndicators(params);

    await repository.submitReport(params);

    await repository.submitEconomicIndicators(
      params.branchId,
      params.year,
      params.month,
      indicators,
    );
  }
}
