import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/_theme.dart';
import 'package:flutter_provider/provider/counter_provider.dart';
import 'package:flutter_provider/provider/example_one_provider.dart';
import 'package:flutter_provider/provider/favorite_provider.dart';
import 'package:flutter_provider/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DarkTheme(),
      themeMode: themeProvider.getThemeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
      ),
    );
  }
}
