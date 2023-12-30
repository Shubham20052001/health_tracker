// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class Buttons {
  static introButton({
    required String title,
    required Function() onPress,
  }) {
    return ElevatedButton(
      child: Text(title),
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.blueAccent)),
      onPressed: onPress,
    );
  }

  static introTextButton({
    required String title,
    required Function() onPress,
  }) {
    return TextButton(
      child: Text(title),
      style: const ButtonStyle(
          // backgroundColor: MaterialStatePropertyAll(Colors.yellow),
          ),
      onPressed: onPress,
    );
  }
}
