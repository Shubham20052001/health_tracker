import 'package:flutter/material.dart';
import 'package:health_tracker/view/exercises_view.dart';
import 'package:health_tracker/view/home_screen_view.dart';
import 'package:health_tracker/view/user_profile_view.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  var _selectedIndex = 1;
  final items = [
    const UserProfileScreen(),
    const HomeScreen(),
    const ExercisesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_rounded),
            label: "Exercise",
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
