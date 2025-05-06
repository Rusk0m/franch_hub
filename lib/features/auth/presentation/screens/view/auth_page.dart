import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:franch_hub/config/theme/theme.dart';
import 'package:franch_hub/core/global_widgets/global_widgets.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:franch_hub/features/auth/presentation/widgets/widgets.dart';
import 'package:franch_hub/generated/l10n.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context)!;
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            _nameController.text = '';
            _emailController.text = '';
            _passwordController.text = '';
            FocusScope.of(context).unfocus();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
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
                  SizedBox(height: 60),
                  TitleIcon(),
                  SizedBox(height: 60),
                  Text(
                    l10n.welcomeBack,
                    style: FlutterTextTheme.custom(
                        context: context,
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).focusColor),
                  ),
                  Text(
                    isRegistering ? l10n.createNewAccount : l10n.signInAccount,
                    style: FlutterTextTheme.titleLarge(context),
                  ),
                  SizedBox(height: 30),
                  if (isRegistering) ...[
                    CustomTextField(
                      controller: _nameController,
                      label: l10n.usernameLabel,
                      prefixIcon: Icons.account_balance_outlined,
                      isPassword: false,
                    ),
                    SizedBox(height: 20),
                  ],
                  CustomTextField(
                    controller: _emailController,
                    label: l10n.emailLabel,
                    prefixIcon: Icons.person,
                    isPassword: false,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: _passwordController,
                    label: l10n.passwordLabel,
                    prefixIcon: Icons.security,
                    suffixIcon: Icons.remove_red_eye,
                    isPassword: true,
                  ),
                  SizedBox(height: 3),
                  if (!isRegistering)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        l10n.forgotPassword,
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      if (isRegistering) {
                        context.read<AuthBloc>().add(SignUpRequested(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context,
                        ));
                      } else {
                        context.read<AuthBloc>().add(LoginRequested(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context,
                        ));
                      }
                      print('Состояние: ${state.toString()}');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        isRegistering ? l10n.registrationButton : l10n.loginButton,
                        style: FlutterTextTheme.custom(
                          color: Theme.of(context).colorScheme.surface,
                          fontWeight: FontWeight.w200,
                          fontSize: 26,
                          context: context,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextDivider(
                    height: 2,
                    title: l10n.orContinueWith,
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingInButton(
                        icon: FontAwesomeIcons.google,
                        onPressed: () {
                          context.read<AuthBloc>().add(GoogleLoginRequested(context: context));
                        },
                      ),
                      SizedBox(width: 15),
                      SingInButton(
                        icon: FontAwesomeIcons.apple,
                        onPressed: () {
                          // TODO: Реализовать вход через Apple
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isRegistering ? l10n.alreadyHaveAccount : l10n.notRegisteredUser,
                        style: FlutterTextTheme.bodyLarge(context),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<AuthBloc>().add(ToggleAuthMode());
                          print(state.toString());
                        },
                        child: Text(
                          isRegistering ? l10n.logInLink : l10n.registerNowLink,
                          style: FlutterTextTheme.custom(
                            context: context,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}