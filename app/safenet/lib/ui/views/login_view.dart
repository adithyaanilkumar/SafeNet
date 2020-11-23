import 'package:flutter/material.dart';
import 'package:safenet/core/services/routes.dart';
import 'package:safenet/core/viewmodals/login_model.dart';
import 'package:safenet/ui/constants.dart';
import 'package:safenet/ui/customWidgets/customSignInButton.dart';
import 'package:safenet/ui/customWidgets/mainTitle.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginView extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  /// LoginView of the app where the user registers themselves by providing the necessary.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120.0),
              Center(
                  child: MainTitle(
                mainTitle: LoginModel.title,
              )),
              SizedBox(
                height: 80.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email address',
                    prefixIcon: Icon(Icons.email)),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Password',
                    prefixIcon: Icon(Icons.lock_outline)),
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomSignInButton(
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, Routes.bottomNavBar);
                    }
                  } catch (e) {}

                  // Navigator.pushNamed(context, Routes.bottomNavBar);
                },
                buttonColor: Color(0xff51adcf),
                buttonText: "Sign In",
              ),
              SizedBox(
                height: 8.0,
              ),
              FlatButton(onPressed: null, child: Text("Forgot Password?")),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.register);
                    },
                    padding: EdgeInsets.only(left: 0.0),
                    child: Text(
                      "Create one",
                      style: TextStyle(color: Color(0xff51adcf)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
