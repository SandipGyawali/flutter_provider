import 'package:flutter/material.dart';
import 'package:flutter_provider/mvvm/utils/routes/routes.dart';
import 'package:flutter_provider/mvvm/utils/routes/routes_name.dart';
import 'package:flutter_provider/mvvm/view_model/auth_view_model.dart';
import 'package:flutter_provider/mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App MVVM",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
