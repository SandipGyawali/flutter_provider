import 'package:flutter/material.dart';
import 'package:flutter_provider/go_route/routes/route_consts.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error Page"),
        backgroundColor: Colors.red,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).pushReplacementNamed(
              MyAppRouteConstants.homeRoute,
            );
          },
          child: const Text("Home Page"),
        ),
      ),
    );
  }
}
