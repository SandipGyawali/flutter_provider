import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class DarkTheme extends StatefulWidget {
  const DarkTheme({Key? key}) : super(key: key);

  @override
  State<DarkTheme> createState() => _DarkTheme();
}

class _DarkTheme extends State<DarkTheme> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AppBar",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text("Light Mode"),
            value: ThemeMode.light,
            groupValue: themeProvider.getThemeMode,
            onChanged: (value) {
              print(value);
              themeProvider
                  .setThemeMode(value!); // Call setThemeMode with the new value
            },
          ),
          RadioListTile<ThemeMode>(
            title: const Text("Dark Mode"),
            value: ThemeMode.dark,
            groupValue: themeProvider.getThemeMode,
            onChanged: (value) {
              print(value);
              themeProvider
                  .setThemeMode(value!); // Call setThemeMode with the new value
            },
          ),
          RadioListTile<ThemeMode>(
            title: const Text("System Mode"),
            value: ThemeMode.system,
            groupValue: themeProvider.getThemeMode,
            onChanged: (value) {
              print(value);
              themeProvider
                  .setThemeMode(value!); // Call setThemeMode with the new value
            },
          ),
        ],
      ),
    );
  }
}
