import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenet/core/services/location.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;
import 'package:safenet/core/services/providers.dart';
import 'package:safenet/core/viewmodals/home_model.dart';
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

      Provider.of<HomeViewModel>(context, listen: false)
          .addMarker(location.latitude, location.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Scaffold(
        floatingActionButton: new FloatingActionButton(
          backgroundColor: Colors.white,
          heroTag: null,
          child: Icon(
            Icons.my_location,
            color: Color(0xff5C5D5F),
          ),
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
              options:
                  MapOptions(center: latLng.LatLng(51.5, -0.09), zoom: 15.0),
              layers: [
                TileLayerOptions(
                    urlTemplate: "$url?access_token=$mapBoxToken",
                    additionalOptions: {
                      'accessToken': '$mapBoxToken',
                      'id': 'mapbox.mapbox-streets-v8'
                    }),
                MarkerLayerOptions(
                  markers: Provider.of<HomeViewModel>(context).markers,
                )
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

                        Provider.of<HomeViewModel>(context, listen: false)
                            .addMarker(result[1], result[0]);

                        if (result != null) {
                          latitude = result[1];
                          longitude = result[0];
                          controller.onReady.then((result) {
                            controller.move(
                                latLng.LatLng(latitude, longitude), 15.0);
                          });
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
      ),
    );
  }
}

// Color(0xff0278ae)
// Color(0xff51adcf)
// Color(0xffa5ecd7)
// Color(0xffe8ffc1)
