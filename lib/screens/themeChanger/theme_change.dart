import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt/provider/theme_change_provider.dart';
import 'package:provider/provider.dart';

/// We wrapped magterial app with builder because the provider needs a context one step below the normal con texrt of the app
///
class ThemeChange extends StatelessWidget {
  const ThemeChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChanger =
        Provider.of<ThemeChangeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
      ),
      body: Consumer<ThemeChangeProvider>(builder: (context, value, child) {
        return Column(
          children: [
            RadioListTile<ThemeMode>(
              title: const Text("Light Theme"),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: (value) {
                themeChanger.setTheme(value!);
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text("Dark Theme"),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: (value) {
                themeChanger.setTheme(value!);
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text("System Theme"),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: (value) {
                themeChanger.setTheme(value!);
              },
            ),
          ],
        );
      }),
    );
  }
}
