import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenet/core/viewmodals/login_model.dart';

class MainTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        Provider.of<LoginModel>(context).title,
        style: TextStyle(
          fontFamily: 'MontserratExtraBold',
          fontWeight: FontWeight.bold,
          fontSize: 60.0,
        ),
      ),
    );
  }
}
