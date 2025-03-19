import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:franch_hub/app/global_widgets/global_widgets.dart';
import 'package:franch_hub/app/theme/theme.dart';
import 'package:franch_hub/app/theme/theme_cubit.dart';

class GeneralSettings extends StatelessWidget {
  const GeneralSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationButton(
      icon: Icons.settings,
      title: 'General Settings',
      bottomSheetContent: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return Container(
            constraints: BoxConstraints(maxHeight: 350),
            // Ваш кастомный контент
            //height: MediaQuery.sizeOf(context).height * 0.5,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text('General Settings',
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Text('Dark Theme:'),
                  trailing: Switch(
                    value: themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      final theme =
                      value ? ThemeMode.dark : ThemeMode.light;
                      context.read<ThemeCubit>().setTheme(theme);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(
                            Size(double.infinity, 50)),
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.onPrimary)),
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style: FlutterTextTheme.titleLarge(context),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
