import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:franch_hub/features/franchise/domain/entities/economic_indicators.dart';
import 'package:franch_hub/features/franchise/domain/entities/finantion_report.dart';

class FinancialReportRemoteDataSource {
  final FirebaseFirestore _firestore;

  FinancialReportRemoteDataSource(this._firestore);

  Future<void> addFinancialReport(FinancialReport report) async {
    final docRef = _firestore
        .collection('franchises')
        .doc(report.franchiseId)
        .collection('branches')
        .doc(report.branchId)
        .collection('financial_reports')
        .doc('${report.year}_${report.month}');

    await docRef.set(report.toJson());
  }

  Future<void> saveIndicators({
    required String franchiseId,
    required String branchId,
    required int year,
    required int month,
    required EconomicIndicators indicators,
  }) async {
    final docRef = _firestore
        .collection('franchises')
        .doc(franchiseId)
        .collection('branches')
        .doc(branchId)
        .collection('financial_reports')
        .doc('${year}_${month}')
        .collection('economic_indicators')
        .doc('summary');

    await docRef.set(indicators.toJson());
  }
}
