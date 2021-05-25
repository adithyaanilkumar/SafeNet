import 'package:flutter/material.dart';
import 'package:suraksha/navig.dart';
import 'package:suraksha/pages/profile.dart';
import 'pages/home.dart';
var routes = <String, WidgetBuilder>{
   "/home": (BuildContext context) => Home(),
   "/profile":(BuildContext context) => ProfilePage(),
};

void main() => runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, ),
    debugShowCheckedModeBanner: false,
    home: Navig(),
    routes: routes));

