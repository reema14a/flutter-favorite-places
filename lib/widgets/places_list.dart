import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_fav_places/providers/places_provider.dart';
import 'package:flutter_fav_places/screens/place_details.dart';
import 'package:flutter_fav_places/models/place.dart';

class PlacesList extends ConsumerWidget {
  const PlacesList({super.key, required this.places});
  final List<Place> places;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places found. Start adding some!',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),

      itemCount: places.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(places[index].id),
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
            horizontal: 15,
          ),
        ),
        onDismissed: (direction) {
          ref.read(placesProvider.notifier).deletePlace(places[index].id);

          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Deleted place'),
              duration: Duration(seconds: 3),
            ),
          );
        },
        child: ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(places[index].image),
          ),
          title: Text(
            places[index].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          subtitle: Text(
            places[index].location.address,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => PlaceDetailsScreen(place: places[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
