import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/features/franchise/domain/repositories/franchise_repository.dart';

class CreateFranchiseUseCase implements UseCase<void, Franchise> {
  final FranchiseRepository repository = sl();

  CreateFranchiseUseCase();

  @override
  Future<void> call({Franchise? params}) {
    if (params == null) throw ArgumentError('Franchise is required');
    return repository.createFranchise(params);
  }
}