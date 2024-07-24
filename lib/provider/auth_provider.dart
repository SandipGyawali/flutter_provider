import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool val) {
    _loading = val;
    notifyListeners(); //notify the provider that the state has been updated.
  }

  void login(String email, String password) async {
    try {
      Response response =
          await post(Uri.parse("https://reqres.in/api/login"), body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        print("Successful ${response.body}");
      } else {
        print("Unsuccessful ${response.body}");
      }
    } catch (err) {
      print(err.toString());
    }
  }
}
