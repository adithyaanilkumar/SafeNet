import 'package:flutter/material.dart';

class RegisterModel extends ChangeNotifier {
  static String title = "Register";

  String _dropdownValue = 'A+';

  String get dropdownValue => _dropdownValue;

  ///List of all the bloodgroups for bloodgroup dropdown list
  static List<String> dropDownItems = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];

  updateDropDownValue(String newValue) {
    _dropdownValue = newValue;
    notifyListeners();
  }
}
