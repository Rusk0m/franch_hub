import 'package:franch_hub/features/financial_reports/data/data_source/financial_report_remote_data_source.dart';
import 'package:franch_hub/features/financial_reports/data/models/financial_report_model/financial_report_model.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/financial_report.dart';
import 'package:franch_hub/features/financial_reports/domain/repositories/financial_report_repository.dart';

class FinancialReportRepositoryImpl implements FinancialReportRepository {
  final FinancialReportRemoteDataSource remoteDataSource;

  FinancialReportRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> submitReport(FinancialReport report) async {
    await remoteDataSource.submitReport(FinancialReportModel.fromEntity(report));
  }

  @override
  Future<List<FinancialReport>> getReportsForBranch(String branchId) async {
    final models = await remoteDataSource.getReportsForBranch(branchId);
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<FinancialReport>> getReportsForFranchise(String franchiseId) async {
    final models = await remoteDataSource.getReportsForFranchise(franchiseId);
    return models.map((e) => e.toEntity()).toList();
  }
  @override
  Stream<List<FinancialReport>> watchReportsForBranch(String branchId) {
    return remoteDataSource.watchReportsForBranch(branchId).map(
          (models) => models.map((model) => model.toEntity()).toList(),
    );
  }

/*
  @override
  Future<void> submitEconomicIndicators(
      String branchId,
      int year,
      int month,
      EconomicIndicators indicators,
      ) async {
    throw UnimplementedError();
  }*/
}
