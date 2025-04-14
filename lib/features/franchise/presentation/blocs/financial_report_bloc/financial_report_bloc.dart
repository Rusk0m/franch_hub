import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:franch_hub/features/franchise/domain/entities/finantion_report.dart';
import 'package:franch_hub/features/franchise/domain/use_case/get_reports_for_branch_use_%D1%81ase.dart';
import 'package:franch_hub/features/franchise/domain/use_case/get_reports_for_franchise_use_%D1%81ase.dart';
import 'package:franch_hub/features/franchise/domain/use_case/submit_financial_report_use_case.dart';

part 'financial_report_event.dart';
part 'financial_report_state.dart';

class FinancialReportBloc extends Bloc<FinancialReportEvent, FinancialReportState> {
  final SubmitFinancialReportUseCase submitUseCase;
  final GetReportsForBranchUseCase branchReportsUseCase;
  final GetReportsForFranchiseUseCase franchiseReportsUseCase;

  FinancialReportBloc({
    required this.submitUseCase,
    required this.branchReportsUseCase,
    required this.franchiseReportsUseCase,
  }) : super(FinancialReportInitial()) {
    on<SubmitReportEvent>(_onSubmit);
    on<LoadReportsForBranchEvent>(_onLoadBranchReports);
    on<LoadReportsForFranchiseEvent>(_onLoadFranchiseReports);
  }

  Future<void> _onSubmit(
      SubmitReportEvent event,
      Emitter<FinancialReportState> emit,
      ) async {
    emit(FinancialReportLoading());
    try {
      await submitUseCase(params: event.report);
      emit(FinancialReportSuccess());
    } catch (e) {
      emit(FinancialReportError(e.toString()));
    }
  }

  Future<void> _onLoadBranchReports(
      LoadReportsForBranchEvent event,
      Emitter<FinancialReportState> emit,
      ) async {
    emit(FinancialReportLoading());
    try {
      final reports = await branchReportsUseCase(params: event.branchId);
      emit(FinancialReportLoaded(reports));
    } catch (e) {
      emit(FinancialReportError(e.toString()));
    }
  }

  Future<void> _onLoadFranchiseReports(
      LoadReportsForFranchiseEvent event,
      Emitter<FinancialReportState> emit,
      ) async {
    emit(FinancialReportLoading());
    try {
      final reports = await franchiseReportsUseCase(params: event.franchiseId);
      emit(FinancialReportLoaded(reports));
    } catch (e) {
      emit(FinancialReportError(e.toString()));
    }
  }
}
