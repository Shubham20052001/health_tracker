// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class Components {
  static TextField myTextfield({
    required TextEditingController controller,
    required String hintText,
    required String labelText,
    required bool hideText,
  }) {
    return TextField(
      controller: controller,
      obscureText: hideText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }

  static sBox({double? height}) {
    return SizedBox(
      height: height,
    );
  }
}
