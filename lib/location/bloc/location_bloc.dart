import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_application/location/location_provider.dart';
import 'package:weather_application/models/location_model.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(LocationProvider provider) : super(LocationInitial()) {
    on<LocationEvent>((event, emit) {});
    on<LocationSearching>((event, emit) async {
      emit(const LocationLoading(true));
      try {
        final locations =
            await provider.fetchLocations(city: event.locationName);
        emit(const LocationLoading(false));
        emit(FetchingLocationSuccesfull(locations));
      } catch (e) {
        emit(LoactionError(e.toString()));
      }
    });
  }
}
