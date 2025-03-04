import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:franch_hub/app/theme/theme.dart';

class FranchiseCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double minInvestment;
  final String paybackPeriod;
  final double roi;
  final String description;

  const FranchiseCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.minInvestment,
    required this.paybackPeriod,
    required this.roi,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Обработка нажатия на карточку
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Блок с изображением
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.network(
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
            ),

            // Контент
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Заголовок
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  // Показатели
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildMetric(
                        icon: Icons.attach_money,
                        value: '${minInvestment.toStringAsFixed(0)}\$',
                        label: 'Инвестиции',
                      ),
                      _buildMetric(
                        icon: Icons.calendar_today,
                        value: paybackPeriod,
                        label: 'Окупаемость',
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /*// Описание
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),*/
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.onPrimary)),
                          child: Text('More Details',style: FlutterTextTheme.bodyLarge(context),)),
                      Expanded(child: IconButton(onPressed: () {}, icon: Icon(Icons.add)))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Вспомогательный метод для создания элементов с метриками
  Widget _buildMetric({
    required IconData icon,
    required String value,
    required String? label,
  }) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.blue),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label!,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
