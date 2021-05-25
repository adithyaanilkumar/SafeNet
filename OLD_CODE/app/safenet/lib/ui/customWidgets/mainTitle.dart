import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  final String mainTitle;
  final double fontSize;
  MainTitle({@required this.mainTitle, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        mainTitle,
        style: TextStyle(
          fontFamily: 'MontserratExtraBold',
          fontWeight: FontWeight.bold,
          fontSize: fontSize ?? 60.0,
        ),
      ),
    );
  }
}
