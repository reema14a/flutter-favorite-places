import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_fav_places/providers/places_provider.dart';
import 'package:flutter_fav_places/models/place.dart';
import 'package:flutter_fav_places/widgets/image_input.dart';
import 'package:flutter_fav_places/widgets/location_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _selectImage(File image) {
    _selectedImage = image;
  }

  void _selectLocation(PlaceLocation location) {
    _selectedLocation = location;
  }

  void _savePlace() {
    final enteredTitle = _titleController.text.trim();

    if (enteredTitle.isEmpty ||
        _selectedImage == null ||
        _selectedLocation == null) {
      return;
    }

    ref
        .read(placesProvider.notifier)
        .addPlace(
          enteredTitle,
          _selectedImage!,
          _selectedLocation!,
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new Place')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              maxLength: 50,
              controller: _titleController,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 10),
            ImageInput(onPickImage: _selectImage),
            const SizedBox(height: 10),
            LocationInput(onSelectLocation: _selectLocation),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
