import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/features/franchise/data/models/financial_report_model/financial_report_model.dart';
import 'package:franch_hub/features/franchise/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/franchise/domain/entities/finantion_report.dart';
import 'package:franch_hub/features/franchise/domain/repositories/financial_report_repository.dart';

class FinancialReportRepositoryImpl implements FinancialReportRepository {
  final FirebaseFirestore firestore;

  FinancialReportRepositoryImpl(this.firestore);

  @override
  Future<void> submitReport(FinancialReport report) async {
    await firestore
        .collection('branches')
        .doc(report.branchId)
        .collection('financialReports')
        .doc('${report.year}-${report.month}')
        .set(report.toJson());
  }

  @override
  Future<List<FinancialReport>> getReportsForBranch(String branchId) async {
    final snapshot = await firestore
        .collection('branches')
        .doc(branchId)
        .collection('financialReports')
        .get();

    return snapshot.docs
        .map((doc) => FinancialReportModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<List<FinancialReport>> getReportsForFranchise(String franchiseId) async {
    final branchSnapshot = await firestore
        .collection('branches')
        .where('franchiseId', isEqualTo: franchiseId)
        .get();

    List<FinancialReport> allReports = [];

    for (var branchDoc in branchSnapshot.docs) {
      final reportsSnapshot = await branchDoc.reference.collection('financialReports').get();
      final reports = reportsSnapshot.docs
          .map((doc) => FinancialReportModel.fromJson(doc.data()))
          .toList();
      allReports.addAll(reports);
    }

    return allReports;
  }

  @override
  Future<void> submitEconomicIndicators(
      String branchId,
      int year,
      int month,
      EconomicIndicators indicators,
      ) async {
    await firestore
        .collection('branches')
        .doc(branchId)
        .collection('economicIndicators')
        .doc('$year-$month')
        .set(indicators.toJson());
  }
}
