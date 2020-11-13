import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenet/core/viewmodals/home_model.dart';
import 'package:safenet/core/viewmodals/login_model.dart';
import 'package:safenet/core/viewmodals/register_model.dart';
import 'package:safenet/core/viewmodals/welcome_model.dart';

class Providers {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<WelcomeModel>(create: (context) => WelcomeModel()),
    ChangeNotifierProvider<LoginModel>(create: (context) => LoginModel()),
    ChangeNotifierProvider<RegisterModel>(create: (context) => RegisterModel()),
    ChangeNotifierProvider<HomeViewModel>(create: (context) => HomeViewModel())
  ];
}
