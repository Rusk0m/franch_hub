import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/app/blocs/authentication/auth_bloc.dart';

class SingInButton extends StatelessWidget {
  const SingInButton({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<AuthBloc>().add(GoogleLoginRequested());
        },
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(), // Круглая форма
          padding: EdgeInsets.all(10), // Отступы внутри кнопки
          minimumSize: Size.square(50), // Минимальный размер (60x60)
        ),
        child: Icon(
          icon,
          size: 30,
        ));
  }
}
