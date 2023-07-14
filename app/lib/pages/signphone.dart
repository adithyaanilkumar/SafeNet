import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suraksha/pages/home.dart';
import 'package:suraksha/pages/moredetails.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;


class SignPhone extends StatefulWidget {
  const SignPhone({ Key? key }) : super(key: key);

  @override
  _SignPhoneState createState() => _SignPhoneState();
}

class _SignPhoneState extends State<SignPhone> {
  String phoneno = '';
  String otp = '';
  var isLoading = false;
  var isResend = false;
  var isRegister = true;
  var isOTPScreen = false;
  var verificationCode = '';
  
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wid =  MediaQuery.of(context).size.height;
    return isOTPScreen?verifyOtp(ht, wid, context):signPhone(ht, wid, context);
  }

  Widget signPhone(double ht, double wid, BuildContext context) {
    return Scaffold(  
    body: Container(
        height: ht,
        width: wid,
        decoration: BoxDecoration(
             gradient: LinearGradient(
               colors: [Color(0XFF2B32B2),Color(0XFF1488CC)]
      ) 
           ),
           child: Column(
             children: [
               SizedBox(height: ht * 0.2,),
               Container(
                 height: ht * 0.8,
                 width: wid,
                 padding: EdgeInsets.fromLTRB(30,40,30,0),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Enter Your \nMobile Number",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500),),
                     SizedBox(height: ht * 0.01,),
                      Text("We will send you confirmation code",style: GoogleFonts.poppins(fontSize: 13,fontWeight: FontWeight.w300,color: Colors.black38),),
                      SizedBox(height: ht * 0.05,),
                      RichText(text: TextSpan(
                        text: "+91   ",
                        style: GoogleFonts.poppins(color: Colors.black38,fontSize: 30,fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: phoneno,
                             style: GoogleFonts.poppins(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w500),
                            
                          )
                        ]
                      )),
                      SizedBox(height: ht * 0.05,),
                      numKeyboard(ht, wid),
                      SizedBox(height: ht * 0.05,),
                      custombutton(context,ht,wid,"Next"),
                    
                   ],
                 ),
               )
             ],
           ),
    ),
  );
  }

    Widget verifyOtp(double ht, double wid, BuildContext context) {
    return Scaffold(
    body: Container(
        height: ht,
        width: wid,
        decoration: BoxDecoration(
             gradient: LinearGradient(
               colors: [Color(0XFF2B32B2),Color(0XFF1488CC)]
      ) 
           ),
           child: Column(
             children: [
               SizedBox(height: ht * 0.2,),
               Container(
                 height: ht * 0.8,
                 width: wid,
                 padding: EdgeInsets.fromLTRB(30,40,30,0),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Enter Code Sent \nTo Your Phone",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500),),
                     SizedBox(height: ht * 0.01,),
                      Text("We have sent it to number +91 ${this.phoneno.substring(0,5)} *****",style: GoogleFonts.poppins(fontSize: 13,fontWeight: FontWeight.w300,color: Colors.black38),),
                      SizedBox(height: ht * 0.05,),
                      Center(
                        child: Text(otp,style: GoogleFonts.poppins(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w500),),
                      ),
                      SizedBox(height: ht * 0.05,),
                      numKeyboard(ht, wid),
                      SizedBox(height: ht * 0.05,),
                      custombutton(context,ht,wid,"Next"),
                    
                   ],
                 ),
               )
             ],
           ),
    ),
  );
  }


 

  Widget numKeyboard(double ht, double wid) {
    return Column(
                        children: [
                          Row(
                            children: [
                              numbutton(ht, wid,"1"),
                              SizedBox(width: 10,),
                              numbutton(ht, wid,"2"),
                              SizedBox(width: 10,),
                              numbutton(ht, wid,"3"),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              numbutton(ht, wid,"4"),
                              SizedBox(width: 10,),
                              numbutton(ht, wid,"5"),
                              SizedBox(width: 10,),
                              numbutton(ht, wid,"6"),
                            ],
                          ),
                          SizedBox(height: 10,),
                        Row(
                            children: [
                              numbutton(ht, wid,"7"),
                              SizedBox(width: 10,),
                              numbutton(ht, wid,"8"),
                              SizedBox(width: 10,),
                              numbutton(ht, wid,"9"),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              numbutton(ht, wid," "),
                              SizedBox(width: 10,),
                              numbutton(ht, wid,"0"),
                              SizedBox(width: 10,),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(                                 
                                 onTap: (){
                                  setState(() {
                                    if(!isOTPScreen){
                                         if(phoneno != ''){
                                           phoneno = phoneno.substring(0,phoneno.length-1);
                                         }           
                                  }                  
                                  else {
                                     if(otp != ''){
                                           otp = otp.substring(0,otp.length-1);
                                         }        
                                  }
                                                                    });
                                },
                                child: Container(
                                  height: ht * 0.07,
                                  width: wid *0.12,
                                  child: Center(
                                    child: Icon(Icons.backspace_outlined,size: 20,color: Colors.black38,)
                                  ),
                                ), 
                                ),
                              )
                            ],
                          ),
                        ],
                        
                        
                      );
  }

  Widget numbutton(double ht, double wid,String num) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      if(!isOTPScreen){
                                         if(phoneno.length < 10){
                                           phoneno += num;
                                         }  
                                    }       
                                    else {
                                      if(otp.length < 8){
                                           otp += num;
                                         }  
                                    }                      
                                                                      });
                                  },
                                  child: Container(
                                    height: ht * 0.07,
                                    width: wid *0.12,
                                    child: Center(
                                      child: Text(num,style: GoogleFonts.poppins(fontSize: 28,fontWeight: FontWeight.w400))
                                    ),
                                  ),
                                ),
    );
  }

 Widget custombutton(BuildContext context,double ht,double wid,String text) {
    return Center(
                        child: Container(
                        height: ht * 0.06,
                        child: Material(
                          color: Colors.transparent,
                          // child: InkWell(
                          //     onTap: isOTPScreen?() async{
                          //        try {
                          //             await _auth
                          //                 .signInWithCredential(
                          //                     PhoneAuthProvider.credential(
                          //                         verificationId:
                          //                             verificationCode,
                          //                         smsCode: otp))
                          //                 .then((user) async => {
                          //                       //sign in was success
                          //                       if (user != null)
                          //                         {
                          //                           //store registration details in firestore database
                          //                           await _firestore
                          //                               .collection('users')
                          //                               .doc(
                          //                                   _auth.currentUser!.uid)
                          //                               .set(
                          //                                   {
                                                          
                          //                                 'phonenumber':phoneno,
                                                              
                          //                               },
                          //                                   SetOptions(
                          //                                       merge:
                          //                                           true)).then(
                          //                                   (value) => {
                          //                                         //then move to authorised area
                          //                                         setState(() {
                          //                                           isLoading =
                          //                                               false;
                          //                                           isResend =
                          //                                               false;
                          //                                         })
                          //                                       }),

                          //                           setState(() {
                          //                             isLoading = false;
                          //                             isResend = false;
                          //                           }),
                          //                           Navigator.pushAndRemoveUntil(
                          //                             context,
                          //                             CupertinoPageRoute(builder: (context)=> MDetails()),
                          //                             (route) => false,
                          //                           )
                          //                         }
                          //                     })
                          //                 // ignore: return_of_invalid_type_from_catch_error
                          //                 .catchError((error) => {
                          //                       setState(() {
                          //                         isLoading = false;
                          //                         isResend = true;
                          //                       }),
                          //                     });
                          //             setState(() {
                          //               isLoading = true;
                          //             });
                          //           } catch (e) {
                          //             setState(() {
                          //               isLoading = false;
                          //             });
                          //           }

                          //     } : (){ 
                          //       setState(() {
                          //           verifySign();
                          //           isRegister = false;
                          //           isOTPScreen =true;
                          //                         });},
                                
                          //     child: Container(
                          //           width: wid*0.2,
                          //           decoration:  BoxDecoration(
                          //             borderRadius: BorderRadius.circular(20),
                          //             color: Colors.indigo[700],
                          //           ),
                          //           child: Row(
                          //               mainAxisAlignment: MainAxisAlignment.center,
                          //               children: <Widget>[
                          //                   Center(
                          //                       child: Text(
                          //                         text,
                          //                           style: GoogleFonts.poppins(
                          //                               color: Colors.white,
                          //                               fontSize: 16,
                          //                               fontWeight: FontWeight.w500,
                          //                           ),
                          //                       ),
                          //                   )
                          //               ],
                          //           ),
                          //     ),
                          // ),
                        ),

                                  ),
           );
  }


  Future verifySign() async {
    setState(() {
      isLoading = true;
    });
    // debugPrint('test 1');
    // var phoneNumber = '+91 ' + phoneno;
    // debugPrint('test 2');
    // var verifyPhoneNumber = _auth.verifyPhoneNumber(
    //   phoneNumber: phoneNumber,
    //   verificationCompleted: (phoneAuthCredential) {
    //     debugPrint('test 3');
    //     //auto code complete (not manually)
    //     _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
    //           if (user != null)
    //             {
    //               //store registration details in firestore database
    //               await _firestore
    //                   .collection('users')
    //                   .doc(_auth.currentUser!.uid)
    //                   .set({
                        
    //                     'phone number': phoneno,
    //                   }, SetOptions(merge: true))
    //                   .then((value) => {
    //                         //then move to authorised area
    //                         setState(() {
    //                           isLoading = false;
    //                           isRegister = false;
    //                           isOTPScreen = false;

    //                           //navigate to is
    //                           Navigator.pushAndRemoveUntil(
    //                             context,
    //                             CupertinoPageRoute(builder: (context)=> Home()),
    //                             (route) => false,
    //                           );
    //                         })
    //                       })
    //                   .catchError((onError) => {
    //                         debugPrint(
    //                             'Error saving user to db.' + onError.toString())
    //                       })
    //             }
    //         });
    //     debugPrint('test 4');
    //   },
    //   verificationFailed: (FirebaseAuthException error) {
    //     debugPrint('Error');
    //     setState(() {
    //       isLoading = false;
    //     });
    //   },
    //   codeSent: (verificationId, [forceResendingToken]) {
    //     debugPrint('test 6');
    //     setState(() {
    //       isLoading = false;
    //       verificationCode = verificationId;
    //     });
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {
    //     debugPrint('test 7');
    //     setState(() {
    //       isLoading = false;
    //       verificationCode = verificationId;
    //     });
    //   },
    //   timeout: Duration(seconds: 60),
    // );
    // debugPrint('test 7');
    // await verifyPhoneNumber;
    // debugPrint('test 8');
  }


}

