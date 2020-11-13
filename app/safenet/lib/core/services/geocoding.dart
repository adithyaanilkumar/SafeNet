import 'package:safenet/core/services/networking.dart';
import 'package:safenet/core/viewmodals/home_model.dart';
import 'package:safenet/tokens.dart';

class GeoCoding {
  static const url = "https://api.mapbox.com/geocoding/v5/mapbox.places";

  Future getCityLocation() async {
    String cityQuery = HomeViewModel().cityName;
    try {
      NetworkHelper networkHelper =
          NetworkHelper('$url/$cityQuery.json?access_token=$mapBoxToken');

      var cityLocation = networkHelper.getData();

      print(cityLocation);
    } catch (e) {
      print(e);
    }
  }
}
