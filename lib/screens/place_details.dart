import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_fav_places/models/place.dart';

class PlaceDetailsScreen extends ConsumerWidget {
  const PlaceDetailsScreen({super.key, required this.place});
  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final place = ref.read(placesProvider.notifier).getPlace(placeId);

    return Scaffold(
      appBar: AppBar(title: Text('Place Details')),
      body: Center(
        child: Text(
          place.title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
