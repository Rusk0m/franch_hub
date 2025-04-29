import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/financial_report.dart';
import 'package:franch_hub/features/financial_reports/domain/repositories/financial_report_repository.dart';

class WatchReportsForBranchUseCase {
  final FinancialReportRepository repository = sl();

  WatchReportsForBranchUseCase();

  Stream<List<FinancialReport>> call(String branchId) {
    return repository.watchReportsForBranch(branchId);
  }
}
