import 'package:flutter/material.dart';
import 'package:flutter_provider/mvvm/utils/routes/routes_name.dart';
import 'package:flutter_provider/mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);

    method() async {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      final String? token = sp.getString("token");

      print("token $token");
    }

    method();

    return PopScope(
      onPopInvoked: (didPop) => false,
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          backgroundColor: Colors.amber,
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
              onTap: () {
                userPreference.removeUser().then((value) {
                  Navigator.pushReplacementNamed(context, RoutesName.login);
                });
              },
              child: const Center(
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}
