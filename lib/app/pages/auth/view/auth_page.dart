import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:franch_hub/app/blocs/authentication/auth_bloc.dart';
import 'package:franch_hub/app/pages/auth/widgets/widgets.dart';
import 'package:franch_hub/app/theme/theme.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 75,
                ),
                TitleIcon(),
                SizedBox(
                  height: 75,
                ),
                Text('Welcome Back!',
                    style: FlutterTextTheme.custom(
                        context: context,
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).focusColor)),
                Text(
                  'Sing in your account',
                  style: FlutterTextTheme.titleLarge(context),
                ),
                SizedBox(
                  height: 50,
                ),
                AuthTextField(
                  controller: _emailController,
                    label: 'Username',
                    prefixIcon: Icons.person,
                    isPassword: false),
                SizedBox(
                  height: 20,
                ),
                AuthTextField(
                  controller: _passwordController,
                    label: 'Password',
                    prefixIcon: Icons.security,
                    suffixIcon: Icons.remove_red_eye,
                    isPassword: true),
                SizedBox(
                  height: 3,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Forgot password? ',
                    style: TextStyle(
                        fontSize: 16, decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(LoginRequested(email: _emailController.text, password: _passwordController.text));
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.primary)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Login',
                        style: FlutterTextTheme.custom(
                            color: Theme.of(context).colorScheme.surface,
                            fontWeight: FontWeight.w200,
                            fontSize: 26,
                            context: context),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                TextDivider(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingInButton(
                      icon: FontAwesomeIcons.google,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SingInButton(
                      icon: FontAwesomeIcons.apple,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
