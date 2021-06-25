import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/animation.dart';
import 'package:suraksha/components/curve_wave.dart';
import 'package:suraksha/components/circle_painter.dart';
import 'package:suraksha/pages/home.dart';


class AlertPage extends StatefulWidget {
  final double size;
  final Color color;
  // final Widget child;
  const AlertPage({Key? key, this.size = 80.0, this.color = Colors.red,
   }) : super(key: key);
  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> with TickerProviderStateMixin{
  bool _isOpen = false;
  PanelController _panelController = PanelController();
   late AnimationController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = AnimationController(
  //     vsync: this,
  //     lowerBound: 0.5,
  //     duration: Duration(seconds: 3),
  //   )..repeat();
  // }

  // late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
      
    )..repeat();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  // Widget _button() {
  //   return Material(
  //     color: Colors.transparent,
  //     child: InkWell(
  //       onTap: (){

  //       },
  //       child: Center(
  //         child: ClipRRect(
  //           borderRadius: BorderRadius.circular(widget.size),
  //           child: DecoratedBox(
  //             decoration: BoxDecoration(
  //               color: Colors.blue.withOpacity(1 - _controller.value),
  //             ),
  //             child: ScaleTransition(
  //                 scale: Tween(begin: 0.95, end: 1.0).animate(
  //                   CurvedAnimation(
  //                     parent: _controller,
  //                     curve: const CurveWave(),
  //                   ),
  //                 ),
  //                 child: Center(
  //                   child: Text("ACCEPT",style: GoogleFonts.lato(color:Colors.white),),)
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************
  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
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
                    Text("Aditya Needs Help!!",style: GoogleFonts.roboto(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600)),
                   SizedBox(height:20),
                     Center(
        child: CustomPaint(
          painter: CirclePainter(
            _controller,
            color: widget.color,
          ),
         
          child: Container(
            color: Colors.transparent,
            width: widget.size * 5,
            height: widget.size * 4.125,
            
                child: Center(
                    child: TextButton(onPressed: (){
                     //  Navigator.push(context, CupertinoPageRoute(builder: (context)=> MapScreen()));
                    }, child: Text("ACCEPT",style: GoogleFonts.lato(color:Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),)),
              
            
          ),
           
        ),
      ),
            //           child: Container(
            //           height: 200,
            //           width: 200,
            //     padding: EdgeInsets.all(30),
            //           alignment: Alignment.center,
            //           decoration: BoxDecoration(
            //             color: Colors.cyanAccent[400],
            //             borderRadius:BorderRadius.circular(400)
            //           ),
            //           child: Center(child: Text("ACCEPT!",style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.w600)),),
            //   ),
                    
              SizedBox(height: ht * 0.06),
              Text("Nearby You",style: GoogleFonts.roboto(color: Colors.white,fontSize: 20),)
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
            maxHeight: MediaQuery.of(context).size.height * 0.55,
            body: GestureDetector(
              onTap: () => _panelController.close(),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            panelBuilder: (ScrollController controller) =>
                _panelBody(controller,ht,wid),
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
  // Widget _buildBody() {
  //   return AnimatedBuilder(
  //     animation: CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
  //     builder: (context, child) {
  //       return Stack(
  //         alignment: Alignment.center,
  //         children: <Widget>[
  //           _buildContainer(150 * _controller.value),
  //           _buildContainer(200 * _controller.value),
  //           _buildContainer(250 * _controller.value),
  //           _buildContainer(300 * _controller.value),
  //           _buildContainer(200 * _controller.value),
  //           Align(child: Icon(Icons.phone_android, size: 44,)),
  //         ],
  //       );
  //     },
  //   );
  // }

  // Widget _buildContainer(double radius) {
  //   return Container(
  //     width: radius,
  //     height: radius,
  //     decoration: BoxDecoration(
  //       shape: BoxShape.circle,
  //       color: Colors.blue.withOpacity(1 - _controller.value),
  //     ),
  //   );
  // }

  /// **********************************************
  /// WIDGETS
  /// **********************************************
  /// Panel Body
  Widget _panelBody(ScrollController controller,double ht,double wid) {
    

    return Container(
      padding: EdgeInsets.only(left:10,right:10,top: 20),
      child: SingleChildScrollView(
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
      panelCard1(ht, wid,"Active Emergency","Call 101 for emergencies","1-0-1"),

      // 2nd card
      SizedBox(width:20),

      panelCard2(ht, wid,"Need Ambulance","Call an Ambulance quickly","Call"),
      
        ]
      )
      ),
  ),
              ]
            ),

            SizedBox(height:ht * 0.04),
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
          panelCard2(ht, wid, "CPR and First Aid", "Tips on CPR and First Aid","Check" ),
      SizedBox(width: 20),
      panelCard1(ht, wid, "Fire Department", "Call Fire Department", "Call")

        ]
      )
      ),
  ),
              ]
            )
           
          ],
        ),
      ),
    );
  }

  Container panelCard2(double ht, double wid,String title,String body,String btext) {
    return Container(
          padding: EdgeInsets.all(15),
          height: ht * 0.2,
          width: wid*0.4,
          
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color:Colors.grey,
            blurRadius: 5.0,),],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,style: GoogleFonts.roboto(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 23)),
              SizedBox(height:5),
              Text(body,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 15)),
              SizedBox(height:10),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
      height: 30.0,
      child: GestureDetector(
          onTap: () {},
          child: Container(
                width: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0XFF7F00FF),Color(0XFFE100FF)]),
                     boxShadow: [BoxShadow(color:Colors.grey,
            blurRadius: 5.0,),],
                    borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Center(
                            child: Text(
                               btext,
                                style: TextStyle(
                                    color: Colors.white,
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
              ) ]
          ),
      
    );
  }

  Widget panelCard1(double ht, double wid,String title,String body,String btext) {
    return Container(
          padding: EdgeInsets.all(15),
          height: ht * 0.2,
          width: wid*0.4,
          
          decoration: BoxDecoration(
             gradient: LinearGradient(colors: [Color(0XFF7F00FF),Color(0XFFE100FF)]),
            boxShadow: [BoxShadow(color:Colors.grey,
            blurRadius: 5.0,),],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23)),
              SizedBox(height:2),
              Text(body,style: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.w300,fontSize: 15)),
              SizedBox(height:10),
              Container(
      height: 30.0,
      child: GestureDetector(
          onTap: () {
            // Navigator.push(context, CupertinoPageRoute(builder: (context)=> MapScreen()));
          },
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
                             btext,
                              style: TextStyle(
                                  color: Color(0XFF7F00FF),
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
      
    );
  }
  }

  