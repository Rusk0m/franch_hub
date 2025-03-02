import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({super.key, required this.label, required this.prefixIcon, required this.isPassword, this.suffixIcon, required this.controller});

  final String label;
  final IconData prefixIcon;
  final bool isPassword;
  final suffixIcon;
  final controller;



  @override
  Widget build(BuildContext context) {
    bool hidePassword = isPassword;
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        labelText: label,
        suffixIcon: Icon(suffixIcon),
        prefixIcon: Icon(prefixIcon),
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      ),
      controller: controller,
      obscureText: hidePassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    );
  }
}
