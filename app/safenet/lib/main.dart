import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenet/core/viewmodals/login_model.dart';
import 'package:safenet/ui/views/login_view.dart';
import 'package:safenet/ui/views/register_view.dart';
import 'package:safenet/ui/views/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (context) => LoginModel(),
      child: MaterialApp(
        initialRoute: 'welcome',
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          RegisterView.id: (context) => RegisterView(),
          LoginView.id: (context) => LoginView(),
        },
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
