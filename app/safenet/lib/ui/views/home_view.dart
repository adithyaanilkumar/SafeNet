import 'package:flutter/material.dart';
import 'package:safenet/ui/constants.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
          elevation: 2.0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[],
          ),
          shape: CircularNotchedRectangle(),
          color: Colors.blueGrey,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Container(
                      width: 385.0,
                      child: TextField(
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.arrow_back_ios),
                            suffixIcon: Icon(Icons.search_rounded)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Color(0xff0278ae)
// Color(0xff51adcf)
// Color(0xffa5ecd7)
// Color(0xffe8ffc1)
