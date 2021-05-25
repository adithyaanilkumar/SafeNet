import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AlertPage extends StatefulWidget {
  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  bool _isOpen = false;
  PanelController _panelController = PanelController();


  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              child: Container(
                height: 20,
                width: 20,
             //   padding: EdgeInsets.all(30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black87,
                 
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height:50),
                    Text("Aditya Needs Help!!",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600)),
                   SizedBox(height:20),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                      height: 200,
                      width: 200,
             //   padding: EdgeInsets.all(30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent[400],
                        borderRadius:BorderRadius.circular(400)
                      ),
                      child: Center(child: Text("ACCEPT!",style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.w600)),),
              ),
                    ),
              SizedBox(height: 10),
              Text("50 Meters Away",style: TextStyle(color: Colors.white,fontSize: 20),)
                  ],
                ),
              ),
              
            ),
          ),

          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.3,
            child: Container(
              color: Colors.white,
            ),
          ),

          /// Sliding Panel
          SlidingUpPanel(
            controller: _panelController,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            ),
            minHeight: MediaQuery.of(context).size.height * 0.35,
            maxHeight: MediaQuery.of(context).size.height * 0.85,
            body: GestureDetector(
              onTap: () => _panelController.close(),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            panelBuilder: (ScrollController controller) =>
                _panelBody(controller),
            onPanelSlide: (value) {
              if (value >= 0.2) {
                if (!_isOpen) {
                  setState(() {
                    _isOpen = true;
                  });
                }
              }
            },
            onPanelClosed: () {
              setState(() {
                _isOpen = false;
              });
            },
          ),
        ],
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************
  /// Panel Body
  SingleChildScrollView _panelBody(ScrollController controller) {
    

    return SingleChildScrollView(
      controller: controller,
      physics: ClampingScrollPhysics(),
      child: Column(
        children: <Widget>[
          SizedBox(height:20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
              
              Container(
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
              Text('Ambulance',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25)),
              SizedBox(height:10),
              Text('Call an Ambulance ',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 15)),
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
                                  color: Colors.black,
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
  ),
            ]
          ),

          SizedBox(height:20),
    //2ND ROW

    Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
              
              Container(
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
            color: Colors.white,
            boxShadow: [BoxShadow(color:Colors.grey,
            blurRadius: 5.0,),],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('CPR And First Aid',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25)),
              Text('Tips on CPR and First Aid',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 15)),
              SizedBox(height:10),
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
                             "Check",
                              style: TextStyle(
                                  color: Colors.black,
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
              Text('Fire Department',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25)),
              SizedBox(height:2),
              Text('Call Fire Department',style: TextStyle(color: Colors.grey[350],fontWeight: FontWeight.w100,fontSize: 15)),
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
                             "Call",
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
      ]
    )
    ),
  ),
            ]
          )
         
        ],
      ),
    );
  }
  }

  