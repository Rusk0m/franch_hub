import 'package:franch_hub/features/profile/domain/use_cases/update_password.dart';
import 'package:franch_hub/features/profile/domain/use_cases/update_profile.dart';

abstract class ProfileRepository {
  Future<void> updateProfile(UpdateProfileParams params);

  Future<void> updatePassword(UpdatePasswordParams params);
}