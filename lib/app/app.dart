import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/app/app_view.dart';
import 'package:franch_hub/features/auth/data/repository/authentication_repository_impl.dart';
import 'package:franch_hub/features/settings/data/settings_repository.dart';
import 'package:franch_hub/features/settings/presentation/bloc/theme_cubit.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';

import '../features/settings/presentation/bloc/locale_cubit.dart';

class App extends StatelessWidget {
  const App(
      {super.key,
      required this.authenticationRepository,
      required this.settingsRepository});

  final AuthenticationRepositoryImpl authenticationRepository;
  final SettingsRepository settingsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: authenticationRepository),
          RepositoryProvider.value(value: settingsRepository)
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider.value(
            value: AuthBloc(authRepository: authenticationRepository)
              ..add(CheckAuthStatus()),
          ),
          BlocProvider(
            create: (_) => ThemeCubit(settingsRepository),
          ),
          BlocProvider.value(
            value: LocaleCubit(settingsRepository),
          )
        ], child: AppView()));
  }
}
