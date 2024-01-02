// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:health_tracker/repository/auth_services.dart';
import 'package:health_tracker/repository/firestore_services.dart';
import 'package:health_tracker/res/components/buttons.dart';
import 'package:health_tracker/res/components/components.dart';
import 'package:health_tracker/utils/routes/routes_name.dart';
import 'package:health_tracker/utils/utils.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController namecontroller = TextEditingController();
    final authPro = Provider.of<AuthService>(context);
    final firestorePro = Provider.of<FirestoreService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Components.myTextfield(
              controller: namecontroller,
              hideText: false,
              hintText: 'Enter your name',
              labelText: 'Username',
            ),
          ),
          Components.sBox(height: 15),
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
              title: "Sign-Up",
              onPress: () async {
                final userModel = await authPro.createUserWithEmailAndPassword(
                  email: emailcontroller.text,
                  password: passwordcontroller.text,
                  username: namecontroller.text,
                  context: context,
                );

                firestorePro
                    .addUser(
                  username: namecontroller.text,
                  email: emailcontroller.text,
                  uid: userModel!.uid,
                )
                    .whenComplete(() {
                  Utils.showMessage("Registered Sucessfully", context);
                  Navigator.pushReplacementNamed(context, RouteNames.home);
                });
              }),
          Components.sBox(height: 5),
          Buttons.introTextButton(
            title: "Already have an account?login",
            onPress: () {
              Navigator.pushReplacementNamed(context, RouteNames.login);
            },
          ),
        ],
      ),
    );
  }
}
