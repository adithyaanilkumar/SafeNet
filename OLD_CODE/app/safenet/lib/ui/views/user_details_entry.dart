import 'package:flutter/material.dart';
import 'package:safenet/core/services/routes.dart';
import 'package:safenet/ui/constants.dart';
import 'package:safenet/ui/customWidgets/bloodGroupDropDown.dart';
import 'package:safenet/ui/customWidgets/customSignInButton.dart';
import 'package:safenet/ui/customWidgets/mainTitle.dart';

class UserDetailsEntry extends StatelessWidget {
  /// Page where the user enters all the requires details for registering in the app.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Center(
                  child: MainTitle(
                mainTitle: 'Personal Details',
                fontSize: 40.0,
              )),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'First Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Last Name',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              BloodGroupDropDown(),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Address Line 1'),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Address Line 2'),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'City',
                        prefixIcon: Icon(Icons.location_city),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Landmark',
                      ),
                    ),
                  ),
                ],
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
                onPressed: () {
                  Navigator.pushNamed(context, Routes.bottomNavBar);
                },
                buttonColor: Color(0xff51adcf),
                buttonText: "Submit",
              )
            ],
          ),
        ),
      ),
    );
  }
}
