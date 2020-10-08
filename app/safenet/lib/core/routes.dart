import 'package:flutter/material.dart';
import 'package:safenet/ui/views/login_view.dart';
import 'package:safenet/ui/views/register_view.dart';
import 'package:safenet/ui/views/welcome_view.dart';

class Routes {
  static const String welcome = 'welcome';
  static const String register = 'registerView';
  static const String login = 'loginView';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.welcome: (context) => WelcomeView(),
      Routes.register: (context) => RegisterView(),
      Routes.login: (context) => LoginView(),
    };
  }
}
