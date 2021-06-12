import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

class MDetails extends StatefulWidget {
  MDetails({Key key}) : super(key: key);

  @override
  _MDetailsState createState() => _MDetailsState();
}

class _MDetailsState extends State<MDetails> {
  String _chosenValue;
  bool _isHidden = true;
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  TextEditingController emailInputController;
  TextEditingController userInputController;
  //TextEditingController confirmPwdInputController;

  @override
  initState() {

    emailInputController = new TextEditingController();
    userInputController = new TextEditingController();
  //  confirmPwdInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String userValidator(String value) {
    if (value.length == 0) {
      return 'Enter Username';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wid =  MediaQuery.of(context).size.height;
    return Scaffold(
        
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: ht,
            width: wid,
             // padding: const EdgeInsets.all(20.0),
             decoration: BoxDecoration(
               gradient: LinearGradient(
                 colors: [Color(0XFF2B32B2),Color(0XFF1488CC)]
        ) 
             ),
              child: SingleChildScrollView(
                //child: Container(),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 120, 15, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: ht * 0.6,
                    width: wid * 0.5,
                child: Form(
                key: _registerFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: ht * 0.01),
                    Text("Setting Up Your \nProfile",style: GoogleFonts.roboto(color: Colors.indigoAccent[700],fontSize: 25,decoration: TextDecoration.none,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                    SizedBox(height:  ht * 0.06,),
                     Container(
                      width: wid * 0.35,
                      child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      child: TextFormField(
                      //  obscureText: _isHidden,
                        
                         controller: userInputController,
                         validator: userValidator,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                          hintText: "Create Username",
                          prefixIcon: Icon(Icons.person_rounded,color: Colors.indigoAccent[700],),
                         
                      ),
                  ),
                    ),
                     ),

                    SizedBox(height: ht * 0.03,),

                    Material(

                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      width: wid * 0.35,
                      child: TextFormField(
                         controller: emailInputController,
                         keyboardType: TextInputType.emailAddress,
                         validator: emailValidator,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                          hintText: "Enter Email Id",
                          prefixIcon: Icon(Icons.mail_outline_rounded,color: Colors.indigoAccent[700],),
                          border: InputBorder.none,
                           ),
                      ),
                    ),
                  ),
                   
                    
                   
                    SizedBox(height: ht * 0.03,),

                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 20,right: 10),
                        width: wid * 0.35,
                       child: DropdownButtonHideUnderline(
                         child: DropdownButton<String>(
                                      isExpanded: true,
                                      focusColor:Colors.white,
                                      value: _chosenValue,
                                      //elevation: 5,
                                      style: TextStyle(color: Colors.white,),
                                      iconEnabledColor:Colors.black,
                                      items: <String>[
                                        'Male',
                                        'Female',
                                        'Other',
                                        'Id Rather Not Say',
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,style:TextStyle(color:Colors.indigoAccent[700],),
                                        ));
                                      }).toList(),
                                      hint:Text(
                                        "Please choose a langauage",
                                        style: TextStyle(
                                            color: Colors.indigoAccent[700],
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      onChanged: (String value) {
                                        setState(() {
                                          _chosenValue = value;
                                        });
                                      },
),
                       ),
                      ),
                    ),

                    SizedBox(height: ht * 0.05),
                    custombutton(context,ht,wid),
                    
                  ],
                ),
                // child: Column(
                //     children: <Widget>[
                      
                    
                //       TextFormField(
                //         decoration: InputDecoration(
                //             labelText: 'Email*', hintText: "john.doe@gmail.com"),
                //         controller: emailInputController,
                //         keyboardType: TextInputType.emailAddress,
                //         validator: emailValidator,
                //       ),
                //       TextFormField(
                //         decoration: InputDecoration(
                //             labelText: 'Username', hintText: ""),
                //       //  controller: pwdInputController,
                //         obscureText: true,
                //         validator: userValidator,
                //        // validator: pwdValidator,
                //       ),
                //       // TextFormField(
                //       //   decoration: InputDecoration(
                //       //       labelText: 'Confirm Password*', hintText: "********"),
                //       //   controller: confirmPwdInputController,
                //       //   obscureText: true,
                //       //   validator: pwdValidator,
                //       // ),
                //       TextButton(
                //         child: Text("Register"),
                //         // color: Theme.of(context).primaryColor,
                //         // textColor: Colors.white,
                //         onPressed: () {
                //           if (_registerFormKey.currentState.validate()) {
                            
                //                   FirebaseFirestore.instance.collection("users")
                //                           .doc(FirebaseAuth.instance.currentUser.uid)
                //                           .set({
                //                         "uid": FirebaseAuth.instance.currentUser.uid,
                //                         "username":userInputController.text,
                //                         "email": emailInputController.text,
                //                       })
                //                       .then((result) => {
                //                             Navigator.pushAndRemoveUntil(
                //                                 context,
                //                                 CupertinoPageRoute(
                //                                     builder: (context) => Home(
                                                          
                //                                           userData: FirebaseAuth.instance.currentUser,
                //                                         )),
                //                                 (_) => false),
                                            
                //                             emailInputController.clear(),
                //                             userInputController.clear(),
                //                             //confirmPwdInputController.clear()
                //                           })
                //                       .catchError((err) => print(err));
                                  

                             
                             
              
              ),
                  )
              )
              ),
        ));
  }

Widget custombutton(BuildContext context,double ht,double wid) {
    return Center(
                        child: Container(
                        height: ht * 0.06,
                        child: InkWell(
                            onTap: (){
                              if (_registerFormKey.currentState.validate()) {
                            
                                  FirebaseFirestore.instance.collection("users")
                                          .doc(FirebaseAuth.instance.currentUser.uid)
                                          .set({
                                        "uid": FirebaseAuth.instance.currentUser.uid,
                                        "username":userInputController.text,
                                        "email": emailInputController.text,
                                        "gender":_chosenValue,
                                      })
                                      .then((result) => {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) => Home(
                                                          
                                                          userData: FirebaseAuth.instance.currentUser,
                                                        )),
                                                (_) => false),
                                            
                                            emailInputController.clear(),
                                            userInputController.clear(),
                                            //confirmPwdInputController.clear()
                                          })
                                      .catchError((err) => print(err));
                            }
                            },
                              
                            child: Container(
                                  width: wid*0.2,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.indigoAccent[700],
                                  ),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                          Center(
                                              child: Text(
                                                "Join Now",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                  ),
                                              ),
                                          )
                                      ],
                                  ),
                            ),
                        ),

                                  ),
           );
  }

  void _toggleView(){
    setState(() {
          _isHidden=!_isHidden;
        });
  }
}
