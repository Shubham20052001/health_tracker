import 'package:flutter/material.dart';

class BMICalculator extends ChangeNotifier {
  double _bmi = 0;
  double get bmi => _bmi;

  setBMI(double bmi) {
    _bmi = bmi;
    notifyListeners();
  }

  static double calculateBMI({
    required double height,
    required double weightInKg,
  }) {
    double weightInLbs = weightInKg * 2.204;
    double bmi = 703 * (weightInLbs / (height * height));
    return bmi;
  }
}
