import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/theme/theme.dart';
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/core/global_widgets/global_widgets.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:franch_hub/features/settings/presentation/widgets/general_settings.dart';

import '../../../../../auth/presentation/screens/view/auth_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is! Authenticated) {
          return const AuthPage();
        }
        return _buildProfileContent(context, state.user); // Передаем context
      },
    );
  }

  Widget _buildProfileContent(BuildContext context, UserEntity user) {
    // Принимаем context

    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Account',
                style: FlutterTextTheme.headlineMedium(context),
              ),
              IconButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(LogoutRequested());
                  },
                  icon: Icon(
                    Icons.logout,
                    size: 35,
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  minRadius: 60,
                  maxRadius: 65,
                  child: Icon(
                    Icons.person,
                    size: 70,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  user.name ?? 'Your Name',
                  style: FlutterTextTheme.headlineMedium(context),
                ),
                Text(
                  user.email??'youremail@gmail.com',
                  style: FlutterTextTheme.bodyLarge(context),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              NavigationButton(
                icon: Icons.person,
                title: 'My Account',
                routeName: '/profile_settings',
              ),
              SizedBox(
                height: 10,
              ),
              NavigationButton(
                icon: Icons.account_tree,
                title: 'My Franchise',
              ),
              SizedBox(
                height: 10,
              ),
              NavigationButton(
                icon: Icons.account_balance_wallet_rounded,
                title: 'Transaction History',
              ),
              SizedBox(
                height: 10,
              ),
              GeneralSettings(),
            ],
          )
        ],
      ),
    );
  }
}
