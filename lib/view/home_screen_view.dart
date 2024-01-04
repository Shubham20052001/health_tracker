import 'package:flutter/material.dart';
import 'package:health_tracker/repository/auth_services.dart';
import 'package:health_tracker/repository/firestore_services.dart';
import 'package:health_tracker/res/components/buttons.dart';
import 'package:health_tracker/res/components/components.dart';
import 'package:health_tracker/res/styles.dart';
import 'package:health_tracker/utils/bmi_calculator.dart';
import 'package:health_tracker/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController footController = TextEditingController();
    TextEditingController inchesController = TextEditingController();
    TextEditingController weightController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    final mq = MediaQuery.of(context).size;
    final authPro = Provider.of<AuthService>(context);
    final firestorePro = Provider.of<FirestoreService>(context);
    final bmiPro = Provider.of<BMICalculator>(context);

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 10),
            child: FutureBuilder(
              future: firestorePro.getUserInfo(
                fieldName: "username",
                uid: authPro.curUser!.uid,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Hi! ${snapshot.data}",
                    style: Styles.headline1,
                  );
                } else {
                  return const Text(
                    "Hi!",
                    style: Styles.headline1,
                  );
                }
              },
            ),
          ),
          Components.sBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Calculate your BMI",
              style: Styles.headline2,
            ),
          ),
          Components.sBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text("Enter your height"),
          ),
          Components.sBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Foot: "),
              SizedBox(
                width: mq.width * 0.25,
                child: TextField(
                  controller: footController,
                  keyboardType: TextInputType.number,
                  decoration: Styles.textfieldStyle.copyWith(hintText: "ft"),
                ),
              ),
              const Text("Inches: "),
              SizedBox(
                width: mq.width * 0.25,
                child: TextField(
                  controller: inchesController,
                  keyboardType: TextInputType.number,
                  decoration:
                      Styles.textfieldStyle.copyWith(hintText: "inches"),
                ),
              ),
            ],
          ),
          Components.sBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Enter your weight"),
                    Components.sBox(height: 10),
                    SizedBox(
                      width: mq.width * 0.45,
                      child: TextField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        decoration:
                            Styles.textfieldStyle.copyWith(hintText: "Kg(s)"),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Enter your age"),
                    Components.sBox(height: 10),
                    SizedBox(
                      width: mq.width * 0.45,
                      child: TextField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration:
                            Styles.textfieldStyle.copyWith(hintText: "age"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Components.sBox(height: 20),
          Center(
            child: Buttons.introButton(
              title: "Submit & Calculate BMI",
              onPress: () {
                double heightInFoot = double.parse(footController.text);
                double heightInInches = double.parse(inchesController.text);
                var bmi = BMICalculator.calculateBMI(
                  height: ((12 * heightInFoot) + heightInInches),
                  weightInKg: double.parse(weightController.text),
                );
                bmiPro.setBMI(bmi);
              },
              style: Styles.buttonStyle,
            ),
          ),
          Consumer<BMICalculator>(
            builder: (context, value, child) {
              return Text(
                "Your BMI: ${value.bmi}",
                style: Styles.headline1,
              );
            },
          ),
        ],
      ),
    );
  }
}
