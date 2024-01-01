import 'package:flutter/material.dart';
import 'package:health_tracker/repository/auth_services.dart';
import 'package:health_tracker/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Text("Hello!! ${authPro.curUser.username}"),
      ),
    );
  }
}
