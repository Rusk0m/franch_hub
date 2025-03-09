import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/app/blocs/authentication/auth_bloc.dart';
import 'package:franch_hub/app/global_widgets/navigation_button.dart';
import 'package:franch_hub/app/routes/app_routes.dart';
import 'package:franch_hub/app/theme/text_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {context.read<AuthBloc>().add(LogoutRequested());},
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
                  'Your Name',
                  style: FlutterTextTheme.headlineMedium(context),
                ),
                Text('youremail@gmail.com',style: FlutterTextTheme.bodyLarge(context),)
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              NavigationButton(icon: Icons.person, title: 'My Account',routeName: '/profile_settings',),
              SizedBox(
                height: 10,
              ),
              NavigationButton(icon: Icons.account_tree, title: 'My Franchise',),
              SizedBox(
                height: 10,
              ),
              NavigationButton(icon: Icons.account_balance_wallet_rounded, title: 'Transaction History',),
              SizedBox(
                height: 10,
              ),
              NavigationButton(
                icon: Icons.settings,
                title: 'General Settings',
                routeName: AppRouter.generalSettings,
              ),
            ],
          )
        ],
      ),
    );
  }
}
