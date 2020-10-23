import 'package:flutter/material.dart';
import 'package:safenet/ui/views/login_view.dart';
import 'package:safenet/ui/views/otp_entry.dart';
import 'package:safenet/ui/views/register_view.dart';
import 'package:safenet/ui/views/user_details_entry.dart';
import 'package:safenet/ui/views/welcome_view.dart';

///The Routes class is used to manage routes by declaring all the routes as static onstanst strings.
class Routes {
  static const String welcome = 'welcome';
  static const String register = 'registerView';
  static const String login = 'loginView';
  static const String userDetailsEntry = 'userDetailsEntry';
  static const String otpEntry = 'otpEntry';

  ///Each route is mapped to its respective view here.
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.welcome: (context) => WelcomeView(),
      Routes.register: (context) => RegisterView(),
      Routes.login: (context) => LoginView(),
      Routes.userDetailsEntry: (context) => UserDetailsEntry(),
      Routes.otpEntry: (context) => OTPEntry(),
    };
  }
}
