import 'package:flutter/material.dart';

class CustomSignInButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomSignInButton({@required this.text, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: onPressed,
        child: Text(text),
        color: Color(0xff0278ae),
      ),
    );
  }
}
