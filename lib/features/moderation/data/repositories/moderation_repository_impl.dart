import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/features/moderation/data/data_sources/moderation_remote_data_source.dart';
import 'package:franch_hub/features/moderation/domain/repositories/moderation_repository.dart';

class ModerationRepositoryImpl implements ModerationRepository {
  final ModerationRemoteDataSource remoteDataSource;

  ModerationRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Franchise>> getPendingFranchises() async {
    final models = await remoteDataSource.getPendingFranchises();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> moderateFranchise(String franchiseId, String status) async {
    await remoteDataSource.moderateFranchise(franchiseId, status);
  }
}