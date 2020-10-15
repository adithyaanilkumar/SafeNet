import 'package:flutter/material.dart';
import 'package:safenet/ui/constants.dart';
import 'package:safenet/ui/customWidgets/bloodGroupDropDown.dart';
import 'package:safenet/ui/customWidgets/mainTitle.dart';

class UserDetailsEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              TextField(
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'First Name', prefixIcon: Icon(Icons.person)),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Last Name', prefixIcon: Icon(Icons.person)),
              ),
              SizedBox(
                height: 15.0,
              ),
              BloodGroupDropDown(),
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
            ],
          ),
        ),
      ),
    );
  }
}
