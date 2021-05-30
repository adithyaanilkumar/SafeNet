import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:suraksha/pages/profile.dart';
import 'pages/home.dart';
var routes = <String, WidgetBuilder>{
   "/home": (BuildContext context) => Home(),
   "/profile":(BuildContext context) => ProfilePage(),
};

bool isDark = false;

void main() => runApp(new MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 // bool _isDark = true;
  ThemeData _light = ThemeData.light().copyWith(
    primaryColor: Color(0XFFEFF3F6),
  );
  ThemeData _dark = ThemeData.dark().copyWith(
    primaryColor: Color(0xFF292D32),
  );
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safenet',
      darkTheme: ThemeData.dark(),
      theme: _light,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: Home(),
    );
  }
}
