import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_fav_places/providers/places_provider.dart';
import 'package:flutter_fav_places/widgets/new_place.dart';
import 'package:flutter_fav_places/widgets/place_details.dart';

class PlacesList extends ConsumerWidget {
  const PlacesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(placesProvider);

    Widget mainContent = const Center(
      child: Text(
        'No places found. Start adding some!',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );

    if (places.isNotEmpty) {
      mainContent = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
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
                  ref
                      .read(placesProvider.notifier)
                      .deletePlace(places[index].id);

                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Deleted place'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                },
                child: ListTile(
                  title: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) =>
                              PlaceDetails(placeId: places[index].id),
                        ),
                      );
                    },
                    child: Text(places[index].title),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Great Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const NewPlace(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: mainContent,
    );
  }
}
