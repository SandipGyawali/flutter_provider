import 'package:flutter/material.dart';
import 'package:flutter_provider/go_route/routes/route_config.dart';
import "package:flutter_dotenv/flutter_dotenv.dart";
import 'package:go_router/go_router.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GoRouter _router = MyAppRouter().router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp.router(
        routerConfig: _router,
        title: "FLutter App",
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
