import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenet/core/routes.dart';
import 'package:safenet/core/viewmodals/login_model.dart';
import 'package:safenet/ui/views/welcome_view.dart';

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
