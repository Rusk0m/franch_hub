import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/features/franchise/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/franchise/domain/repositories/financial_report_repository.dart';
import 'package:franch_hub/features/franchise/domain/services/economic_indicators_service.dart';

class GetEconomicIndicatorsForBranchUseCase extends UseCase<List<EconomicIndicators>, String> {
  final FinancialReportRepository repository;

  GetEconomicIndicatorsForBranchUseCase(this.repository);

  @override
  Future<List<EconomicIndicators>> call({String? params}) async {

    if (params == null) throw ArgumentError('branchId is required');

    final reports = await repository.getReportsForBranch(params);
    final indicators = reports.map((report) => EconomicIndicatorsService().calculateFromReport(report)).toList();
    return indicators;
  }
}
