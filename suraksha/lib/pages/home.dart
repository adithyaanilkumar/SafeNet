import 'package:flutter/material.dart';
import 'package:suraksha/pages/alert.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        color: Colors.blue[50],
        padding: EdgeInsets.fromLTRB(25,25,25,0),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/backimg.jpg"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: ListView(
          children: [
            FirstHalf(),
          ]
        ),))
    );
  }
}

class FirstHalf extends StatefulWidget {
  @override
  _FirstHalfState createState() => _FirstHalfState();
}

class _FirstHalfState extends State<FirstHalf> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(),
          SizedBox(height: 20),
          Container(
        padding: EdgeInsets.all(15),
        height: 200,
        width: 460,
        
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color:Colors.grey,
          blurRadius: 5.0,),],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/announce.jpg'),
            ),
            SizedBox(height:20),
            Container(
    height: 50.0,
    child: GestureDetector(
        onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => AlertPage()));
        },
        child: Container(
            width: 200,
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(30.0),
            ),
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
)

          ]
        ),
    
  ),

          SizedBox(height: 20),
         contact(),
         SizedBox(height: 20),
         Text("Explore",style:TextStyle(fontSize: 25,fontWeight:FontWeight.w900),textAlign: TextAlign.left,),
         SizedBox(height: 10),
         explore(),
        SizedBox(height: 20),
        card(),

        ],)      
    );
  }
}

Widget title(){
   return Padding(
     padding: const EdgeInsets.fromLTRB(0,0,40,0),
     child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                Container(
                child: Icon(Icons.settings),
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: Colors.white,
                boxShadow: [BoxShadow(color:Colors.grey[600],
                blurRadius: 8.0,),],
                shape: BoxShape.circle),)]
                    ),
   );
}

 

Widget contact(){
  return Container(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.all(15),
          height: 160,
          width: 200,
          
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromRGBO(252, 74, 26, 1),Color.fromRGBO(247, 183, 51, 1)]),
            boxShadow: [BoxShadow(color:Colors.grey,
            blurRadius: 5.0,),],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Active Emergency',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25)),
              SizedBox(height:2),
              Text('Call 101 for emergencies',style: TextStyle(color: Colors.grey[350],fontWeight: FontWeight.w100,fontSize: 15)),
              SizedBox(height:10),
              Container(
      height: 30.0,
      child: GestureDetector(
          onTap: () {},
          child: Container(
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
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
)

            ]
          ),
      
    ),

    // 2nd card
    SizedBox(width:20),

    Container(
          padding: EdgeInsets.all(15),
          height: 160,
          width: 200,
          
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color:Colors.grey,
            blurRadius: 5.0,),],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Contacts',style: TextStyle(color: Colors.cyanAccent[400],fontWeight: FontWeight.bold,fontSize: 25)),
              SizedBox(height:10),
              Text('Call your Close Ones',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 15)),
              SizedBox(height:30),
              Container(
      height: 30.0,
      child: GestureDetector(
          onTap: () {},
          child: Container(
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                   boxShadow: [BoxShadow(color:Colors.grey,
            blurRadius: 5.0,),],
                  borderRadius: BorderRadius.circular(30.0),
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
    )
    ),
  );
}

Widget explore(){
  return Container(
    padding: EdgeInsets.only(right:20),
    child:SingleChildScrollView(
      scrollDirection: Axis.horizontal,
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
          padding: EdgeInsets.all(15),
          height: 81,
          width: 80,
          
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color:Colors.grey,
            blurRadius: 1.0,),],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.map_outlined,color: Colors.yellow,size: 25,),
              Text("Bus Routes",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
            ]
          ),
      
    ),
    SizedBox(width:20),
    Container(
          padding: EdgeInsets.all(15),
          height: 81,
          width: 80,
          
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color:Colors.grey,
            blurRadius: 1.0,),],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.time_to_leave,color: Colors.red,size: 25,),
              SizedBox(height:10),
              Text("Ambulance",style: TextStyle(fontSize: 9,fontWeight: FontWeight.w900),textAlign: TextAlign.center,)
            ]
          ),
      
    ),
    SizedBox(width:20),
    Container(
          padding: EdgeInsets.all(15),
          height: 81,
          width: 80,
          
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color:Colors.grey,
            blurRadius: 1.0,),],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.medical_services,color: Colors.cyan,size: 25,),
              Text("Medical info",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
            ]
          ),
      
    ),
    SizedBox(width:20),
    Container(
          padding: EdgeInsets.all(15),
          height: 81,
          width: 80,
          
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color:Colors.grey,
            blurRadius: 1.0,),],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.directions_walk,color: Colors.yellow,size: 25,),
              Text("Safe Routes",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
            ]
          ),
      
    ),
    SizedBox(width:20),
    Container(
          padding: EdgeInsets.all(15),
          height: 81,
          width: 80,
          
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color:Colors.grey,
            blurRadius: 1.0,),],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.privacy_tip_outlined,color:Colors.red,size: 25,),
              Text("Safety Tips",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
            ]
          ),
      
    ),
    SizedBox(width:20),
    Container(
          padding: EdgeInsets.all(15),
          height: 81,
          width: 80,
          
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color:Colors.grey,
            blurRadius: 1.0,),],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.chat,color: Colors.cyan,size: 25,),
              Text("Chat With Us",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
            ]
          ),
      
    ),
    SizedBox(width:20),
        ]
      ),
    )

  );
}

Widget card(){
   return Padding(
     padding: const EdgeInsets.all(10.0),
     child: Container(
          padding: EdgeInsets.all(15),
          height: 200,
          width: 460,
          
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color:Colors.grey,
            blurRadius: 5.0,),],
            borderRadius: BorderRadius.circular(20),
          ),
        child: Row(
          children: [
            Column(
              children: [
                Text("Get",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                Text("Home",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                Text("Safetly",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
              ],
            ),
            Container(
              
              child: Image(image: AssetImage('assets/location.jpg'),fit: BoxFit.fitWidth,),
            )
          ]
        ),
      
  ),
   );
}

