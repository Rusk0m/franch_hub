import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:franch_hub/app/theme/theme.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Franch Hub'),
      ),*/
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 75,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.amber[300]!, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amber[300]!.withOpacity(0.4),
                          blurRadius: 55,
                          spreadRadius: 35,
                        ),
                      ]),
                  child: Icon(
                    Icons.paste,
                    color: Colors.amber[400],
                    size: 100,
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
                Text(
                  'Welcome Back!',
                  style: FlutterTextTheme.custom(context:context,fontSize: 40,fontWeight: FontWeight.w400,color: Colors.amber),
                ),
                Text(
                  'Sing in your account',
                  style: FlutterTextTheme.titleLarge(context),
                ),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.security),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Forgot password? ',
                    style: TextStyle(
                        fontSize: 16, decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Theme.of(context).colorScheme.primary)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'LOGIN',
                        style: FlutterTextTheme.custom(
                            color: Theme.of(context).colorScheme.surface,
                            fontWeight: FontWeight.w200,
                            fontSize: 26,
                            context: context),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.amber,
                            Colors.transparent
                          ],
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
                          style:FlutterTextTheme.bodyLarge(context),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), // Круглая форма
                        padding: EdgeInsets.all(10), // Отступы внутри кнопки
                        minimumSize:
                            Size.square(50), // Минимальный размер (60x60)
                      ),
                      child: Icon(
                        FontAwesomeIcons.google,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), // Круглая форма
                        padding: EdgeInsets.all(10), // Отступы внутри кнопки
                        minimumSize:
                            Size.square(50), // Минимальный размер (60x60)
                      ),
                      child: Icon(
                        FontAwesomeIcons.apple,
                        size: 30,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
