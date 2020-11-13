import 'package:safenet/core/services/networking.dart';
import 'package:safenet/tokens.dart';

class GeoCoding {
  static const url = "https://api.mapbox.com/geocoding/v5/mapbox.places";

  Future getCityLocation(String cityQuery) async {
    try {
      NetworkHelper networkHelper =
          NetworkHelper('$url/$cityQuery.json?access_token=$mapBoxToken');

      var cityLocation = await networkHelper.getData();

      var cityName = cityLocation['type'];
      print(cityName);
      return cityName;
    } catch (e) {
      print(e);
    }
  }
}
