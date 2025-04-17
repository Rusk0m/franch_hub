import 'package:flutter/material.dart';
import 'package:franch_hub/features/auth/presentation/screens/view/view.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/franchise/presentation/screens/branch_indicators_page/branch_indicators_page.dart';
import 'package:franch_hub/features/franchise/presentation/screens/franchise_branches_page/franchise_branches_page.dart';
import 'package:franch_hub/features/franchise/presentation/screens/franchise_detail/view/franchise_detail_page.dart';
import 'package:franch_hub/features/franchise/presentation/screens/my_franchise_page/my_franchise_page.dart';
import 'package:franch_hub/features/home/presentation/view/view.dart';
import 'package:franch_hub/features/profile/presentation/screens/edit_account/edit_account.dart';

class AppRouter {
  static const String home = '/';
  static const String franchiseDetail = '/franchise_detail';
  static const String auth = '/auth';
  static const String profileSettings = '/profile_settings';
  static const String myFranchisesPage = '/myFranchisesPage';
  static const String franchiseBranchesPage = '/franchiseBranchesPage';
  static const String branchIndicatorsPage = '/branchIndicatorsPage';

  



  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case franchiseDetail:
        final args = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => const FranchiseDetailPage());
      case myFranchisesPage:
        return MaterialPageRoute(builder: (_) => MyFranchisesPage());
      case franchiseBranchesPage:
        final franchise = settings.arguments as Franchise;
        return MaterialPageRoute(builder: (_) => FranchiseBranchesPage(franchise: franchise));
      case branchIndicatorsPage:
        final branch = settings.arguments as FranchiseBranch;
        return MaterialPageRoute(builder: (_) => BranchIndicatorsPage(branchId: branch.id,));
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
