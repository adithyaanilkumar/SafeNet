import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenet/core/routes.dart';
import 'package:safenet/core/viewmodals/home_model.dart';
import 'package:safenet/core/viewmodals/login_model.dart';
import 'package:safenet/core/viewmodals/register_model.dart';
import 'package:safenet/core/viewmodals/welcome_model.dart';
import 'package:safenet/ui/customWidgets/bottomAppBar.dart';
import 'package:safenet/ui/views/home_view.dart';
import 'package:safenet/ui/views/welcome_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WelcomeModel>(
            create: (context) => WelcomeModel()),
        ChangeNotifierProvider<LoginModel>(create: (context) => LoginModel()),
        ChangeNotifierProvider<RegisterModel>(
            create: (context) => RegisterModel()),
        ChangeNotifierProvider<HomeViewModel>(
            create: (context) => HomeViewModel())
      ],
      child: MaterialApp(
        routes: Routes.getRoutes(),
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: WelcomeView(),
      ),
    );
  }
}
