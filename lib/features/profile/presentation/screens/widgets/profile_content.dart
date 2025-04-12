import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/config/theme/theme.dart';
import 'package:franch_hub/core/global_widgets/global_widgets.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:franch_hub/features/settings/presentation/widgets/general_settings.dart';

class ProfileContent extends StatelessWidget {
  final UserEntity user;
  const ProfileContent({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My Account', style: FlutterTextTheme.headlineMedium(context)),
              IconButton(
                onPressed: () {
                  context.read<AuthBloc>().add(LogoutRequested());
                },
                icon: const Icon(Icons.logout, size: 35),
              )
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: Column(
              children: [
                const CircleAvatar(minRadius: 60, maxRadius: 65, child: Icon(Icons.person, size: 70)),
                const SizedBox(height: 10),
                Text(user.name ?? 'Your Name', style: FlutterTextTheme.headlineMedium(context)),
                Text(user.email ?? 'youremail@gmail.com', style: FlutterTextTheme.bodyLarge(context))
              ],
            ),
          ),
          const SizedBox(height: 50),
          Column(
            children: const [
              NavigationButton(icon: Icons.person, title: 'My Account', routeName: '/profile_settings'),
              SizedBox(height: 10),
              NavigationButton(icon: Icons.account_tree, title: 'My Franchise'),
              SizedBox(height: 10),
              NavigationButton(icon: Icons.account_balance_wallet_rounded, title: 'Transaction History'),
              SizedBox(height: 10),
              GeneralSettings(),
            ],
          )
        ],
      ),
    );
  }
}