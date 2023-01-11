import 'package:weather_application/models/weather_model.dart';

abstract class WeatherPovider {
  Future<Weather>? fetchWeather({required String cityName});
}
