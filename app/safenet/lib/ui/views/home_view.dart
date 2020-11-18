import 'package:flutter/material.dart';
import 'package:safenet/core/services/location.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;
import 'package:safenet/tokens.dart';
import 'package:safenet/ui/constants.dart';
import 'package:safenet/ui/customWidgets/searchBar.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var latitude;
  var longitude;
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
      floatingActionButton: new FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.my_location),
        onPressed: () {
          buildMap();
        },
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          FlutterMap(
            mapController: controller,
            options: MapOptions(
                center: latLng.LatLng(
                  78.212963,
                  17.236184,
                ),
                minZoom: 5.0),
            layers: [
              TileLayerOptions(
                  urlTemplate: "$url?access_token=$mapBoxToken",
                  additionalOptions: {
                    'accessToken': '$mapBoxToken',
                    'id': 'mapbox.mapbox-streets-v8'
                  }),
            ],
          ),
          Positioned(
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
                    readOnly: true,
                    onTap: () async {
                      final result = await showSearch(
                        context: context,
                        delegate: SearchBar(),
                      );
                      if (result != null) {
                        controller.move(
                            latLng.LatLng(result[0], result[1]), 20.0);
                      }
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Search',
                      suffixIcon: Icon(Icons.search_rounded),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Color(0xff0278ae)
// Color(0xff51adcf)
// Color(0xffa5ecd7)
// Color(0xffe8ffc1)
