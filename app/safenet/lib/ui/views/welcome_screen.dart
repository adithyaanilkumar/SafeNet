import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:safenet/ui/customWidgets/customSignInButton.dart';
import 'package:safenet/ui/views/login_view.dart';
import 'package:safenet/ui/views/register_view.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
                    text: ["Safenet"],
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
                  Navigator.pushNamed(context, LoginView.id);
                },
                buttonText: "Sign In",
                buttonColor: Color(0xff51adcf),
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomSignInButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegisterView.id);
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
