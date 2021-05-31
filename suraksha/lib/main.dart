import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:suraksha/pages/login.dart';
import 'package:suraksha/pages/profile.dart';
import 'package:suraksha/pages/signup.dart';
import 'package:suraksha/pages/splash.dart';
import 'pages/home.dart';
import 'pages/intro.dart';
//import 'package:firebase_core/firebase_core.dart';
var routes = <String, WidgetBuilder>{
   "/home": (BuildContext context) => Home(),
   "/profile":(BuildContext context) => ProfilePage(),
   "/intro": (BuildContext context) => Intro(),
   "/login": (BuildContext context) => Login(),
   "/signin": (BuildContext context) => SignUp(),
};





void main(){
  WidgetsFlutterBinding.ensureInitialized();
 Firebase.initializeApp();
 // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MyApp());
  }
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 // bool _isDark = true;
  ThemeData _light = ThemeData.light().copyWith(
    primaryColor: Color(0XFFEFF3F6),
  );
 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safenet',
      darkTheme: ThemeData.dark(),
      theme: _light,
      themeMode: ThemeMode.light,
      home: SplashPage(),
    );
  }
}
