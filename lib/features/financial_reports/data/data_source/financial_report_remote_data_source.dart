import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/features/financial_reports/data/models/financial_report_model/financial_report_model.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/financial_report.dart';

abstract class FinancialReportRemoteDataSource {
  Future<void> submitReport(FinancialReportModel report);
  //Future<void> submitEconomicIndicators(String branchId, int year, int month, EconomicIndicatorsModel indicators);
  Future<List<FinancialReportModel>> getReportsForBranch(String branchId);
  Future<List<FinancialReportModel>> getReportsForFranchise(String franchiseId);
  Stream<List<FinancialReportModel>> watchReportsForBranch(String branchId);
}

class FinancialReportRemoteDataSourceImpl implements FinancialReportRemoteDataSource {
  final FirebaseFirestore _firestore;

  FinancialReportRemoteDataSourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<void> submitReport(FinancialReportModel report) async {
    await _firestore
        .collection('financialReports')
        .doc(report.id) // Убедись, что у report.id уникальное значение, например "$branchId_$year_$month"
        .set(report.toJson());
  }

  @override
  Future<List<FinancialReportModel>> getReportsForBranch(String branchId) async {
    final snapshot = await _firestore
        .collection('financialReports')
        .where('branchId', isEqualTo: branchId)
        .get();

    return snapshot.docs
        .map((doc) => FinancialReportModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<List<FinancialReportModel>> getReportsForFranchise(String franchiseId) async {
    final snapshot = await _firestore
        .collection('financialReports')
        .where('franchiseId', isEqualTo: franchiseId)
        .get();

    return snapshot.docs
        .map((doc) => FinancialReportModel.fromJson(doc.data()))
        .toList();
  }
  @override
  Stream<List<FinancialReportModel>> watchReportsForBranch(String branchId) {
    return FirebaseFirestore.instance
        .collection('financialReports')
        .where('branchId', isEqualTo: branchId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => FinancialReportModel.fromJson(doc.data())).toList());
  }

}

