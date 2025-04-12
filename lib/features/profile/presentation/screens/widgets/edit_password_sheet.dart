import 'package:flutter/material.dart';
import 'package:franch_hub/config/theme/theme.dart';
import 'package:franch_hub/core/global_widgets/global_widgets.dart';

class EditPasswordSheet extends StatelessWidget {
  const EditPasswordSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 350),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text('Change Password',
              style: Theme.of(context).textTheme.titleLarge),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            label: 'New Password',
            isPassword: true,
            controller: null,
            prefixIcon: Icons.lock,
            suffixIcon: Icons.remove_red_eye,
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            label: 'Confirm Password',
            isPassword: false,
            controller: null,
            prefixIcon: Icons.lock,
            suffixIcon: Icons.remove_red_eye,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size(double.infinity,50))
              ),
              onPressed: () {},
              child: Text(
                'Save',
                style: FlutterTextTheme.titleLarge(context),
              ))
        ],
      ),
    );
  }
}
