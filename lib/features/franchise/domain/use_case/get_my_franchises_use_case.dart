import 'package:franch_hub/core/usecases/usecase.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/features/franchise/domain/repositories/franchise_repository.dart';

class GetMyFranchisesUseCase implements UseCase<List<Franchise>, String> {
  final FranchiseRepository repository;

  GetMyFranchisesUseCase(this.repository);

  @override
  Future<List<Franchise>> call({String? params}) {
    if (params == null) throw ArgumentError('ownerId is required');
    return repository.getMyFranchises(params);
  }
}
