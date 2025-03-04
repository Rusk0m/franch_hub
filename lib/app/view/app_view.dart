import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/app/blocs/authentication/auth_bloc.dart';
import 'package:franch_hub/app/pages/auth/auth.dart';
import 'package:franch_hub/app/routes/app_routes.dart';
import 'package:franch_hub/app/theme/theme_app.dart';

import '../pages/home/home.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return MaterialApp(
          theme: FlutterAppTheme.light,
          darkTheme: FlutterAppTheme.dark,
          themeMode: ThemeMode.system,
          onGenerateRoute: AppRouter.generateRoute,
          //initialRoute: AppRouter.home,
          home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            switch (state) {
              case Authenticated _:
                return const HomePage();
              case Unauthenticated _:
                return const AuthPage();
              default:
                return const AuthPage();
            }
          }),
        );
      },
    );
  }
  String _getInitialRoute(AuthState state) {
    return state is Authenticated ? AppRouter.home : AppRouter.auth;
  }
}
