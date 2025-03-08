import 'package:flutter/material.dart';
import 'package:franch_hub/app/pages/auth/view/auth_page.dart';
import 'package:franch_hub/app/pages/edit_account/view/edit_account_page.dart';
import 'package:franch_hub/app/pages/franchise_detail/view/franchise_detail_page.dart';
import 'package:franch_hub/app/pages/general_settings/view/general_settings_page.dart';
import 'package:franch_hub/app/pages/home/view/home_page.dart';

class AppRouter {
  static const String home = '/';
  static const String franchiseDetail = '/franchise_detail';
  static const String auth = '/auth';
  static const String generalSettings = '/general_settings';
  static const String profileSettings = '/profile_settings';



  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case franchiseDetail:
        final args = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => const FranchiseDetailPage());
      case generalSettings:
        return MaterialPageRoute(builder: (_)=> const GeneralSettingsPage());
      case profileSettings:
        return MaterialPageRoute(builder: (_)=> const EditAccountPage());
      case auth:
        return MaterialPageRoute(builder: (_)=> const AuthPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    body: Center(
                  child: Text('Маршрут ${settings.name} не найден'),
                )
            )
        );
    }
  }
}
