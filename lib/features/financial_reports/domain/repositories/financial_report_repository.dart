import 'package:franch_hub/features/financial_reports/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/finantion_report.dart';

abstract class FinancialReportRepository {
  Future<void> submitReport(FinancialReport report);

  Future<void> submitEconomicIndicators(
    String branchId,
    int year,
    int month,
    EconomicIndicators indicators,
  );

  Future<List<FinancialReport>> getReportsForBranch(String branchId);

  Future<List<FinancialReport>> getReportsForFranchise(String franchiseId);
}
