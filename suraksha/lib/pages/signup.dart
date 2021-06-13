import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  late TextEditingController emailInputController;
 // TextEditingController pwdInputController;
  //TextEditingController confirmPwdInputController;

  @override
  initState() {

    emailInputController = new TextEditingController();
  //  pwdInputController = new TextEditingController();
  //  confirmPwdInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return "";
    }
  }

  String phoneValidator(String value) {
    if (value != '' ||value.length != 10) {
      return 'Enter Valid phone number';
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wid =  MediaQuery.of(context).size.height;
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Register"),
        // ),
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
              // child: SingleChildScrollView(
              //   child: Container(),
              //     child: Form(
              //   key: _registerFormKey,
              //   child: Column(
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
              //             labelText: 'Password*', hintText: "********"),
              //       //  controller: pwdInputController,
              //         obscureText: true,
              //        // validator: pwdValidator,
              //       ),
              //       TextFormField(
              //         decoration: InputDecoration(
              //             labelText: 'Confirm Password*', hintText: "********"),
              //         controller: confirmPwdInputController,
              //         obscureText: true,
              //         validator: pwdValidator,
              //       ),
              //       TextButton(
              //         child: Text("Register"),
              //         // color: Theme.of(context).primaryColor,
              //         // textColor: Colors.white,
              //         onPressed: () {
              //           if (_registerFormKey.currentState.validate()) {
              //             if (pwdInputController.text ==
              //                 confirmPwdInputController.text) {
              //               FirebaseAuth.instance
              //                   .createUserWithEmailAndPassword(
              //                       email: emailInputController.text,
              //                       password: pwdInputController.text)
              //                   .then((currentUser) => FirebaseFirestore.instance
              //                       .collection("users")
              //                       .doc(FirebaseAuth.instance.currentUser.uid)
              //                       .set({
              //                         "uid": FirebaseAuth.instance.currentUser.uid,
              //                         "password":pwdInputController.text,
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
              //                             pwdInputController.clear(),
              //                             confirmPwdInputController.clear()
              //                           })
              //                       .catchError((err) => print(err)))
              //                   .catchError((err) => print(err));
              //             } else {
              //               showDialog(
              //                   context: context,
              //                   builder: (BuildContext context) {
              //                     return AlertDialog(
              //                       title: Text("Error"),
              //                       content: Text("The passwords do not match"),
              //                       actions: <Widget>[
              //                         TextButton(
              //                           child: Text("Close"),
              //                           onPressed: () {
              //                             Navigator.of(context).pop();
              //                           },
              //                         )
              //                       ],
              //                     );
              //                   });
              //             }
              //           }
              //         },
              //       ),
              //       Text("Already have an account?"),
              //       TextButton(
              //         child: Text("Login here!"),
              //         onPressed: () {
              //           Navigator.pop(context);
              //         },
              //       )
              //     ],
              //   ),
              // )
           //   )
              ),
        ));
  }
}