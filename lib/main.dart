import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_tracker/repository/auth_services.dart';
import 'package:health_tracker/repository/firestore_services.dart';
import 'package:health_tracker/utils/routes/routes.dart';
import 'package:health_tracker/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        Provider<FirestoreService>(create: (_) => FirestoreService()),
      ],
      child: const MaterialApp(
        title: 'Health Tracker App',
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.decider,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
