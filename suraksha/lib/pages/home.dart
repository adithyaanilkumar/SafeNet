import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suraksha/main.dart';
import 'package:suraksha/pages/alert.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> { 
      double xOffset = 0;
    double yOffset = 0;
 bool isDrawerOpen = false;
  @override
  void initState(){
     super.initState();
     
   }

   @override

  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;

    return Scaffold(
     // backgroundColor: NeumorphicTheme.baseColor(context),

      body: Stack(
        children: [
          HiddenDrawer(),

          AnimatedContainer(
            
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(isDrawerOpen ? 0.80 : 1.0)
              ..rotateZ(isDrawerOpen ? -50 : 0),
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
             color: isDark?Color(0xFF292D32):Color(0xFFEFF3F6),
              
              borderRadius:
                  isDrawerOpen ? BorderRadius.circular(20) : BorderRadius.circular(0),
            ),
            child: Container(
            child: ListView(
              children: [
                SizedBox(height: 20,),
                  title(),
       
                AppBody(wid,ht,),
              ]
            ),),
          ),
          ]
      )
    );
  }

  Widget title() {
    return Container(
   padding: const EdgeInsets.fromLTRB(15,0,20,0),
   child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              Container(
              child: NeumorphicRadio(
                style: NeumorphicRadioStyle(
                  unselectedColor: Color(0xFFEFF3F6),
                  unselectedDepth: 10,
                  selectedDepth: -10,
                  intensity: 0.8,
                  lightSource: LightSource.top,
                  boxShape: NeumorphicBoxShape.circle(), 
                ), 
                child: isDrawerOpen
                              ? Center(
                                child: IconButton(
                                      onPressed: (){
                                        setState(() {
                                        xOffset = 0;
                                        yOffset = 0;
                                        isDrawerOpen = false;
                                      });
                                      },
                                      icon:Icon(Icons.arrow_back_ios,),
                                      iconSize: 20,),
                              )
                              : Center(
                                child: IconButton(
                  onPressed: (){
                                      setState(() {
                                      xOffset = 290;
                                      yOffset = 80;
                                      isDrawerOpen = true;
                                    });
                                    },
                  icon:Icon(Icons.menu)),
                              )),
              width: 40,
              height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("Kochi,Kerala",
                  style:TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  )
                  ),
                  Text("Janatha Road",
                  style:TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                  )
                  )
                  ]
              ),
              
              ]
                  ),
 );
  }

  Widget AppBody(double wid,double ht) {
    return Container(
        
        child: Container(
          padding: EdgeInsets.only(left:20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height: 20),
            Container(
              height: 200,
          width: wid * 0.9,
          decoration: lightBox(),
          padding: EdgeInsets.all(15),
          
          child: Stack(
              children: [
                Positioned(
                  left: wid * 0.27,
                  top:0,
                  child: Container(
                    height: 100,
                  
                    child: Lottie.network(
                            'https://assets4.lottiefiles.com/packages/lf20_calzmejb.json',
                          
                        ),
                  ),
                ),
 
                
                Positioned(
                  bottom: 5,
                  left: wid * 0.17,
                  child: Container(
    height: 50.0,
    decoration: lightBox(),
      child: GestureDetector(
            onTap: () {
              
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AlertPage()));
            },
            child: Container(
                    width: 200,
                    decoration: darkBox(),                 
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                              Center(
                                  child: Text(
                                     "NEED HELP!",
                                      style: TextStyle(
                                          color: Colors.cyanAccent[400],
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                      ),
                                  ),
                              )
                          ],
                      ),
                    
            ),
      ),
),
                )

              ]
          ),
    

            ),

            SizedBox(height: 20),
           contact(ht,wid),
           SizedBox(height: 20),
           Text("Explore",style:GoogleFonts.lato(fontSize: 25,fontWeight:FontWeight.w600),textAlign: TextAlign.left,),
          // SizedBox(height: 5),
           explore(ht),
          SizedBox(height: 10),
          card(wid,ht),

          ],),
        )      
    );
  }

Widget contact(double ht,double wid){
  return   Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.all(15),
          height: ht * 0.22,
          width: wid * 0.4,
          
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromRGBO(252, 74, 26, 1),Color.fromRGBO(247, 183, 51, 1)]),
            boxShadow: [BoxShadow(
            //  color:Color.fromRGBO(0,0,0,0.1),
              color: Colors.grey.shade300,
              offset: Offset(6,3),
            blurRadius: 6.0,
            spreadRadius: 5.0),
            BoxShadow(
              color:Color.fromRGBO(255,255,255,0.9),
              offset: Offset(-3,-3),
            blurRadius: 8.0,
            spreadRadius: 3.0),],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Active \nEmergency',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
              SizedBox(height:20),
              Text('Call 101 for emergencies',style: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.w100,fontSize: 15)),
              SizedBox(height:10),
              Container(
      height: 30.0,
      child: Center(
        child: GestureDetector(
            onTap: () {},
            child: Container(
                width: 100,
                decoration:  BoxDecoration(
            color: Color(0xFFEFF3F6),
            boxShadow: [BoxShadow(
              color:Color.fromRGBO(0,0,0,0.1),
              offset: Offset(4,3),
            blurRadius: 6.0,
            spreadRadius: 5.0),
            BoxShadow(
              color:Color.fromRGBO(255,255,255,0.1),
              offset: Offset(-3,-3),
            blurRadius: 8.0,
            spreadRadius: 3.0),],
            borderRadius: BorderRadius.circular(20),
          ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Center(
                            child: Text(
                               "1-0-1",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                ),
                            ),
                        )
                    ],
                ),
            ),
        ),
      ),
)

            ]
          ),
      
    ),

    // 2nd card
    SizedBox(width:20),

    Container(
          padding: EdgeInsets.all(15),
          height: ht * 0.22,
          width: wid * 0.4,
          
          decoration:lightBox(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Contacts',style: TextStyle(color: Colors.cyanAccent[400],fontWeight: FontWeight.bold,fontSize: 25)),
              SizedBox(height:35),
              Text('Call your Close Ones',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 15)),
              SizedBox(height:10),
              Container(
      height: 30.0,
      child: GestureDetector(
          onTap: () {},
          child: Container(
              width: 100,
              decoration:  BoxDecoration(
            color: Color(0xFFEFF3F6),
            boxShadow: [BoxShadow(
              color:Color.fromRGBO(0,0,0,0.2),
              offset: Offset(4,3),
            blurRadius: 6.0,
            spreadRadius: 5.0),
            BoxShadow(
              color:Color.fromRGBO(255,255,255,0.9),
              offset: Offset(-3,-3),
            blurRadius: 8.0,
            spreadRadius: 3.0),],
            borderRadius: BorderRadius.circular(20),
          ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Center(
                          child: Text(
                             "Call",
                              style: TextStyle(
                                  color: Colors.cyanAccent[400],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                              ),
                          ),
                      )
                  ],
              ),
          ),
      ),

               ) ]
          ),
      
    ),
    SizedBox(width: 20),
    
      ]
    
    
  );
}

Widget explore(double ht){
  return Container(
    height: ht * 0.15,
  //  padding: EdgeInsets.symmetric(horizontal:5),
    child:ListView(
      scrollDirection: Axis.horizontal,
          children: [
            Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          exploreWidget("Bus Routes",Icons.map_outlined,Colors.yellow,'https://assets10.lottiefiles.com/packages/lf20_eivbhioz.json'),
          exploreWidget("Ambulance",Icons.time_to_leave,Colors.red,'https://assets4.lottiefiles.com/packages/lf20_eppz7mfa.json'),
          exploreWidget("Medical Info",Icons.medical_services,Colors.cyan,'https://assets10.lottiefiles.com/packages/lf20_pk5mpw6j.json'),
          exploreWidget("Safe Routes",Icons.directions_walk,Colors.yellow,'https://assets6.lottiefiles.com/temp/lf20_FYZYCn.json' ),
          exploreWidget("Safety Tips",Icons.privacy_tip_outlined,Colors.red,'https://assets9.lottiefiles.com/private_files/lf30_ufgbcgx8.json'),
          exploreWidget("Chat with Us",Icons.chat,Colors.cyan,'https://assets1.lottiefiles.com/packages/lf20_6mtrurjh.json'),
        ]
      ),]
    )

  );
}

Widget exploreWidget(String text,IconData icon,Color color,String url) {
  return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        height: 81,
        width: 80,
        
        decoration:  lightBox(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          //  Icon(icon,color: color,size: 25,),
            Lottie.network(
              url,
              height: 35,
            ),
            SizedBox(height: 10,),
            Text(text,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
          ]
        ),
    
  );
}

Widget HiddenDrawer(){
  return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0XFF2B32B2),Color(0XFF1488CC)]
        ) 
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 70, left: 40, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
         //   SizedBox(height: 10,),
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.tealAccent[700],
                  radius: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image(
                      height: 70,
                      width: 70,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/zayn.jpg'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Aditya A',
                  style: GoogleFonts.acme(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                _customRow(
                 'Profile',
                  Icons.person_outline,
                ),
                
                
                SizedBox(
                  height: 20,
                ),
                _customRow(
                 'Your Cart',
                  Icons.shopping_cart_outlined,
                ),
                SizedBox(
                  height: 20,
                ),
                _customRow(
                 'Saved',
                  Icons.bookmark_border,
                ),
                SizedBox(
                  height: 20,
                ),
                _customRow(
                 'Language',
                  Icons.language_outlined
                ),
                SizedBox(
                  height: 20,
                ),
                _customRow(
                 'Help',
                  Icons.lightbulb_outline,
                ),
                SizedBox(
                  height: 20,
                ),
                
                _customRow(
                 'Settings',
                  Icons.settings,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
  
    );
  }



  Widget _customRow(String text,IconData icon){
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }





Widget card(double wid,double ht){
   return Container(
     margin: EdgeInsets.only(left: 20),
     padding: const EdgeInsets.all(10.0),
     child: Container(
        //  padding: EdgeInsets.all(15),
          height: ht *0.30,
          width: wid * 0.75,
          
          decoration:lightBox(),
        child: Stack(
          children: [
            // Column(
            //   children: [
            //     Text("Get",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
            //     Text("Home",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
            //     Text("Safetly",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
            //   ],
            // ),
            Positioned(
              left: wid*0.10,
              
              child: Container(
                height: ht*0.25,
                
                child: Lottie.network(
                  'https://assets10.lottiefiles.com/private_files/lf30_fe507ybk.json',
                  fit: BoxFit.contain,
                 // width: 
                ),
              ),
            ),
            Positioned(
              top: 30,
              right: wid*0.12,
              child: Text("Get Home \nSafetly",textAlign:TextAlign.end,style: GoogleFonts.teko(fontSize: 30,fontWeight: FontWeight.w700,)),),
             Positioned(
               bottom: 20,
               left: wid*0.20,
               child: Container(
      height: 40.0,
      child: GestureDetector(
          onTap: () {},
          child: Container(
                width: 150,
                 decoration:  lightBox(),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Center(
                            child: Text(
                               "Locate",
                                style: TextStyle(
                                    color: Colors.cyanAccent[400],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                ),
                            ),
                        )
                    ],
                ),
          ),
      ),

                 ),
             ) 
          ]
        ),
      
  ),
   );
}

BoxDecoration lightBox() {
  return BoxDecoration(
          color: Color(0xFFEFF3F6),
          boxShadow: [BoxShadow(
            color:Color.fromRGBO(0,0,0,0.2),
            offset: Offset(4,3),
          blurRadius: 6.0,
          spreadRadius: 5.0),
          BoxShadow(
            color:Color.fromRGBO(255,255,255,0.9),
            offset: Offset(-3,-3),
          blurRadius: 8.0,
          spreadRadius: 3.0),],
          borderRadius: BorderRadius.circular(20),
        );
}

BoxDecoration darkBox() {
  return BoxDecoration(
              boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(0.1),
        offset: Offset(-6.0, -6.0),
        blurRadius: 16.0,
      ),
      BoxShadow(
        color: Colors.black.withOpacity(0.4),
        offset: Offset(6.0, 6.0),
        blurRadius: 16.0,
      ),
    ],
    color: Color(0xFF292D32),

          borderRadius: BorderRadius.circular(20),
        );
}



}








 






