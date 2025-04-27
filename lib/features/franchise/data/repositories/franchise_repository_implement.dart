import 'package:franch_hub/features/franchise/data/data_sources/franchise_remote_data_source.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/franchise/domain/repositories/franchise_repository.dart';

class FranchiseRepositoryImpl implements FranchiseRepository {
  final FranchiseRemoteDataSource remoteDataSource;

  FranchiseRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Franchise>> getMyFranchises(String ownerId) async {
    final models = await remoteDataSource.getMyFranchises(ownerId);
    return models.map((model)=> model.toEntity()).toList();
  }
}
