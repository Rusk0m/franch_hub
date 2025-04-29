import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/financial_report.dart';
import 'package:franch_hub/features/financial_reports/domain/repositories/financial_report_repository.dart';

class SubmitFinancialReportUseCase extends UseCase<void, FinancialReport> {
  final FinancialReportRepository repository = sl();

  SubmitFinancialReportUseCase();

  @override
  Future<void> call( {FinancialReport? params}) async {
    if (params == null) throw ArgumentError("Params can't be null");
    await repository.submitReport(params);
  }
}
