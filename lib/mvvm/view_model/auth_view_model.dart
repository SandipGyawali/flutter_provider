import 'package:flutter/material.dart';
import 'package:flutter_provider/mvvm/repository/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo.loginApi(data).then((value) {
      print(value.toString());
    }).onError((err, stackTrace) {
      print(err.toString());
    });
  }
}
