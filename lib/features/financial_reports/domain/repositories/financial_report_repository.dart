import 'package:franch_hub/features/financial_reports/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/financial_report.dart';

abstract class FinancialReportRepository {
  Future<void> submitReport(FinancialReport report);

  /*Future<void> submitEconomicIndicators(
    String branchId,
    int year,
    int month,
    FinancialReport indicators,
  );*/
  Stream<List<FinancialReport>> watchReportsForBranch(String branchId);
  Future<List<FinancialReport>> getReportsForBranch(String branchId);

  Future<List<FinancialReport>> getReportsForFranchise(String franchiseId);
}
