
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';

import 'home.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailInputController;
  late TextEditingController pwdInputController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  String? emailValidator(String? value) {
   String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$' ;
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Email format is invalid';
    } else {
      return "";
    }
  }

  String? pwdValidator(String? value) {
    if (value!.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Form(
              key: _loginFormKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email*', hintText: "john.doe@gmail.com"),
                    controller: emailInputController,
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password*', hintText: "********"),
                    controller: pwdInputController,
                    obscureText: true,
                    validator: pwdValidator,
                  ),
                 TextButton(
                    child: Text("Login"),
                  
                    onPressed: () {
                      // if (_loginFormKey.currentState!.validate()) {
                      //   FirebaseAuth.instance
                      //       .signInWithEmailAndPassword(
                      //           email: emailInputController.text,
                      //           password: pwdInputController.text)
                      //       .then((currentUser) => FirebaseFirestore.instance
                      //           .collection("users")
                      //           .doc(FirebaseAuth.instance.currentUser!.uid)
                      //           .get()
                      //           .then((DocumentSnapshot result) =>
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home(
                                                
                                                  //userData: result.data(),
                                                  userData: {},
                                                )));
                    //                             )
                    //             .catchError((err) => print(err)))
                    //         .catchError((err) => print(err));
                    //   }
                     },
                  ),
                  Text("Don't have an account yet?"),
                  TextButton(
                    child: Text("Register here!"),
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                  )
                ],
              ),
            ))));
  }
}