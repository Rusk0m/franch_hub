part of 'financial_report_bloc.dart';

abstract class FinancialReportEvent {}

class SubmitReportEvent extends FinancialReportEvent {
  final FinancialReport report;

  SubmitReportEvent(this.report);
}

class LoadReportsForBranchEvent extends FinancialReportEvent {
  final String branchId;

  LoadReportsForBranchEvent(this.branchId);
}

class LoadReportsForFranchiseEvent extends FinancialReportEvent {
  final String franchiseId;

  LoadReportsForFranchiseEvent(this.franchiseId);
}
class StartWatchingBranchReportsEvent extends FinancialReportEvent {
  final String branchId;

  StartWatchingBranchReportsEvent(this.branchId);
}

class _BranchReportsUpdatedEvent extends FinancialReportEvent {
  final List<FinancialReport> reports;

  _BranchReportsUpdatedEvent(this.reports);
}


