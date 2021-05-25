import 'package:flutter/material.dart';

class CustomSignInButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;
  final Color buttonColor;

  CustomSignInButton(
      {this.buttonColor, this.buttonText, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 400.0,
          height: 42.0,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
// Color(0xff0278ae)
