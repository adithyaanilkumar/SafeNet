import 'package:flutter/material.dart';
import 'package:safenet/core/services/routes.dart';
import 'package:safenet/ui/constants.dart';
import 'package:safenet/ui/customWidgets/customSignInButton.dart';
import 'package:safenet/ui/customWidgets/mainTitle.dart';

class OTPEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 120.0),
              Center(
                  child: MainTitle(
                mainTitle: 'Enter your OTP',
                fontSize: 40.0,
              )),
              SizedBox(
                height: 80.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: TextField(
                  maxLength: 6,
                  style: TextStyle(fontSize: 30.0),
                  obscureText: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  onChanged: null,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'OTP',
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: CustomSignInButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.userDetailsEntry);
                  },
                  buttonText: "Submit",
                  buttonColor: Color(0xff51adcf),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
