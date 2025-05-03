import 'package:franch_hub/core/usecases/usecase.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/branches/domain/repositories/branch_repository.dart';

class DeleteBranchUseCase implements UseCase<void, String> {
  final BranchRepository repository=sl();

  DeleteBranchUseCase();

  @override
  Future<void> call({String? params}) async {
    if (params == null) throw ArgumentError('branchId is required');
    await repository.deleteBranch(params);
  }
}