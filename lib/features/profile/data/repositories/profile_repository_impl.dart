import 'package:franch_hub/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:franch_hub/features/profile/domain/repositories/profile_repository.dart';
import 'package:franch_hub/features/profile/domain/use_cases/update_password.dart';
import 'package:franch_hub/features/profile/domain/use_cases/update_profile.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepositoryImpl({required ProfileRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<void> updateProfile(UpdateProfileParams params) async {
    final data = <String, dynamic>{};

    if (params.name != null && params.name!.isNotEmpty) {
      data['name'] = params.name!;
    }
    if (params.phone != null && params.phone!.isNotEmpty) {
      data['phone'] = params.phone!;
    }
    if (params.avatarUrl != null && params.avatarUrl!.isNotEmpty) {
      data['avatarUrl'] = params.avatarUrl!;
    }

    if (data.isEmpty) return;

    print('Обновление профиля в Firestore: $data');
    await _remoteDataSource.updateProfileData(params.uid, data);
  }

  @override
  Future<void> updatePassword(UpdatePasswordParams params) async {
    await _remoteDataSource.updatePassword(params.uid, params.newPassword);
    }
}