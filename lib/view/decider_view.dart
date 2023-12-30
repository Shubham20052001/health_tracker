import 'package:flutter/material.dart';
import 'package:health_tracker/model/user_model.dart';
import 'package:health_tracker/repository/auth_services.dart';
import 'package:health_tracker/view/home_screen_view.dart';
import 'package:health_tracker/view/login_view.dart';
import 'package:provider/provider.dart';

class DeciderView extends StatelessWidget {
  const DeciderView({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder(
      stream: authService.userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final UserModel? userModel = snapshot.data;
          return userModel == null ? const LoginScreen() : const HomeScreen();
        } else {
          return const Scaffold(
            body: Center(
              // TODO: Implement connetion error response using images, texts etc.
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
