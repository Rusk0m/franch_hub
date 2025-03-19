import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/app/blocs/authentication/auth_bloc.dart';
import 'package:franch_hub/app/repositories/authentication_repository.dart';
import 'package:franch_hub/app/repositories/settings_repository.dart';
import 'package:franch_hub/app/theme/theme_cubit.dart';
import 'package:franch_hub/app/view/app_view.dart';
import 'package:franch_hub/l10n/cubit/locale_cubit.dart';

class App extends StatelessWidget {
  const App(
      {super.key,
      required this.authenticationRepository,
      required this.settingsRepository});

  final AuthenticationRepository authenticationRepository;
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
