import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class FacebookSignInButton extends StatelessWidget {
  final String text;

  FacebookSignInButton({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 50.0,
      child: SignInButton(Buttons.Facebook, text: text, onPressed: () {
        print("Clicked facebook");
      }),
    );
  }
}
