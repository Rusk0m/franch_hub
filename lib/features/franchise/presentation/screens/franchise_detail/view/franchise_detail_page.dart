import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/config/theme/theme.dart';
import 'package:franch_hub/core/entities/user.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/auth/domain/repository/authentication_repository.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/generated/l10n.dart';

class FranchiseDetailPage extends StatefulWidget {
  final Franchise? franchise;

  const FranchiseDetailPage({super.key, this.franchise});

  @override
  _FranchiseDetailPageState createState() => _FranchiseDetailPageState();
}

class _FranchiseDetailPageState extends State<FranchiseDetailPage> {
  bool _isLoading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context)!;
    final franchise = widget.franchise ??
        Franchise(
          id: '',
          ownerId: '',
          name: 'Unknown',
          description: 'No description',
          industry: 'Unknown',
          city: 'Unknown',
          startupCost: 0,
          royaltyPercent: 0,
          createdAt: DateTime.now(),
        );

    final authRepository = sl<AuthenticationRepository>();

    void _navigateToChat() async {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      try {
        final currentUser = authRepository.currentUser;
        if (currentUser == null || currentUser == UserEntity.empty) {
          throw Exception(l10n.currentUserNotFoundError);
        }

        final otherUser = await authRepository.getUser(franchise.ownerId);
        if (otherUser == UserEntity.empty) {
          throw Exception(l10n.franchiseOwnerNotFoundError);
        }
        if (otherUser == currentUser) {
          throw Exception(l10n.youAreFranchiseOwnerError);
        }
        Navigator.pushNamed(
          context,
          AppRouter.chatPage,
          arguments: {
            'currentUser': currentUser,
            'otherUser': otherUser,
          },
        );
      } catch (e) {
        setState(() {
          _errorMessage = l10n.chatFailedError(e.toString());
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMessage!)),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const CircleAvatar(
                            minRadius: 20,
                            maxRadius: 25,
                            child: Icon(Icons.arrow_back, size: 40),
                          ),
                        ),
                        Text(
                          franchise.name,
                          style: FlutterTextTheme.headlineMedium(context),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const CircleAvatar(
                            minRadius: 20,
                            maxRadius: 25,
                            child: Icon(Icons.more_horiz, size: 40),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width - 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://imgs.search.brave.com/3HiHUNx5IdAHvGMgsSf5y5ti1ukAbCuvBJdLO2az3CI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMudmVjdGVlenku/Y29tL3ZpdGUvYXNz/ZXRzL3Bob3RvLUM4/cTBLUUhHLndlYnA',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(child: Icon(Icons.business)),
                            const SizedBox(width: 5),
                            Text(
                              franchise.name,
                              style: FlutterTextTheme.titleLarge(context),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(width: 2),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.star),
                              Text('4.9'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.franchiseOverviewTitle,
                            style: FlutterTextTheme.headlineMedium(context),
                          ),
                          Text(
                            '${l10n.industryLabel}: ${franchise.industry}\n'
                                '${l10n.cityLabel}: ${franchise.city}\n'
                                '${l10n.startupCostLabel}: ${franchise.startupCost.toStringAsFixed(2)} RUB\n'
                                '${l10n.royaltyPercentLabelFranchise}: ${franchise.royaltyPercent.toStringAsFixed(1)}%\n\n'
                                '${franchise.description}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _isLoading ? null : _navigateToChat,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.message, size: 40),
                          ),
                          if (_isLoading)
                            const CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(double.infinity, 60),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRouter.addBranchPage,
                            arguments: {
                              'isFranchisee': true,
                              'franchise': franchise,
                            },
                          );
                        },
                        child: Text(
                          l10n.respondNowButton,
                          style: FlutterTextTheme.titleLarge(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}