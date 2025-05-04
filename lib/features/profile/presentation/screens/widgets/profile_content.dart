import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/config/theme/theme.dart';
import 'package:franch_hub/core/global_widgets/global_widgets.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:franch_hub/features/settings/presentation/widgets/general_settings.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/config/theme/theme.dart';
import 'package:franch_hub/core/global_widgets/global_widgets.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:franch_hub/features/settings/presentation/widgets/general_settings.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            final UserEntity user = state.user;
            return ListView(
              padding: const EdgeInsets.all(16),
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
                      icon: const Icon(Icons.logout, size: 35),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        minRadius: 60,
                        maxRadius: 65,
                        child: Icon(Icons.person, size: 70),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        user.name ?? 'Your Name',
                        style: FlutterTextTheme.headlineMedium(context),
                      ),
                      Text(
                        user.email ?? 'youremail@gmail.com',
                        style: FlutterTextTheme.bodyLarge(context),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                const NavigationButton(
                  icon: Icons.person,
                  title: 'Edit Account',
                  routeName: '/profile_settings',
                ),
                const SizedBox(height: 10),
                const NavigationButton(
                  icon: Icons.account_tree,
                  title: 'My Franchise',
                  routeName: '/my_franchises_page',
                ),
                const SizedBox(height: 10),
                const NavigationButton(
                  icon: Icons.location_city_rounded,
                  title: 'My Branches',
                  routeName: '/my_branches_page',
                ),
                const SizedBox(height: 10),
                const NavigationButton(
                  icon: Icons.location_city_rounded,
                  title: 'Moderation',
                  routeName: '/moderation',
                ),
                const SizedBox(height: 10),
                const GeneralSettings(),
              ],
            );
          } else if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Не удалось загрузить профиль'));
          }
        },
      ),
    );
  }
}
