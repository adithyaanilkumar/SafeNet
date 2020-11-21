import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  double latitude;
  double longitude;

  List<Marker> markers = [
    Marker(
      width: 80.0,
      height: 80.0,
      point: latLng.LatLng(51.5, -0.09),
      builder: (context) => Container(
        child: Icon(
          FontAwesomeIcons.mapMarker,
          color: Colors.red,
          size: 25.0,
        ),
      ),
    ),
  ];

  addMarker(double lat, double long) {
    var marker = Marker(
        width: 80.0,
        height: 80.0,
        point: latLng.LatLng(lat, long),
        builder: (context) => Container(
              child: Icon(
                FontAwesomeIcons.mapMarker,
                color: Colors.red,
                size: 25.0,
              ),
            ));
    markers.clear();
    markers.add(marker);
    notifyListeners();
  }
}
