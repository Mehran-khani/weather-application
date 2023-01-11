import 'package:weather_application/location/location_provider.dart';
import 'package:weather_application/models/location_model.dart';
import 'package:http/http.dart' as http;

class OpenweatherLocation implements LocationProvider {
  late double latitude;
  late double longtitude;
  String apiKey = 'bd12f78a2c7921edf8ffe39a2de6be7c';
  late int status;

  @override
  Future<List<Locations?>?> fetchLocations({required String city}) async {
    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=5&appid=$apiKey'));
    try {
      if (response.statusCode == 200) {
        // jsonDecode(response.body) as List;
        return locationsFromJson(response.body)!.toList();
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Future<void> getLocation() async {
  //   try {
  //     Position position = await Geolocator.getCurrentPosition();
  //     latitude = position.latitude;
  //     longtitude = position.longitude;
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
