import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:safenet/core/services/location.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;
import 'package:safenet/ui/constants.dart';
import 'package:safenet/ui/customWidgets/searchBar.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  MapController controller = MapController();
  Location location = Location();

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
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/shrinkingviolet/ckgv04qs30mur19p91h9euprb/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2hyaW5raW5ndmlvbGV0IiwiYSI6ImNrZ2h0NnE3NDFka3Iyc25heGxudWpyNGEifQ.jY8M7bZoK5WxWuF81lNVhQ",
                  additionalOptions: {
                    'accessToken':
                        'pk.eyJ1Ijoic2hyaW5raW5ndmlvbGV0IiwiYSI6ImNrZ2h0NnE3NDFka3Iyc25heGxudWpyNGEifQ.jY8M7bZoK5WxWuF81lNVhQ',
                    'id': 'mapbox.mapbox-streets-v8'
                  }),
            ],
          ),
          Positioned(
              top: 10,
              right: 15,
              left: 15,
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
              )),
        ],
      ),
    );
  }

  // Widget searchbar() {
  //   final isPortrait =
  //       MediaQuery.of(context).orientation == Orientation.portrait;
  //   return FloatingSearchBar(
  //     hint: 'Search',
  //     scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
  //     transitionDuration: const Duration(milliseconds: 800),
  //     transitionCurve: Curves.easeInOut,
  //     physics: const BouncingScrollPhysics(),
  //     axisAlignment: isPortrait ? 0.0 : -1.0,
  //     openAxisAlignment: 0.0,
  //     maxWidth: isPortrait ? 600 : 500,
  //     debounceDelay: const Duration(milliseconds: 500),
  //     onQueryChanged: (query) {
  //       // Call your model, bloc, controller here.
  //     },
  //     // Specify a custom transition to be used for
  //     // animating between opened and closed stated.
  //     transition: CircularFloatingSearchBarTransition(),
  //     actions: [
  //       FloatingSearchBarAction(
  //         showIfOpened: false,
  //         child: CircularButton(
  //           icon: const Icon(Icons.place),
  //           onPressed: () {},
  //         ),
  //       ),
  //       FloatingSearchBarAction.searchToClear(
  //         showIfClosed: false,
  //       ),
  //     ],
  //     builder: (context, transition) {
  //       return ClipRRect(
  //         borderRadius: BorderRadius.circular(8),
  //         child: Material(
  //           color: Colors.white,
  //           elevation: 4.0,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: Colors.accents.map((color) {
  //               return Container(height: 112, color: color);
  //             }).toList(),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}

// Color(0xff0278ae)
// Color(0xff51adcf)
// Color(0xffa5ecd7)
// Color(0xffe8ffc1)
