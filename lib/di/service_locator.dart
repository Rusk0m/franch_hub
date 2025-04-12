import 'package:franch_hub/features/profile/domain/use_cases/update_password.dart';
import 'package:franch_hub/features/profile/domain/use_cases/update_profile.dart';
import 'package:franch_hub/features/settings/data/settings_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:franch_hub/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:franch_hub/features/auth/data/repository/authentication_repository_impl.dart';
import 'package:franch_hub/features/auth/domain/repository/authentication_repository.dart';

import 'package:franch_hub/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:franch_hub/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:franch_hub/features/profile/domain/repositories/profile_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
     // Firebase core services
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => GoogleSignIn.standard());

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(
      firebaseAuth: sl(),
      googleSignIn: sl(),
      firestore: sl(),
    ),
  );

  sl.registerLazySingleton<ProfileRemoteDataSource>(
        () => ProfileRemoteDataSourceImpl(
      firestore: sl(),
      auth: sl(),
    ),
  );

  // Repositories
  sl.registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(
      remoteDataSource: sl(),
      firebaseAuth: sl(),
    ),
  );

  sl.registerLazySingleton<ProfileRepository>(
        () => ProfileRepositoryImpl(remoteDataSource: sl()),
  );

  //UseCase
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePasswordUseCase(sl()));


  // Other
  sl.registerLazySingleton(() => SettingsRepository());
}
