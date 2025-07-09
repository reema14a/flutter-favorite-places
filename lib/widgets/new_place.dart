import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_fav_places/providers/places_provider.dart';

class NewPlace extends ConsumerWidget {
  const NewPlace({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Add a new place')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              maxLength: 50,
              controller: titleController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextButton(
              onPressed: () {
                ref
                    .read(placesProvider.notifier)
                    .addPlace(titleController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Add Location'),
            ),
          ],
        ),
      ),
    );
  }
}
