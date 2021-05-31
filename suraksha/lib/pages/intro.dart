import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suraksha/pages/home.dart';
import 'package:suraksha/pages/login.dart';
import 'package:suraksha/pages/signup.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
          colors: [Color(0XFF2B32B2),Color(0XFF1488CC)]
        ) ,
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
           //     color: Colors.white,
                height: ht * 0.65 ,
                width: wid * 0.75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                Container(
             // color: Colors.black,
               margin: EdgeInsets.only(left:20,top:20),               
                child:
                   Text.rich(
            TextSpan(
              text: 'Welcome ',
              style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
              children: <InlineSpan>[
                TextSpan(
                  text: 'To ',
                  style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400),
                ),
                TextSpan(
                  text: '\nSafeNet',
                  style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.tealAccent[700]),
                )
              ]
            )
          ),
                  
                
              
            ),
            SizedBox(height: 20,),
            Image.asset("assets/comm.png"),
            SizedBox(height: 5,),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Join The Community, To Make The World,\na Safe Place",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w300),)),
            ),
            SizedBox(height: 20,),
             Center(
               child: Container(
      height: 40.0,
      child: InkWell(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context)=> Login()));
          },
          child: Container(
                width: 200,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.tealAccent[400],
                    width: 2,
                  )
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Center(
                            child: Text(
                               "Login",
                                style: TextStyle(
                                    color: Colors.tealAccent[400],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                ),
                            ),
                        )
                    ],
                ),
          ),
      ),

                 ),
             ),
             SizedBox(height: 10,), 
             Center(
               child: Container(
      height: 40.0,
      child: InkWell(
          onTap: () {
            Navigator.push(
    context, CupertinoPageRoute(builder: (context) => SignUp()));
          },
          child: Container(
                width: 200,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.tealAccent[400]
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Center(
                            child: Text(
                               "Sign up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                ),
                            ),
                        )
                    ],
                ),
          ),
      ),

                 ),
             ),
                ],),
              ),
            )
          ],
        ),
      ),
    );
  }
}