import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid();

class Place {
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;

  Place({
    required this.title,
    required this.image,
    required this.location,
  }) : id = uuid.v4();
}

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  String get locationImage {
    final lat = latitude;
    final lng = longitude;

    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$lat,$lng&key=AIzaSyDklLIV7vU9K_MGsZPDZE9UVabse8Pcq14';
  }
}
