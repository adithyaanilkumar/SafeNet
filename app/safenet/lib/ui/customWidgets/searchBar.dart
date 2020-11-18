import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenet/core/services/geocoding.dart';
import 'package:safenet/core/services/location.dart';
import 'package:safenet/ui/constants.dart';
import 'package:safenet/core/viewmodals/home_model.dart';
import 'package:safenet/ui/views/home_view.dart';

class SearchBar extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    GeoCoding geoCoding = GeoCoding();
    Location location = Location();
    // var cityData = geoCoding.getCityLocation(query).toString();
    return FutureBuilder(
        future: geoCoding.getCityLocation(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    title: Text(snapshot.data[index]['place_name']),
                    leading: Icon(Icons.location_city),
                    onTap: () {
                      var latitude = snapshot.data[index]['center'][0];
                      var longitude = snapshot.data[index]['center'][1];
                      close(context, [latitude, longitude]);
                    },
                  ),
                );
              },
            );
          }
          return Container();
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
