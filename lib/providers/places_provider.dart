import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_fav_places/models/place.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super(const []);

  void addPlace(String title) {
    final newPlace = Place(title);
    state = [...state, newPlace];
  }

  void deletePlace(String placeId) {
    state = state.where((place) => place.id != placeId).toList();
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<Place>>(
  (ref) => PlacesNotifier(),
);
