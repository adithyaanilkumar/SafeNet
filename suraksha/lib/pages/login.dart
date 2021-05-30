import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

//import 'package:flutter_signin_button/flutter_signin_button.dart';

//const riveFile = 'assets/rive/shooting-stars.riv';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidden = true;
 // Artboard _artboard;
  @override
      void initState() {
    //_loadRiveFile();
    super.initState();
  }

  // void _loadRiveFile() async {
  //   final bytes = await rootBundle.load(riveFile);
  //   RiveFile rFile = RiveFile.import(bytes);

  //   setState(() => _artboard = rFile.mainArtboard
  //     ..addController(

  //         SimpleAnimation('Animation 1'),
  //     ));
  // }

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
              height: 350.h,
              // decoration: new BoxDecoration(
              //   color: Colors.red,
              //   borderRadius: BorderRadius.vertical(
              //       bottom: Radius.elliptical(
              //           500.0,100.0)),
              // ),
              child: Container(color: Colors.black,),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.h),
                height: MediaQuery.of(context).size.height*.6,
                width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.h),
                    Text("Sign-in",style: GoogleFonts.firaSans(color: Colors.indigoAccent[700],fontSize: 45.sp,decoration: TextDecoration.none,fontWeight: FontWeight.w500)),
                    SizedBox(height: 60.h,),
                    Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        hintText: "Enter Email Id",
                        prefixIcon: Icon(Icons.mail_outline_rounded,color: Colors.indigoAccent[700],),
                        border: InputBorder.none,
                         ),
                    ),
                  ),
                   
                    SizedBox(height: 20.h,),
                    Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    child: TextField(
                      obscureText: _isHidden,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        hintText: "Enter Password",
                        prefixIcon: Icon(Icons.lock,color: Colors.indigoAccent[700],),
                        suffixIcon: InkWell(
                          onTap: _toggleView,
                          child: Icon(Icons.visibility,color: Colors.indigoAccent[700],)),
                        border: InputBorder.none,
                         ),
                    ),
                  ),
                    
                    SizedBox(height: 30.h,),
                    _custombutton("Login",Color(0XFF304FFE) , Color(0XFFFFFFFF)),
                    SizedBox(height: 20.h,),
                    // Text("Or",style: GoogleFonts.firaSans(color: Colors.grey.withOpacity(0.4),fontSize: 15.sp,decoration: TextDecoration.none),),
                    // SizedBox(height: 20.h,),
                    // Container(
                    //   padding: EdgeInsets.only(left: 40.w,right: 40.w),
                    //   child: Row(
                      
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     _customIconbutton(Buttons.LinkedIn),
                    //     _customIconbutton(Buttons.Facebook),
                    //     _customIconbutton(Buttons.Twitter),
                    //     _customIconbutton(Buttons.GitHub),
          

                    //   ],
                    // ),
                    // )
                  ],
                ),
              ),
            )

            
        ],
      ),
    );
  }
  void _toggleView(){
    setState(() {
          _isHidden=!_isHidden;
        });
  }

//   Widget _customIconbutton(Buttons b){
//     return SignInButton(
//   b,
//   mini: true,
//   onPressed: () {},
// );

//   }
  Widget _custombutton(String text,Color color1,Color color2) {
    return Container(
                 height: 50.h,
               child: GestureDetector(
              onTap: () {
             //    Navigator.push(context, MaterialPageRoute(builder: (context) => Navig()));
              },
                 child: Container(
            width: 130.w,
            decoration: BoxDecoration(
             // color:Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color: Color(0XFF304FFE),
                    offset: Offset(1.0,2.0),
                    blurRadius: 4.0,
                    spreadRadius: 2.0
                  )],
                color: color1,
                borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Center(
                        child: Text(
                           text,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                                color: color2,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                            ),
                        ),
                    )
                ],
            ),
        ),
    ),
);
  }
}