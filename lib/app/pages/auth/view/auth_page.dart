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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 65,
                  ),
                  TitleIcon(),
                  SizedBox(
                    height: 65,
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
                    height: 40,
                  ),
                  CustomTextField(
                      controller: _emailController,
                      label: 'Username',
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
                        context.read<AuthBloc>().add(LoginRequested(
                            email: _emailController.text,
                            password: _passwordController.text));
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
                    height: 15,
                  ),
                  TextDivider(),
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
                      Text('Not a register user? ',style: FlutterTextTheme.bodyLarge(context),),
                      Text('Register Now!',style: FlutterTextTheme.custom(context: context,fontSize: 16,color:Theme.of(context).colorScheme.primary),)
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
