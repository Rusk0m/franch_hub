import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:franch_hub/features/profile/presentation/screens/widgets/profile_content.dart';
import 'package:franch_hub/features/auth/presentation/screens/view/auth_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is! Authenticated) {
          return const AuthPage();
        }
        return ProfileContent();
      },
    );
  }
}
