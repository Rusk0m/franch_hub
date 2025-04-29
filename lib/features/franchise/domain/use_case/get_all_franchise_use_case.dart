import 'package:franch_hub/core/usecase/no_params.dart';
import 'package:franch_hub/core/usecase/usecase.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/features/franchise/domain/repositories/franchise_repository.dart';

class GetAllFranchisesUseCase implements UseCase<List<Franchise>, NoParams> {
  final FranchiseRepository repository = sl();

  GetAllFranchisesUseCase();

  @override
  Future<List<Franchise>> call({NoParams? params}) {
    return repository.getAllFranchises();
  }
}