part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {
  const LocationEvent();
}

class LocationSearching extends LocationEvent {
  final String locationName;

  const LocationSearching(this.locationName);
}
