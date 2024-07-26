import 'package:flutter/material.dart';
import 'package:flutter_provider/mvvm/model/user_model.dart';
import 'package:flutter_provider/mvvm/repository/auth_repository.dart';
import 'package:flutter_provider/mvvm/utils/routes/routes_name.dart';
import 'package:flutter_provider/mvvm/utils/routes/utils.dart';
import 'package:flutter_provider/mvvm/view_model/user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  final UserViewModel userViewModel = UserViewModel();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    // eve.holt@reqres.in
    // cityslicka
    print("Login api hit");
    _myRepo.loginApi(data).then((value) {
      UserModel user = UserModel.fromJson(value);
      userViewModel.saveUser(user);
      Navigator.pushNamed(context, RoutesName.home);
      Utils.flushBarErrorMessage("Login Successfuly", context);
    }).onError((err, stackTrace) {
      print(err);
      Utils.flushBarErrorMessage(err.toString(), context);
    });
  }
}
