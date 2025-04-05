import 'package:flutter/material.dart';
import 'package:franch_hub/config/theme/theme.dart';
import 'package:franch_hub/core/global_widgets/global_widgets.dart';

class EditAccountPage extends StatelessWidget {
  const EditAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_outlined)),
                Text(
                  'User Profile',
                  style: FlutterTextTheme.titleLarge(context),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              minRadius: 60,
              maxRadius: 65,
              child: Icon(
                Icons.person,
                size: 110,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: 'First Name',
              isPassword: false,
              controller: null,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: 'Last Name',
              isPassword: false,
              controller: null,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: 'Email',
              isPassword: false,
              controller: null,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: 'Mobile',
              isPassword: false,
              controller: null,
            ),
            SizedBox(
              height: 20,
            ),
            NavigationButton(
              title: 'Change Password',
              icon: Icons.lock_outline,
              bottomSheetContent: Container(
                constraints: BoxConstraints(maxHeight: 350),
                // Ваш кастомный контент
                //height: MediaQuery.sizeOf(context).height * 0.5,
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
              ),
            ),
            SizedBox(height: 20),
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
      )),
    );
  }
}
