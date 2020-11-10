import 'package:flutter/material.dart';
import 'package:safenet/core/routes.dart';
import 'package:safenet/core/viewmodals/register_model.dart';
import 'package:safenet/ui/constants.dart';
import 'package:safenet/ui/customWidgets/customSignInButton.dart';
import 'package:safenet/ui/customWidgets/mainTitle.dart';

class RegisterView extends StatelessWidget {
  /// RegisterView of the app where the user registers themselves by providing the necessary.
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
                mainTitle: RegisterModel.title,
              )),
              SizedBox(
                height: 150.0,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                onChanged: null,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Phone Number',
                    prefixIcon: Icon(Icons.phone)),
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomSignInButton(
                onPressed: () => Navigator.pushNamed(context, Routes.otpEntry),
                buttonColor: Color(0xff51adcf),
                buttonText: "Generate OTP",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
