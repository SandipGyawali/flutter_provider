import 'package:flutter/material.dart';
import 'package:flutter_provider/go_route/routes/route_consts.dart';
import 'package:go_router/go_router.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context)
                  .pushReplacementNamed(MyAppRouteConstants.homeRoute);
            },
            child: const Text("Home Page"),
          ),
        ],
      ),
    );
  }
}
