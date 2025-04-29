part of 'financial_report_bloc.dart';

abstract class FinancialReportState {}

class FinancialReportInitial extends FinancialReportState {}

class FinancialReportLoading extends FinancialReportState {}

class FinancialReportLoaded extends FinancialReportState {
  final List<FinancialReport> reports;

  FinancialReportLoaded(this.reports);
}

class FinancialReportSubmitSuccess extends FinancialReportState {}

class FinancialReportSuccess extends FinancialReportState {}

class FinancialReportError extends FinancialReportState {
  final String message;

  FinancialReportError(this.message);
}

