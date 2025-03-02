import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/app/blocs/authentication/auth_bloc.dart';
import 'package:franch_hub/app/repositories/authentication_repository.dart';
import 'package:franch_hub/app/view/app_view.dart';

class App extends StatelessWidget {
  const App({super.key, required this.authenticationRepository});

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [RepositoryProvider.value(value: authenticationRepository)],
        child: MultiBlocProvider(providers: [
          BlocProvider.value(
            value: AuthBloc(authRepository: authenticationRepository)
              ..add(CheckAuthStatus()),
          ),
        ], child: AppView()));
  }
}
