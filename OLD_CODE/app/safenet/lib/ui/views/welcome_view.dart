import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenet/core/services/routes.dart';
import 'package:safenet/core/viewmodals/welcome_model.dart';
import 'package:safenet/ui/customWidgets/customSignInButton.dart';

class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  /// Welcome View of the app where the user will be prompted to signIn or Register
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: TypewriterAnimatedTextKit(
                    speed: Duration(milliseconds: 100),
                    text: [Provider.of<WelcomeModel>(context).title],
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 60.0,
                        fontFamily: 'MontserratExtraBold'),
                    textAlign: TextAlign.start,
                    alignment:
                        AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
              ),
              SizedBox(
                height: 180.0,
              ),
              CustomSignInButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.login);
                },
                buttonText: "Sign In",
                buttonColor: Color(0xff51adcf),
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomSignInButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.register);
                },
                buttonText: "Sign up",
                buttonColor: Color(0xff51adcf),
              )
            ],
          ),
        ),
      ),
    );
  }
}
