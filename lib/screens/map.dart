import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fav_places/models/place.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      latitude: 37.422,
      longitude: -122.086,
      address: '',
    ),
    this.isSelectMode = true,
  });

  final PlaceLocation? location;
  final bool isSelectMode;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isSelectMode ? 'Pick your location' : 'Your location',
        ),
        actions: [
          if (widget.isSelectMode)
            IconButton(
              onPressed: () => Navigator.of(context).pop(_selectedLocation),
              icon: const Icon(Icons.save),
            ),
        ],
      ),
      body: GoogleMap(
        onTap: !widget.isSelectMode
            ? null
            : (position) {
                setState(() {
                  _selectedLocation = position;
                });
              },
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.location!.latitude, widget.location!.longitude),
          zoom: 16,
        ),
        markers: (_selectedLocation == null && widget.isSelectMode)
            ? {}
            : {
                Marker(
                  markerId: const MarkerId('m1'),
                  position:
                      _selectedLocation ??
                      LatLng(
                        widget.location!.latitude,
                        widget.location!.longitude,
                      ),
                ),
              },
      ),
    );
  }
}
