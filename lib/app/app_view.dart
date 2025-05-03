import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/config/theme/theme_app.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:franch_hub/features/auth/presentation/screens/view/auth_page.dart';
import 'package:franch_hub/features/home/presentation/view/home_page.dart';
import 'package:franch_hub/features/moderation/presentation/screens/moderation_page.dart';
import 'package:franch_hub/features/settings/presentation/bloc/theme_cubit.dart';

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
              print('AppView: AuthState changed to ${state.runtimeType}');
              if (state is Authenticated) {
                print('AppView: User authenticated, Role: ${state.user.role}');
                if (state.user.role == 'admin') {
                  return ModerationPage(currentUser: state.user);
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
                  body: Center(child: Text('Error: ${state.message}')),
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