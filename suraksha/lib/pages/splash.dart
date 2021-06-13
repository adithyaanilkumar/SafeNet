import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';
import 'intro.dart';
import 'login.dart';
// import 'package:suraksha/main.dart';

class SplashPage extends StatefulWidget {
  final refreshCache;
  SplashPage({Key? key,this.refreshCache}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Future initialisefb;

  initialiseFirebase() async {
    try{
    await  Firebase.initializeApp();
 //   await FirebaseAuth.instance.currentUser;
    if (widget.refreshCache != null && widget.refreshCache == true) {
        await FirebaseFirestore.instance.terminate();
        await FirebaseFirestore.instance.clearPersistence();
      }
     User? user = FirebaseAuth.instance
            .currentUser;
            
              if(user == null){
                Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => Intro()));
              } 
              else{
            
                    DocumentSnapshot result =  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(FirebaseAuth.instance.currentUser!.uid)
                                      .get();
                    if(result.exists){
                      return result.data();
                    }
                    else
                      return null;
                    }
    }
    catch(err){
      print(err);
    }

}
  @override
  initState() {
    
    initialisefb = initialiseFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: FutureBuilder(
         future: initialisefb,
         // ignore: missing_return
         builder: (context,snapshot){
           if(snapshot.hasData){
             if(FirebaseAuth.instance.currentUser == null )
                  {
                    return Login();
                    }
              
                else if(snapshot.data != null){
                  return Home(userData: snapshot.data); 
                }  
                else {
                  return Intro();
                }  
           }       
           else{
             return Container(
               color: Colors.black,
               child: Center(child: Material(child: CircularProgressIndicator(
                 backgroundColor: Colors.redAccent,
                 valueColor: AlwaysStoppedAnimation(Colors.green),
                 strokeWidth: 10,
               )),),
             );
           }
         },
        ),
      ),
    );
  }
}



    //             FirebaseFirestore.instance
      //                 .collection('users')
      //                 .doc(FirebaseAuth.instance.currentUser.uid)
      //                 .get()
      //                 .then((DocumentSnapshot result) =>
      //                     Navigator.pushReplacement(
                                       
      //                         context,CupertinoPageRoute(builder: (context) => Home( uid: FirebaseAuth.instance.currentUser.uid,)))
      // //                     Navigator.pushReplacement(
      // context,CupertinoPageRoute(builder: (context) => Intro())
       