import 'package:flutter/material.dart';

class RegisterModel extends ChangeNotifier {
  static String title = "Register";

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
}
