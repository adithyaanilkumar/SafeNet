import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenet/core/viewmodals/home_model.dart';
import 'package:safenet/ui/views/emergency_view.dart';
import 'package:safenet/ui/views/home_view.dart';
import 'package:safenet/ui/views/profile.dart';
import 'package:swipedetector/swipedetector.dart';

class BottomAppBarItem {
  BottomAppBarItem({this.iconData, this.text});
  IconData iconData;
  String text;
}

class CustomBottomAppBar extends StatefulWidget {
  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, model, child) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SwipeDetector(
          onSwipeUp: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => EmergencyDetailsView());
          },
          child: FloatingActionButton(
            onPressed: () {
              print('tap');
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
            elevation: 2.0,
            backgroundColor: Colors.amber,
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            clipBehavior: Clip.antiAlias,
            notchMargin: 5.0,
            child: Container(
              height: 65.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.home,
                        size: 40.0,
                        color: Color(0xffe8ffc1),
                      ),
                      onPressed: () {
                        setState(() {
                          _controller.jumpToPage(0);
                        });
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.account_circle,
                        size: 40.0,
                        color: Color(0xffe8ffc1),
                      ),
                      onPressed: () {
                        setState(() {
                          _controller.jumpToPage(1);
                        });
                      })
                ],
              ),
            ),
            color: Color(0xff51adcf),
          ),
        ),
        body: PageView(
          physics: new NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (int) {
            print('Page changes to index $int');
          },
          children: [
            HomeView(),
            Profile(),
          ],
        ),
      );
    });
  }
}
