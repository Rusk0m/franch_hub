import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/features/franchise/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/franchise/domain/repositories/financial_report_repository.dart';
import 'package:franch_hub/features/franchise/domain/services/economic_indicators_service.dart';

class GetAggregatedIndicatorsForFranchiseUseCase extends UseCase<EconomicIndicators, String> {
  final FinancialReportRepository repository;
  final EconomicIndicatorsService indicatorsService;

  GetAggregatedIndicatorsForFranchiseUseCase({
    required this.repository,
    required this.indicatorsService,
  });

  @override
  Future<EconomicIndicators> call({String? params}) async {
    if (params == null) throw ArgumentError('branchId is required');

    final reports = await repository.getReportsForFranchise(params);
    return indicatorsService.aggregateIndicators(reports);
  }
}
