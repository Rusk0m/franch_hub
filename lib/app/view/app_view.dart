import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/app/blocs/authentication/auth_bloc.dart';
import 'package:franch_hub/app/pages/auth/auth.dart';
import 'package:franch_hub/app/routes/app_routes.dart';
import 'package:franch_hub/app/theme/theme_app.dart';
import 'package:franch_hub/app/theme/theme_cubit.dart';

import '../pages/home/home.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          theme: FlutterAppTheme.light,
          darkTheme: FlutterAppTheme.dark,
          themeMode: themeMode,
          onGenerateRoute: AppRouter.generateRoute,
          home: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
            switch (state) {
              case Authenticated _:
                return const HomePage();
              default:
                return const AuthPage();
            }
          }),
        );
      },
    );
  }
}
