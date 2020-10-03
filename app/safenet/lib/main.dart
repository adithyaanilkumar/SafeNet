import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenet/core/viewmodals/login_model.dart';
import 'package:safenet/ui/views/login_view.dart';

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
        theme: ThemeData(
          fontFamily: 'Montserrat-Regular',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginView(),
      ),
    );
  }
}
