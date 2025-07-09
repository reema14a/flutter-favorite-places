import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_fav_places/models/place.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super([]);

  void addPlace(String title) {
    final newPlace = Place(DateTime.now().toString(), title);
    state = [...state, newPlace];
  }

  Place getPlace(String placeId) {
    final place = state.firstWhere((place) => place.id == placeId);
    return place;
  }

  void deletePlace(String placeId) {
    state = state.where((place) => place.id != placeId).toList();
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<Place>>(
  (ref) => PlacesNotifier(),
);
