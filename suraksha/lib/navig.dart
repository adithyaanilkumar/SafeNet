import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'pages/map.dart';  
import 'pages/home.dart';
import 'pages/profile.dart';
class Navig extends StatefulWidget {
  Navig({Key? key}) : super(key: key);

  @override
  _NavigState createState() => _NavigState();
}

class _NavigState extends State<Navig> {
  int _currentIndex = 0;
  final List<Widget> _page = [
    Home(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: _page[_currentIndex],
       floatingActionButton:Container(
           height: 65,
           width: 65,
           child: FittedBox(
             child: FloatingActionButton(child: Icon(Icons.location_on),
             backgroundColor: Colors.cyanAccent[400],
             onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Gmap()));
             },
             ),
           ),
       ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       bottomNavigationBar: CurvedNavigationBar(
         
         height: 60,
          backgroundColor: Colors.blue[50],
           color: Colors.black87,
          buttonBackgroundColor: Colors.black,
        //  key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.home, size: 30,color:Colors.white),
            Icon(Icons.person,size:30,color:Colors.white)
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
    );
  }
}