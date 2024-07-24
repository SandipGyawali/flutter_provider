import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  //email and password controller.
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _toggle = true;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter email",
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.white38, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.white60, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              controller: passwordController,
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: _toggle,
              decoration: InputDecoration(
                suffix: InkWell(
                  onTap: () {
                    setState(() {
                      _toggle = !_toggle;
                    });
                  },
                  child: Icon(
                    _toggle ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white60,
                  ),
                ),
                hintText: "Enter Password",
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.white38, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.white60, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              autofillHints: const [AutofillHints.email],
              controller: emailController,
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  print("Email and passwrod field cannot be empty");
                } else {
                  authProvider.login(
                    emailController.text,
                    passwordController.text,
                  );
                  print("Wow");
                }
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text("Login"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
