import 'package:flutter/material.dart';
import 'package:franch_hub/app/theme/theme.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.icon,
    required this.title,
    this.routeName,
    this.bottomSheetContent, // Новый параметр для контента BottomSheet
  });

  final IconData? icon;
  final String title;
  final String? routeName;
  final Widget? bottomSheetContent; // Контент для BottomSheet

  void _handlePress(BuildContext context) {
    if (bottomSheetContent != null) {
      // Открываем BottomSheet если передан контент
      showModalBottomSheet(
        context: context,
        builder: (context) => bottomSheetContent!,
        isScrollControlled: true, // Для сложного контента
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      );
    } else if (routeName != null) {
      // Стандартная навигация
      Navigator.pushNamed(context, routeName!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _handlePress(context),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(child: Icon(icon, size: 30)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(title, style: FlutterTextTheme.titleLarge(context)),
          ),
          const Icon(Icons.arrow_forward_ios_outlined, size: 30),
        ],
      ),
    );
  }
}