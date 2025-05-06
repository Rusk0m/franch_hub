import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/app/app_view.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/auth/domain/repository/authentication_repository.dart';
import 'package:franch_hub/features/branches/presentation/bloc/branches_bloc/branch_bloc.dart';
import 'package:franch_hub/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:franch_hub/features/financial_reports/presentation/bloc/financial_report_bloc/financial_report_bloc.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/%20economic_indicators/economic_indicators_bloc.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/franchise_bloc/franchise_bloc.dart';
import 'package:franch_hub/features/moderation/presentation/bloc/moderation_bloc.dart';
import 'package:franch_hub/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:franch_hub/features/settings/data/settings_repository.dart';
import 'package:franch_hub/features/settings/presentation/bloc/theme_cubit.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:franch_hub/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart';

import '../features/settings/presentation/bloc/locale_cubit.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: sl<AuthenticationRepository>()),
          RepositoryProvider.value(value:sl<SettingsRepository>())
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider.value(
            value: AuthBloc(authRepository: sl())
              ..add(CheckAuthStatus(context: context)),
          ),
          BlocProvider(
            create: (_) => ThemeCubit(sl()),
          ),
          BlocProvider.value(
            value: LocaleCubit(sl()),
          ),
          BlocProvider.value(value: ProfileBloc(authRepository: sl())),
          BlocProvider.value(value: FinancialReportBloc()),
          BlocProvider.value(value: BranchBloc()),
          BlocProvider.value(value: FranchiseBloc()),
          BlocProvider.value(value: EconomicIndicatorsBloc()),
          BlocProvider.value(value: TransactionBloc()),
          BlocProvider.value(value: ModerationBloc()),
          BlocProvider.value(value: ChatBloc()),
        ], child: AppView()));
  }
}
