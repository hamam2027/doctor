import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screens/homscreen.dart';
import '../../view/screens/profilescreen.dart';
import '../../view/screens/settingsscreen.dart';

class HomePageController extends GetxController {
  int currentIndex = 0;

  List<String> titles = [
    'Home',
    'Profile',
    'Settings',
  ];
  List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.person_2_outlined,
      ),
      label: 'Profile',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    update();
  }
}
