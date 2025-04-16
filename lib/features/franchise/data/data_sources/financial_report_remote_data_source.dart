import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/features/franchise/data/models/financial_report_model/financial_report_model.dart';
import 'package:franch_hub/features/franchise/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/franchise/domain/entities/finantion_report.dart';

abstract class FinancialReportRemoteDataSource {
  Future<void> submitReport(FinancialReportModel report);
  //Future<void> submitEconomicIndicators(String branchId, int year, int month, EconomicIndicatorsModel indicators);
  Future<List<FinancialReportModel>> getReportsForBranch(String branchId);
  Future<List<FinancialReportModel>> getReportsForFranchise(String franchiseId);
}

class FinancialReportRemoteDataSourceImpl implements FinancialReportRemoteDataSource {
  final FirebaseFirestore _firestore;

  FinancialReportRemoteDataSourceImpl({required FirebaseFirestore firestore}): _firestore = firestore;

  @override
  Future<void> submitReport(FinancialReportModel report) async {
    await _firestore
        .collection('franchise_branches')
        .doc(report.branchId)
        .collection('financial_reports')
        .doc('${report.year}_${report.month}')
        .set(report.toJson());
  }

  /*@override
  Future<void> submitEconomicIndicators(
      String branchId, int year, int month, EconomicIndicatorsModel indicators) async {
    await _firestore
        .collection('franchise_branches')
        .doc(branchId)
        .collection('financial_reports')
        .doc('${year}_${month}')
        .collection('indicators')
        .doc('summary')
        .set(indicators.toJson());
  }*/

  @override
  Future<List<FinancialReportModel>> getReportsForBranch(String branchId) async {
    final snapshot = await _firestore
        .collection('franchise_branches')
        .doc(branchId)
        .collection('financial_reports')
        .get();

    return snapshot.docs
        .map((doc) => FinancialReportModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<List<FinancialReportModel>> getReportsForFranchise(String franchiseId) async {
    final branchesSnapshot = await _firestore
        .collection('franchise_branches')
        .where('franchiseId', isEqualTo: franchiseId)
        .get();

    List<FinancialReportModel> allReports = [];

    for (var branchDoc in branchesSnapshot.docs) {
      final reportsSnapshot = await _firestore
          .collection('franchise_branches')
          .doc(branchDoc.id)
          .collection('financial_reports')
          .get();

      allReports.addAll(
        reportsSnapshot.docs.map((doc) => FinancialReportModel.fromJson(doc.data())),
      );
    }

    return allReports;
  }
}
