import 'package:franch_hub/features/branches/data/data_soureces/branch_remote_data_source.dart';
import 'package:franch_hub/features/branches/data/repositories/branch_repository_implement.dart';
import 'package:franch_hub/features/branches/domain/repositories/branch_repository.dart';
import 'package:franch_hub/features/branches/domain/use_case/add_branch_use_case.dart';
import 'package:franch_hub/features/branches/domain/use_case/create_pending_branch_use_case.dart';
import 'package:franch_hub/features/branches/domain/use_case/delete_branch_use_case.dart';
import 'package:franch_hub/features/branches/domain/use_case/edit_branch_use_case.dart';
import 'package:franch_hub/features/branches/domain/use_case/get_pending_branches_use_case.dart';
import 'package:franch_hub/features/branches/domain/use_case/moderate_branch_use_case.dart';
import 'package:franch_hub/features/branches/presentation/bloc/branches_bloc/branch_bloc.dart';
import 'package:franch_hub/features/chat/data/data_source/chat_remote_data_source.dart';
import 'package:franch_hub/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:franch_hub/features/chat/domain/repositories/chat_repository.dart';
import 'package:franch_hub/features/chat/domain/use_case/get_message_use_case.dart';
import 'package:franch_hub/features/chat/domain/use_case/send_message_use_case.dart';
import 'package:franch_hub/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:franch_hub/features/financial_reports/data/data_source/financial_report_remote_data_source.dart';
import 'package:franch_hub/features/financial_reports/domain/use_case/watch_reports_for_branch_use_case.dart';
import 'package:franch_hub/features/financial_reports/presentation/bloc/financial_report_bloc/financial_report_bloc.dart';
import 'package:franch_hub/features/franchise/data/data_sources/franchise_remote_data_source.dart';
import 'package:franch_hub/features/franchise/domain/use_case/create_franchise_use_case.dart';
import 'package:franch_hub/features/franchise/domain/use_case/get_all_franchise_use_case.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/franchise_bloc/franchise_bloc.dart';
import 'package:franch_hub/features/moderation/data/data_sources/moderation_remote_data_source.dart';
import 'package:franch_hub/features/moderation/data/repositories/moderation_repository_impl.dart';
import 'package:franch_hub/features/moderation/domain/repositories/moderation_repository.dart';
import 'package:franch_hub/features/moderation/domain/use_cases/get_pending_franchises.dart';
import 'package:franch_hub/features/moderation/domain/use_cases/moderate_franchise.dart';
import 'package:franch_hub/features/moderation/presentation/bloc/moderation_bloc.dart';
import 'package:franch_hub/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:franch_hub/features/transactions/data/data_source/transaction_remote_data_source.dart';
import 'package:franch_hub/features/financial_reports/data/repositories/financial_report_repository_impl.dart';
import 'package:franch_hub/features/franchise/data/repositories/franchise_repository_implement.dart';
import 'package:franch_hub/features/transactions/data/repositories/transactions_repository_impl.dart';
import 'package:franch_hub/features/franchise/domain/repositories/franchise_repository.dart';
import 'package:franch_hub/features/transactions/domain/repository/transaction_repository.dart';
import 'package:franch_hub/features/franchise/domain/services/economic_indicators_service.dart';
import 'package:franch_hub/features/transactions/domain/use_case/create_transaction_use_case.dart';
import 'package:franch_hub/features/financial_reports/domain/use_case/get_aggregated_indicators_for_franchise_use_case.dart';
import 'package:franch_hub/features/branches/domain/use_case/get_branches_for_franchise_use_case.dart';
import 'package:franch_hub/features/financial_reports/domain/use_case/get_economic_indicators_for_branch_use_case.dart';
import 'package:franch_hub/features/transactions/domain/use_case/get_filtered_transactions_use_case.dart';
import 'package:franch_hub/features/branches/domain/use_case/get_my_branches_use_case.dart';
import 'package:franch_hub/features/franchise/domain/use_case/get_my_franchises_use_case.dart';
import 'package:franch_hub/features/financial_reports/domain/use_case/get_reports_for_branch_use_%D1%81ase.dart';
import 'package:franch_hub/features/financial_reports/domain/use_case/get_reports_for_franchise_use_%D1%81ase.dart';
import 'package:franch_hub/features/transactions/domain/use_case/get_transactions_for_branch_use_case.dart';
import 'package:franch_hub/features/financial_reports/domain/use_case/submit_financial_report_use_case.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/%20economic_indicators/economic_indicators_bloc.dart';
import 'package:franch_hub/features/profile/domain/use_cases/update_password.dart';
import 'package:franch_hub/features/profile/domain/use_cases/update_profile.dart';
import 'package:franch_hub/features/settings/data/settings_repository.dart';
import 'package:franch_hub/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';
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

import '../features/financial_reports/domain/repositories/financial_report_repository.dart';

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
  sl.registerLazySingleton<FinancialReportRemoteDataSource>(
          () => FinancialReportRemoteDataSourceImpl(firestore: sl()));

  sl.registerLazySingleton<FranchiseRemoteDataSource>(
          () => FranchiseRemoteDataSourceImpl(firestore: sl()));
  sl.registerLazySingleton<BranchRemoteDataSource>(
          () => BranchRemoteDataSourceImpl());
  sl.registerLazySingleton<TransactionRemoteDataSource>(
          () => TransactionRemoteDataSourceImpl());
  sl.registerLazySingleton<ModerationRemoteDataSource>(
        () => ModerationRemoteDataSourceImpl(firestore: sl()),
  );
  sl.registerLazySingleton<ChatRemoteDataSource>(
        () => ChatRemoteDataSourceImpl(firestore: sl()),
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
  sl.registerLazySingleton<FinancialReportRepository>(
          () => FinancialReportRepositoryImpl(sl()));

  sl.registerLazySingleton<FranchiseRepository>(
          () => FranchiseRepositoryImpl(sl()));

  sl.registerLazySingleton<TransactionRepository>(
          () => TransactionRepositoryImpl(sl()));

  sl.registerLazySingleton<BranchRepository>(
          () => BranchRepositoryImpl());
  sl.registerLazySingleton<ModerationRepository>(
        () => ModerationRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<ChatRepository>(
        () => ChatRepositoryImpl(),
  );

  // Services
  sl.registerLazySingleton(() => EconomicIndicatorsService());

  //UseCase
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePasswordUseCase(sl()));

  sl.registerLazySingleton(() => SubmitFinancialReportUseCase());
  sl.registerLazySingleton(() => GetReportsForBranchUseCase(sl()));
  sl.registerLazySingleton(() => GetReportsForFranchiseUseCase(sl()));
  sl.registerLazySingleton(() => GetEconomicIndicatorsForBranchUseCase());
  sl.registerLazySingleton(() => GetBranchesForFranchiseUseCase(sl()));
  sl.registerLazySingleton(() => GetMyBranchesUseCase(sl()));
  sl.registerLazySingleton(() => GetMyFranchisesUseCase(sl()));
  sl.registerLazySingleton(() => GetAggregatedIndicatorsForFranchiseUseCase( repository: sl(), indicatorsService: sl()));

  sl.registerLazySingleton(() => CreateTransactionUseCase());
  sl.registerLazySingleton(() => GetFilteredTransactionsUseCase());
  sl.registerLazySingleton(() => GetTransactionsForBranchUseCase());

  sl.registerLazySingleton(() => WatchReportsForBranchUseCase());
  sl.registerLazySingleton(() => CreateFranchiseUseCase());
  sl.registerLazySingleton(() => GetAllFranchisesUseCase());
  sl.registerLazySingleton(() => GetPendingFranchisesUseCase(sl()));
  sl.registerLazySingleton(() => ModerateFranchiseUseCase());
  sl.registerLazySingleton(() => CreatePendingBranchUseCase(sl()));
  sl.registerLazySingleton(() => GetPendingBranchesUseCase());
  sl.registerLazySingleton(() => ModerateBranchUseCase(sl()));
  sl.registerLazySingleton(() => SendMessageUseCase(sl()));
  sl.registerLazySingleton(() => GetMessagesUseCase());
  sl.registerLazySingleton(() => AddBranchUseCase());
  sl.registerLazySingleton(() => EditBranchUseCase());
  sl.registerLazySingleton(() => DeleteBranchUseCase());

  // Other
  sl.registerLazySingleton(() => SettingsRepository());



  sl.registerFactory(() => FranchiseBloc());
  sl.registerFactory(() => FinancialReportBloc());
  sl.registerFactory(() => ChatBloc());
  sl.registerFactory(() => BranchBloc());
  sl.registerFactory(() => TransactionBloc());
  sl.registerFactory(() => ModerationBloc());
  sl.registerFactory(() => EconomicIndicatorsBloc());
  sl.registerFactory(() => ProfileBloc(authRepository:sl()));
}
