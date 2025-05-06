import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/features/auth/presentation/bloc/auth_bloc.dart';

class SingInButton extends StatelessWidget {
  const SingInButton({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {
        context.read<AuthBloc>().add(GoogleLoginRequested(context: context));
      },
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(10),
        minimumSize: Size.square(50),
      ),
      child: Icon(
        icon,
        size: 30,
      ),
    );
  }
}