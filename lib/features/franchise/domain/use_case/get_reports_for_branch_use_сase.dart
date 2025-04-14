import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/features/franchise/domain/entities/finantion_report.dart';
import 'package:franch_hub/features/franchise/domain/repositories/financial_report_repository.dart';

class GetReportsForBranchUseCase extends UseCase<List<FinancialReport>, String> {
  final FinancialReportRepository repository;

  GetReportsForBranchUseCase(this.repository);

  @override
  Future<List<FinancialReport>> call({String? params}) {
    if (params == null) throw ArgumentError('branchId is required');
    return repository.getReportsForBranch(params);
  }
}
