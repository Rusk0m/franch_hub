import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/finantion_report.dart';
import 'package:franch_hub/features/financial_reports/domain/repositories/financial_report_repository.dart';
import 'package:franch_hub/features/franchise/domain/services/economic_indicators_service.dart';

class GetEconomicIndicatorsForBranchUseCase extends UseCase<Map<String,EconomicIndicators>, String> {
  final FinancialReportRepository repository = sl();
  final EconomicIndicatorsService service = sl();


  GetEconomicIndicatorsForBranchUseCase();

  @override
  Future<Map<String, EconomicIndicators>> call({String? params}) async {
    if (params == null) throw ArgumentError('branchId is required');

    final reports = await repository.getReportsForBranch(params);

    // Группировка по "YYYY-MM"
    final grouped = <String, List<FinancialReport>>{};
    for (var report in reports) {
      final key = '${report.year}-${report.month.toString().padLeft(2, '0')}';
      grouped.putIfAbsent(key, () => []).add(report);
    }

    // Расчет показателей по каждой группе
    final result = <String, EconomicIndicators>{};
    grouped.forEach((key, list) {
      final indicators = service.aggregateIndicators(list);
      result[key] = indicators;
    });

    return result;
  }
}
