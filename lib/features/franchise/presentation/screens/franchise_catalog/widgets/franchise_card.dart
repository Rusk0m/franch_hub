import 'package:flutter/material.dart';
import 'package:franch_hub/config/theme/theme.dart';

class FranchiseCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double minInvestment;
  final String paybackPeriod;
  final double roi;
  final String description;
  final VoidCallback? onTap;

  FranchiseCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.minInvestment,
    required this.paybackPeriod,
    required this.roi,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 150,
                color: Colors.grey[200],
                child: const Icon(Icons.broken_image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: FlutterTextTheme.titleLarge(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Investment: ${minInvestment.toStringAsFixed(2)} RUB',
                style: FlutterTextTheme.buttonLabel(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Payback: $paybackPeriod',
                style: FlutterTextTheme.buttonLabel(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'ROI: ${roi.toStringAsFixed(1)}%',
                style: FlutterTextTheme.buttonLabel(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: FlutterTextTheme.bodySmall(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}