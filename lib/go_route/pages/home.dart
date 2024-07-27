import 'package:flutter/material.dart';
import 'package:flutter_provider/go_route/routes/route_consts.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context)
                  .pushReplacementNamed(MyAppRouteConstants.aboutRoute);
            },
            child: const Text("About Page"),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context)
                  .pushReplacement(MyAppRouteConstants.homeRoute);
            },
            child: const Text("Home Page"),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context)
                  .pushReplacementNamed(MyAppRouteConstants.contactUsRoute);
            },
            child: const Text("Contact-Us Page"),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).pushReplacementNamed(
                MyAppRouteConstants.profileRoute,
                pathParameters: {"username": "Sandip Gyawali", "userId": "2"},
              );
            },
            child: const Text("Profile Page"),
          )
        ],
      ),
    );
  }
}
