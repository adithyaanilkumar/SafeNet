import 'package:flutter/material.dart';
import 'package:safenet/ui/constants.dart';

class SearchBar extends StatelessWidget {
  /// custom search bar created to search any place on the map.
  // TODO: The search bar does nothing as of now, must be developed to get location of the specified area and show it on the map

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 27.0,
        right: 15.0,
        left: 15.0,
        child: Container(
          child: Card(
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
        ));
  }
}
