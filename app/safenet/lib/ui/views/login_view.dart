import 'package:flutter/material.dart';
import 'package:safenet/ui/constants.dart';
import 'package:safenet/ui/custom%20widgets/customSignInButton.dart';
import 'package:safenet/ui/custom%20widgets/mainTitle.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 160.0),
              Center(child: MainTitle()),
              SizedBox(
                height: 120.0,
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
                    hintText: 'Enter your Password',
                    prefixIcon: Icon(Icons.lock_outline)),
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomSignInButton(text: "Sign In", onPressed: null),
            ],
          ),
        ),
      ),
    );
  }
}
