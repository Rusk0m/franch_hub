import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/auth/presentation/screens/view/view.dart';
import 'package:franch_hub/features/branches/domain/entities/franchise_branch.dart';
import 'package:franch_hub/features/branches/presentation/screens/franchise_branches_pages/branch_detail_page/branch_detail_page.dart';
import 'package:franch_hub/features/branches/presentation/screens/franchise_branches_pages/franchise_branches_page/franchise_branches_page.dart';
import 'package:franch_hub/features/branches/presentation/screens/franchise_branches_pages/my_branches_page/add_branch_page.dart';
import 'package:franch_hub/features/branches/presentation/screens/franchise_branches_pages/my_branches_page/edit_branch_page.dart';
import 'package:franch_hub/features/branches/presentation/screens/franchise_branches_pages/my_branches_page/my_branches_page.dart';
import 'package:franch_hub/features/chat/presentation/screens/chat_page.dart';
import 'package:franch_hub/features/financial_reports/presentation/screens/branch_indicators_page/branch_indicators_page.dart';
import 'package:franch_hub/features/financial_reports/presentation/screens/submit_report_page/submit_financial_report_page.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/features/franchise/presentation/screens/create_franchise_page/create_franchise_page.dart';
import 'package:franch_hub/features/franchise/presentation/screens/franchise_detail/view/franchise_detail_page.dart';
import 'package:franch_hub/features/franchise/presentation/screens/my_franchise_page/my_franchise_page.dart';
import 'package:franch_hub/features/home/presentation/view/view.dart';
import 'package:franch_hub/features/moderation/presentation/screens/moderation_page.dart';
import 'package:franch_hub/features/profile/presentation/screens/edit_account/edit_account.dart';
import 'package:franch_hub/features/transactions/presentation/screen/transactions_page/transactions_page.dart';

class AppRouter {
  static const String home = '/';
  static const String franchiseDetailPage = '/franchise_detail';
  static const String auth = '/auth';
  static const String profileSettings = '/profile_settings';
  static const String myFranchisesPage = '/my_franchises_page';
  static const String myBranchesPage = '/my_branches_page';
  static const String franchiseBranchesPage = '/franchise_branches_page';
  static const String branchIndicatorsPage = '/branch_indicators_page';
  static const String branchDetailsPage = '/branch_details_page';
  static const String submitFinancialReportPage = '/submit_financial_report_page';
  static const String transactionsPage = '/transactions_page';
  static const String createFranchisePage = '/create_franchise';
  static const String moderationPage = '/moderation';
  static const String addBranchPage = '/add_branch_page';
  static const String editBranchPage = '/edit_branch_page';
  static const String chatPage = '/chat_page';

  static Future<bool> _isAdmin() async {
    final user = sl<FirebaseAuth>().currentUser;
    if (user == null) return false;
    final userDoc = await sl<FirebaseFirestore>()
        .collection('users')
        .doc(user.uid)
        .get();
    return userDoc.exists && userDoc.data()?['role'] == 'admin';
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case franchiseDetailPage:
        final franchise = settings.arguments as Franchise;
        return MaterialPageRoute(builder: (_) => FranchiseDetailPage(franchise: franchise));
      case myFranchisesPage:
        return MaterialPageRoute(builder: (_) => MyFranchisesPage());
      case myBranchesPage:
        return MaterialPageRoute(builder: (_) => MyBranchesPage());
      case branchDetailsPage:
        final branch = settings.arguments as FranchiseBranch;
        return MaterialPageRoute(builder: (_) => BranchDetailsPage(branch: branch));
      case submitFinancialReportPage:
        final branch = settings.arguments as FranchiseBranch;
        return MaterialPageRoute(builder: (_) => SubmitFinancialReportPage(branch: branch));
      case transactionsPage:
        final branch = settings.arguments as FranchiseBranch;
        return MaterialPageRoute(builder: (_) => TransactionsPage(branchId: branch.id));
      case franchiseBranchesPage:
        final franchise = settings.arguments as Franchise;
        return MaterialPageRoute(builder: (_) => FranchiseBranchesPage(franchise: franchise));
      case branchIndicatorsPage:
        final branch = settings.arguments as FranchiseBranch;
        return MaterialPageRoute(builder: (_) => BranchIndicatorsPage(branch: branch));
      case createFranchisePage:
        return MaterialPageRoute(builder: (_) => const CreateFranchisePage());
      case profileSettings:
        return MaterialPageRoute(builder: (_) => EditAccountPage());
      case auth:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case moderationPage:
        //final user = settings.arguments as UserEntity;
        return MaterialPageRoute(builder: (_) => ModerationPage());
      case addBranchPage:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => AddBranchPage(arguments: arguments));
      case chatPage:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => ChatPage(arguments: arguments));
      case editBranchPage:
        final branch = settings.arguments as FranchiseBranch;
        return MaterialPageRoute(builder: (_) => EditBranchPage(branch: branch));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Маршрут ${settings.name} не найден')),
          ),
        );
    }
  }
}