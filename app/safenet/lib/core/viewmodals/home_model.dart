import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  String cityName;

  updateCity(String city) {
    cityName = city;
    notifyListeners();
  }
}
