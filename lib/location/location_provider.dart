import 'package:weather_application/models/location_model.dart';

abstract class LocationProvider {
  Future<List<Locations?>?> fetchLocations({required String city});
}
