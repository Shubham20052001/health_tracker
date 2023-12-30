import 'package:flutter/material.dart';
import 'package:health_tracker/res/components/buttons.dart';
import 'package:health_tracker/res/components/components.dart';
import 'package:health_tracker/utils/routes/routes_name.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Components.myTextfield(
              controller: emailcontroller,
              hintText: 'Enter your email',
              labelText: 'Email',
            ),
          ),
          Components.sBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Components.myTextfield(
              controller: passwordcontroller,
              hintText: 'Enter your password',
              labelText: 'Password',
            ),
          ),
          Components.sBox(height: 10),
          Buttons.introButton(title: "Login", onPress: () {}),
          Components.sBox(height: 5),
          Buttons.introTextButton(
            title: "Create a new account?SignUp",
            onPress: () {
              Navigator.pushReplacementNamed(context, RouteNames.signup);
            },
          ),
        ],
      ),
    );
  }
}
