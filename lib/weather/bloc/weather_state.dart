part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherFailure extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final Weather weather;

  const WeatherSuccess({required this.weather});
  @override
  List<Object?> get props => [weather];
}
