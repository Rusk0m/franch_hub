import 'package:flutter/material.dart';
import 'package:franch_hub/config/theme/theme.dart';
import 'package:franch_hub/features/franchise/domain/entities/franchise.dart';

class FranchiseDetailPage extends StatelessWidget {
  final Franchise? franchise;

  const FranchiseDetailPage({super.key, this.franchise});

  @override
  Widget build(BuildContext context) {
    final franchise = this.franchise ??
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
                              Text('4.9'), // Можно добавить rating в модель
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
                            'Franchise Overview',
                            style: FlutterTextTheme.headlineMedium(context),
                          ),
                          Text(
                            'Industry: ${franchise.industry}\n'
                                'City: ${franchise.city}\n'
                                'Startup Cost: ${franchise.startupCost.toStringAsFixed(2)} RUB\n'
                                'Royalty: ${franchise.royaltyPercent.toStringAsFixed(1)}%\n\n'
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
                    const CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.message, size: 40),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(double.infinity, 60),
                        ),
                        onPressed: () {
                          // Переход в чат
                        },
                        child: Text(
                          'Respond Now',
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