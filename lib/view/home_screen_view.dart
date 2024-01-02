import 'package:flutter/material.dart';
import 'package:health_tracker/repository/auth_services.dart';
import 'package:health_tracker/res/components/buttons.dart';
import 'package:health_tracker/res/components/components.dart';
import 'package:health_tracker/res/styles.dart';
import 'package:health_tracker/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController heightController = TextEditingController();
    TextEditingController weightController = TextEditingController();
    final authPro = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              authPro.signOut().whenComplete(() {
                Navigator.pushReplacementNamed(context, RouteNames.login);
              });
            },
            tooltip: "Logout",
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            "Hello!! ${authPro.curUser.uid}",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Components.sBox(height: 20),
          const Text(
            "Calculate your BMI",
          ),
          Components.sBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Components.myTextfield(
              controller: heightController,
              hideText: false,
              hintText: "Enter your height in inches",
              labelText: "Height",
            ),
          ),
          Components.sBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Components.myTextfield(
              controller: weightController,
              hideText: false,
              hintText: "Enter your weight in  Kg",
              labelText: "Weight",
            ),
          ),
          Components.sBox(height: 20),
          Buttons.introButton(
            title: "Calculate BMI",
            onPress: () {},
            style: Styles.buttonStyle,
          ),
        ],
      ),
    );
  }
}
