import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/config/routes/app_routes.dart';
import 'package:franch_hub/config/theme/theme.dart';
import 'package:franch_hub/di/service_locator.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';
import 'package:franch_hub/features/franchise/presentation/blocs/franchise_bloc/franchise_bloc.dart';
import 'package:franch_hub/features/franchise/presentation/screens/franchise_catalog/widgets/category_carousel.dart';
import 'package:franch_hub/features/franchise/presentation/screens/franchise_catalog/widgets/franchise_card.dart';
import 'package:franch_hub/generated/l10n.dart';

class FranchiseCatalogPage extends StatelessWidget {
  const FranchiseCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context)!;
    return BlocProvider(
      create: (_) => sl<FranchiseBloc>()..add(LoadAllFranchises()),
      child: BlocBuilder<FranchiseBloc, FranchiseState>(
        builder: (context, state) {
          return ListView(
            children: [
              Center(
                child: Text(
                  l10n.franchHubTitle,
                  style: FlutterTextTheme.headlineMedium(context),
                ),
              ),
              const SizedBox(height: 20),
              SearchBar(
                leading: const Icon(Icons.search),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 15),
                ),
                hintText: l10n.searchHint,
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Stack(
                  children: [
                    Image.network(
                      'https://imgs.search.brave.com/3HiHUNx5IdAHvGMgsSf5y5ti1ukAbCuvBJdLO2az3CI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMudmVjdGVlenku/Y29tL3ZpdGUvYXNz/ZXRzL3Bob3RvLUM4/cTBLUUhHLndlYnA',
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        height: 250,
                        color: Colors.grey[200],
                        child: const Icon(Icons.broken_image),
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.3),
                      width: double.infinity,
                      height: 250,
                    ),
                    Positioned(
                      left: 20,
                      bottom: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.findPerfectFranchise,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            l10n.exploreOpportunities,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                l10n.exploreFranchiseTitle,
                style: FlutterTextTheme.titleLarge(context),
              ),
              const SizedBox(height: 20),
              CategoryCarousel(),
              const SizedBox(height: 20),
              if (state is FranchiseLoading)
                const Center(child: CircularProgressIndicator())
              else if (state is FranchiseLoaded)
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 355,
                  ),
                  itemCount: state.franchises.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final franchise = state.franchises[index];
                    return FranchiseCard(
                      title: franchise.name,
                      imageUrl:
                      'https://imgs.search.brave.com/3HiHUNx5IdAHvGMgsSf5y5ti1ukAbCuvBJdLO2az3CI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMudmVjdGVlenku/Y29tL3ZpdGUvYXNz/ZXRzL3Bob3RvLUM4/cTBLUUhHLndlYnA',
                      minInvestment: franchise.startupCost,
                      paybackPeriod: '12-18 мес',
                      roi: 25,
                      description: franchise.description,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRouter.franchiseDetailPage,
                          arguments: franchise,
                        );
                      },
                    );
                  },
                )
              else if (state is MyFranchisesError)
                  Center(child: Text(l10n.errorMessage(state.message)))
                else
                  Center(child: Text(l10n.noFranchisesAvailable)),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}