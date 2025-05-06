import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/config/theme/theme_app.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:franch_hub/features/auth/presentation/screens/view/auth_page.dart';
import 'package:franch_hub/features/home/presentation/view/home_page.dart';
import 'package:franch_hub/features/moderation/presentation/screens/moderation_page.dart';
import 'package:franch_hub/features/settings/presentation/bloc/theme_cubit.dart';
import 'package:franch_hub/generated/l10n.dart';

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
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'),
            Locale('ru'),
            Locale('be'),
          ],
          onGenerateRoute: AppRouter.generateRoute,
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              print('AppView: AuthState changed to ${state.runtimeType}');
              final l10n = S.of(context)!;
              if (state is Authenticated) {
                print('AppView: User authenticated, Role: ${state.user.role}');
                if (state.user.role == 'admin') {
                  return ModerationPage();
                }
                return HomePage();
              } else if (state is Unauthenticated ||
                  state is AuthRegistering ||
                  state is AuthLoading ||
                  state is AuthInitial) {
                print('AppView: Unauthenticated or loading');
                return const AuthPage();
              } else if (state is AuthError) {
                print('AppView: AuthError - ${state.message}');
                return Scaffold(
                  body: Center(child: Text(l10n.errorMessage(state.message))),
                );
              }
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            },
          ),
        );
      },
    );
  }
}