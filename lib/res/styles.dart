import 'package:flutter/material.dart';

class Styles {
  static final buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.blueAccent.shade700,
    foregroundColor: Colors.white,
  );

  static const headline1 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );

  static const headline2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );

  static final textfieldStyle = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
