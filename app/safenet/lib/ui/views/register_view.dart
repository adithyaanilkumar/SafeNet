import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenet/core/viewmodals/register_model.dart';
import 'package:safenet/ui/constants.dart';
import 'package:safenet/ui/customWidgets/customSignInButton.dart';
import 'package:safenet/ui/customWidgets/mainTitle.dart';

class RegisterView extends StatelessWidget {
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
                mainTitle: Provider.of<RegisterModel>(context).title,
              )),
              SizedBox(
                height: 150.0,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                onChanged: null,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Phone Number',
                    prefixIcon: Icon(Icons.person)),
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomSignInButton(
                onPressed: null,
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
