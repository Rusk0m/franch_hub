import 'package:flutter/material.dart';
import 'package:franch_hub/app/theme/theme.dart';


class TextDivider extends StatelessWidget {
  const TextDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.amber, Colors.transparent],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
        ),
        Center(
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'Or Continue With',
              style: FlutterTextTheme.bodyLarge(context),
            ),
          ),
        ),
      ],
    );
  }
}