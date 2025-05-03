import 'package:franch_hub/core/usecases/usecase.dart';
import 'package:franch_hub/features/financial_reports/domain/entities/financial_report.dart';
import 'package:franch_hub/features/financial_reports/domain/repositories/financial_report_repository.dart';

class GetReportsForFranchiseUseCase extends UseCase<List<FinancialReport>, String> {
  final FinancialReportRepository repository;

  GetReportsForFranchiseUseCase(this.repository);

  @override
  Future<List<FinancialReport>> call({String? params}) {
    if (params == null) throw ArgumentError("Params can't be null");

    return repository.getReportsForFranchise(params);
  }
}
