import 'package:flutter/material.dart';

class TitleIcon extends StatelessWidget {
  const TitleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.amber[300]!, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.amber[300]!.withOpacity(0.4),
              blurRadius: 45,
              spreadRadius: 35,
            ),
          ]),
      child: Icon(
        Icons.paste,
        color: Colors.amber[400],
        size: 100,
      ),
    );
  }
}