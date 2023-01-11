import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/screens/weather.dart';
import 'package:weather_application/weather/bloc/weather_bloc.dart';
import 'package:weather_application/weather/bloc/weatherbloc_observer.dart';
import 'package:weather_application/weather/openweather_weather_provider.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  final OpenweatherWeather openWeatherPovider = OpenweatherWeather();
  runApp(MyApp(
    openweatherWeather: openWeatherPovider,
  ));
}

class MyApp extends StatelessWidget {
  final OpenweatherWeather openweatherWeather;
  const MyApp({super.key, required this.openweatherWeather});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>
            WeatherBloc(openweatherWeather: openweatherWeather),
        child: const WeatherScreen(),
      ),
    );
  }
}
