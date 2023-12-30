import 'package:flutter/material.dart';
import 'package:health_tracker/utils/routes/routes_name.dart';
import 'package:health_tracker/view/decider_view.dart';
import 'package:health_tracker/view/home_screen_view.dart';
import 'package:health_tracker/view/login_view.dart';
import 'package:health_tracker/view/sign-in_view.dart';

class Routes {
  static MaterialPageRoute<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.decider:
        return MaterialPageRoute(builder: (_) => const DeciderView());
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text("No Route defined"),
              ),
            );
          },
        );
    }
  }
}
