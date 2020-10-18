import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<BottomNavigationBarItem> bottomNavBarIcons = [
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
    ),
    // BottomNavigationBarItem(icon: Icon(Icons.)),
  ];
}
