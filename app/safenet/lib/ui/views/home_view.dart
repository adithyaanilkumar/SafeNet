import 'package:flutter/material.dart';
import 'package:safenet/ui/constants.dart';
import 'package:geolocation/geolocation.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;
import 'package:safenet/ui/customWidgets/searchBar.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  MapController controller = MapController();

  getPermission() async {
    final GeolocationResult result =
        await Geolocation.requestLocationPermission(
            permission: const LocationPermission(
                android: LocationPermissionAndroid.fine));
    return result;
  }

  getLocation() async {
    return getPermission().then((result) async {
      if (result.isSuccessful) {
        final coords =
            await Geolocation.currentLocation(accuracy: LocationAccuracy.city);
        return coords;
      }
    });
  }

  buildMap() {
    getLocation().then((response) {
      if (response.isSuccessful) {
        response.listen((value) {
          controller.move(
              latLng.LatLng(value.location.latitude, value.location.longitude),
              15.0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Column(
            children: [
              Row(
                children: [
                  SearchBar(),
                ],
              ),
              Expanded(
                child: FlutterMap(
                  mapController: controller,
                  options: MapOptions(center: buildMap(), minZoom: 5.0),
                  layers: [
                    TileLayerOptions(
                        urlTemplate:
                            "https://api.mapbox.com/styles/v1/shrinkingviolet/ckgv04qs30mur19p91h9euprb/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2hyaW5raW5ndmlvbGV0IiwiYSI6ImNrZ2h0NnE3NDFka3Iyc25heGxudWpyNGEifQ.jY8M7bZoK5WxWuF81lNVhQ",
                        additionalOptions: {
                          'accessToken':
                              'pk.eyJ1Ijoic2hyaW5raW5ndmlvbGV0IiwiYSI6ImNrZ2h0NnE3NDFka3Iyc25heGxudWpyNGEifQ.jY8M7bZoK5WxWuF81lNVhQ',
                          'id': 'mapbox.mapbox-streets-v8'
                        }),
                  ],
                ),
              )
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
