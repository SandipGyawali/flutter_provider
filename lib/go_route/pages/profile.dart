import 'package:flutter/material.dart';
import 'package:flutter_provider/go_route/routes/route_consts.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatelessWidget {
  final String username;
  final String userId;
  const Profile({
    super.key,
    required this.userId,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
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
          const SizedBox(height: 20),
          const Text("Url Parameter Passed Data"),
          Center(child: Text("userId: $userId, username: $username"))
        ],
      ),
    );
  }
}
