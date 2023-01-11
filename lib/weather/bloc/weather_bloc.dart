import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_application/location/openweather_location_provider.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/weather/openweather_weather_provider.dart';
import 'package:weather_application/weather/weather_provider.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final OpenweatherWeather openweatherWeather;
  WeatherBloc({required this.openweatherWeather}) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {});
    on<WeatherRequestedEvent>((event, emit) async {
      emit(WeatherLoading());
      try {
        final Weather? weather =
            await openweatherWeather.fetchWeather(cityName: event.city);
        emit(WeatherSuccess(weather: weather!));
      } catch (e) {
        emit(WeatherFailure());
      }
    });
    on<WeatherRefreshEvent>((event, emit) async {
      try {
        final Weather? weather =
            await openweatherWeather.fetchWeather(cityName: event.city);
        emit(WeatherSuccess(weather: weather!));
      } catch (e) {
        emit(WeatherFailure());
      }
    });
  }
}
