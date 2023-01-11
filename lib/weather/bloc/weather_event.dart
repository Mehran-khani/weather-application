part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequestedEvent extends WeatherEvent {
  final String city;

  const WeatherRequestedEvent(this.city);
  @override
  List<Object?> get props => [city];
}

class WeatherRefreshEvent extends WeatherEvent {
  final String city;

  const WeatherRefreshEvent({required this.city});
  @override
  List<Object?> get props => [city];
}
