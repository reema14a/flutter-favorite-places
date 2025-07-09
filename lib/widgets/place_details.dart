import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_fav_places/providers/places_provider.dart';

class PlaceDetails extends ConsumerWidget {
  const PlaceDetails({super.key, required this.placeId});
  final String placeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final place = ref.read(placesProvider.notifier).getPlace(placeId);

    return Scaffold(
      appBar: AppBar(title: Text('Place Details')),
      body: Center(
        child: Text(
          place.title,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
