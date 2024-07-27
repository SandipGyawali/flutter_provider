import 'package:flutter/material.dart';
import 'package:flutter_provider/mvvm/resources/components/round_button.dart';
import 'package:flutter_provider/mvvm/utils/routes/utils.dart';
import 'package:flutter_provider/mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _email =
      TextEditingController(text: "eve.holt@reqres.in");
  final TextEditingController _password =
      TextEditingController(text: "cityslicka");

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height * 1;
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Screen"),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Enter email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: const Icon(Icons.mail_outlined),
                iconColor: Colors.white60,
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (context, _, child) {
                return TextFormField(
                  obscureText: _obsecurePassword.value,
                  controller: _password,
                  obscuringCharacter: "*",
                  focusNode: passwordFocusNode,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.lock_outline),
                    iconColor: Colors.white60,
                    suffixIcon: InkWell(
                      onTap: () {
                        _obsecurePassword.value = !_obsecurePassword.value;
                      },
                      child: Icon(
                        _obsecurePassword.value == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: _height * .1),
            RoundButton(
              title: "Login",
              onPress: () {
                // Utils.toastMessage();
                if (_email.text.isEmpty || _password.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                    "input credentials invalid or empty",
                    context,
                  );
                } else {
                  Map data = {
                    "email": _email.text.toString(),
                    "password": _password.text.toString()
                  };

                  authViewModel.loginApi(data, context);
                  // Navigator.pushReplacementNamed(context, RoutesName.home);
                }
                // Utils.snackBar("No Internet Connection", context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
