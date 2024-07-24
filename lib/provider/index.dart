import "package:flutter_provider/provider/auth_provider.dart";
import "package:flutter_provider/provider/counter_provider.dart";
import "package:flutter_provider/provider/example_one_provider.dart";
import "package:flutter_provider/provider/favorite_provider.dart";
import "package:flutter_provider/provider/theme_provider.dart";
import "package:provider/provider.dart";

class Providers {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<ExampleOneProvider>(
        create: (_) => ExampleOneProvider()),
    ChangeNotifierProvider<CounterProvider>(create: (_) => CounterProvider()),
    ChangeNotifierProvider<FavoriteProvider>(create: (_) => FavoriteProvider()),
    ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
    ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider())
  ];
}
