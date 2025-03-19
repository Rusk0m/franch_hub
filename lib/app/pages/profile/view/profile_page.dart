import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/app/blocs/authentication/auth_bloc.dart';
import 'package:franch_hub/app/global_widgets/navigation_button.dart';
import 'package:franch_hub/app/models/user/user.dart';
import 'package:franch_hub/app/pages/auth/auth.dart';
import 'package:franch_hub/app/pages/profile/widgets/general_settings.dart';
import 'package:franch_hub/app/repositories/repositories.dart';
import 'package:franch_hub/app/routes/app_routes.dart';
import 'package:franch_hub/app/theme/text_theme.dart';
import 'package:franch_hub/app/theme/theme_cubit.dart';

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

  Widget _buildProfileContent(BuildContext context, User user) {
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
