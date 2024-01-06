import 'package:flutter/material.dart';
import 'package:health_tracker/repository/auth_services.dart';
import 'package:health_tracker/res/components/buttons.dart';
import 'package:health_tracker/res/components/components.dart';
import 'package:health_tracker/utils/routes/routes_name.dart';
import 'package:health_tracker/utils/utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    final authPro = Provider.of<AuthService>(context);
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
              hideText: false,
              hintText: 'Enter your email',
              labelText: 'Email',
            ),
          ),
          Components.sBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Components.myTextfield(
              controller: passwordcontroller,
              hideText: true,
              hintText: 'Enter your password',
              labelText: 'Password',
            ),
          ),
          Components.sBox(height: 10),
          Buttons.introButton(
            title: "Login",
            onPress: () {
              authPro
                  .signInWithEmailAndPassword(
                email: emailcontroller.text,
                password: passwordcontroller.text,
                context: context,
              )
                  .whenComplete(() {
                Utils.showMessage("Logged-in Successfully", context);
                Navigator.pushReplacementNamed(context, RouteNames.bottomNav);
              });
            },
          ),
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
