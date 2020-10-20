import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
