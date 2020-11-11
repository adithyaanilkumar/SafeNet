import 'package:flutter/material.dart';
import 'package:safenet/core/services/location.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;
import 'package:safenet/tokens.dart';
import 'package:safenet/ui/customWidgets/searchBar.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  MapController controller = MapController();
  Location location = Location();
  static const String url =
      "https://api.mapbox.com/styles/v1/shrinkingviolet/ckgv04qs30mur19p91h9euprb/tiles/256/{z}/{x}/{y}@2x";

  buildMap() {
    location.getCurrentLocation().then((response) {
      controller.move(
          latLng.LatLng(location.latitude, location.longitude), 15.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          FlutterMap(
            mapController: controller,
            options: MapOptions(center: buildMap(), minZoom: 5.0),
            layers: [
              TileLayerOptions(
                  urlTemplate: "$url?access_token=$mapBoxToken",
                  additionalOptions: {
                    'accessToken': '$mapBoxToken',
                    'id': 'mapbox.mapbox-streets-v8'
                  }),
            ],
          ),
          SearchBar(),
        ],
      ),
    );
  }
}

// Color(0xff0278ae)
// Color(0xff51adcf)
// Color(0xffa5ecd7)
// Color(0xffe8ffc1)
