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
    final TextEditingController _nameController = TextEditingController();

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          bool isRegistering = state is AuthRegistering;
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  TitleIcon(),
                  SizedBox(
                    height: 60,
                  ),
                  Text('Welcome Back!',
                      style: FlutterTextTheme.custom(
                          context: context,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).focusColor)),
                  Text(
                    isRegistering
                        ? 'Create a new account'
                        : 'Sing in your account',
                    style: FlutterTextTheme.titleLarge(context),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  if (isRegistering) ...[
                    CustomTextField(
                      controller: _nameController,
                      label: 'Username',
                      prefixIcon: Icons.account_balance_outlined,
                      isPassword: false,
                    ),
                    SizedBox(height: 20),
                  ],
                  CustomTextField(
                      controller: _emailController,
                      label: 'Email',
                      prefixIcon: Icons.person,
                      isPassword: false),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      controller: _passwordController,
                      label: 'Password',
                      prefixIcon: Icons.security,
                      suffixIcon: Icons.remove_red_eye,
                      isPassword: true),
                  SizedBox(
                    height: 3,
                  ),
                  if (!isRegistering)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Forgot password? ',
                        style: TextStyle(
                            fontSize: 16, decoration: TextDecoration.underline),
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        isRegistering
                            ? context.read<AuthBloc>().add(SignUpRequested(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text))
                            : context.read<AuthBloc>().add(LoginRequested(
                                email: _emailController.text,
                                password: _passwordController.text));
                      },
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.primary)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          isRegistering ? 'Registration' : 'Login',
                          style: FlutterTextTheme.custom(
                              color: Theme.of(context).colorScheme.surface,
                              fontWeight: FontWeight.w200,
                              fontSize: 26,
                              context: context),
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  TextDivider(
                    height: 2,
                    title: 'Or Continue With',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingInButton(
                        icon: FontAwesomeIcons.google,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SingInButton(
                        icon: FontAwesomeIcons.apple,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isRegistering
                            ? 'Already have an account? '
                            : 'Not a registered user? ',
                        style: FlutterTextTheme.bodyLarge(context),
                      ),
                      GestureDetector(
                        onTap: () =>
                            context.read<AuthBloc>().add(ToggleAuthMode()),
                        child: Text(
                          isRegistering ? 'LogIn!' : 'Register Now!',
                          style: FlutterTextTheme.custom(
                              context: context,
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
