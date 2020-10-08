import 'package:flutter/material.dart';
import 'package:safenet/ui/constants.dart';
import 'package:safenet/ui/customWidgets/customSignInButton.dart';
import 'package:safenet/ui/customWidgets/facebookSignInButton.dart';
import 'package:safenet/ui/customWidgets/googleSignInButton.dart';
import 'package:safenet/ui/customWidgets/mainTitle.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120.0),
              Center(child: MainTitle()),
              SizedBox(
                height: 80.0,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                onChanged: null,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Phone Number',
                    prefixIcon: Icon(Icons.person)),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                obscureText: true,
                onChanged: null,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Create a Password',
                    prefixIcon: Icon(Icons.lock_outline)),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                obscureText: true,
                onChanged: null,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Confirm your Password',
                    prefixIcon: Icon(Icons.lock_outline)),
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomSignInButton(
                onPressed: null,
                buttonColor: Color(0xff51adcf),
                buttonText: "Sign Up",
              ),
              SizedBox(
                height: 8.0,
              ),
              GoogleSignInButton(
                text: "Sign up with google",
              ),
              SizedBox(
                height: 15.0,
              ),
              FacebookSignInButton(
                text: "Sign up with Facebook",
              ),
              SizedBox(
                height: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
