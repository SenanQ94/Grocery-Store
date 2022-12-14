import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Center(
          child: SwitchListTile(
        title: const Text('Theme'),
        secondary: Icon(themeState.darkTheme
            ? Icons.dark_mode_outlined
            : Icons.light_mode_outlined),
        onChanged: (bool value) {
          themeState.toggleTheme(value);
        },
        value: themeState.darkTheme,
      )),
    );
  }
}
