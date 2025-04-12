import 'package:flutter/material.dart';
import 'package:franch_hub/features/auth/presentation/screens/view/view.dart';
import 'package:franch_hub/features/franchise/presentation/screens/franchise_detail/view/franchise_detail_page.dart';
import 'package:franch_hub/features/home/presentation/view/view.dart';
import 'package:franch_hub/features/profile/presentation/screens/edit_account/edit_account.dart';

class AppRouter {
  static const String home = '/';
  static const String franchiseDetail = '/franchise_detail';
  static const String auth = '/auth';
  static const String profileSettings = '/profile_settings';



  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case franchiseDetail:
        final args = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => const FranchiseDetailPage());
      case profileSettings:
        return MaterialPageRoute(builder: (_)=>  EditAccountPage());
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
