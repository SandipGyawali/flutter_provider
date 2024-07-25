import 'package:flutter/material.dart';
import 'package:flutter_provider/mvvm/utils/routes/routes_name.dart';
import 'package:flutter_provider/mvvm/view/home_screen.dart';
import 'package:flutter_provider/mvvm/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );

      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const Scaffold(
            body: Center(
              child: Text("No route defined", style: TextStyle(fontSize: 28)),
            ),
          );
        });
    }
  }
}
