part of 'location_bloc.dart';

@immutable
abstract class LocationState {
  const LocationState();
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {
  final bool isLoading;

  const LocationLoading(this.isLoading);
}

class LoactionError extends LocationState {
  final String errorText;

  const LoactionError(this.errorText);
}

class FetchingLocationSuccesfull extends LocationState {
  final List<Locations?>? locations;

  const FetchingLocationSuccesfull(this.locations);
}
