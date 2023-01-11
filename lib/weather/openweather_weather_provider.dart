import 'package:weather_application/location/openweather_location_provider.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/weather/weather_provider.dart';
import 'package:http/http.dart' as http;

class OpenweatherWeather implements WeatherPovider {
  String apiKey = 'bd12f78a2c7921edf8ffe39a2de6be7c';

  @override
  Future<Weather>? fetchWeather({required String cityName}) async {
    final response = await http.Client().get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric'));
    try {
      if (response.statusCode == 200) {
        // jsonDecode(response.body) as List;
        return weatherFromJson(response.body) as Weather;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Future<Weather>? getWeatherFromCity(String city) async {
  //   final fetchedCity = await OpenweatherLocation().fetchLocations(city: city);
  //   return fetchWeather(cityName: fetchedCity.toString());
  // }
}
