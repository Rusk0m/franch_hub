import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/config/theme/theme_app.dart';
import 'package:franch_hub/features/franchise/presentation/screens/branch_reports_page/branch_reports_page.dart';
import 'package:franch_hub/features/franchise/presentation/screens/my_franchise_page/my_franchise_page.dart';
import 'package:franch_hub/features/home/presentation/view/home_page.dart';
import 'package:franch_hub/features/settings/presentation/bloc/theme_cubit.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';

import '../features/auth/presentation/screens/view/auth_page.dart';


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
                return HomePage();
              default:
                return const AuthPage();
            }
          }),
        );
      },
    );
  }
}
