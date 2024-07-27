import 'package:flutter/material.dart';
import 'package:flutter_provider/mvvm/utils/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices {
  // Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString("token");

    if (token == null || token == "") {
      Navigator.pushReplacementNamed(context, RoutesName.login);
    } else {
      print("Home route considtion matched");
      Navigator.pushReplacementNamed(context, RoutesName.home);
    }
  }
}
