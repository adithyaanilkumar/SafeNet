import 'package:flutter/material.dart';

class EmergencyDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 45.0, bottom: 15.0, left: 15.0, right: 15.0),
      height: 1000.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SizedBox(
                    height: 200.0,
                    child: Card(
                      color: Colors.white,
                      child: Center(
                        child: Text('Card1'),
                      ),
                    )),
              ),
              Expanded(
                child: SizedBox(
                    height: 200.0,
                    child: Card(
                      color: Colors.white,
                      child: Center(
                        child: Text('Card2'),
                      ),
                    )),
              ),
            ],
          ),
          SizedBox(
              height: 200.0,
              child: Card(
                color: Colors.white,
                child: Center(
                  child: Text('Card3'),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                    height: 200.0,
                    child: Card(
                      color: Colors.white,
                      child: Center(
                        child: Text('Card4'),
                      ),
                    )),
              ),
              Expanded(
                child: SizedBox(
                    height: 200.0,
                    child: Card(
                      color: Colors.white,
                      child: Center(
                        child: Text('Card5'),
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
