import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/location.dart';

class MapLocation extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadyOnly;
  const MapLocation({
    super.key,
    this.initialLocation = const PlaceLocation(
      lat: '-22.9035',
      lng: '-43.2096',
    ),
    this.isReadyOnly = false,
  });
  @override
  State<MapLocation> createState() => _MapLocation();
}

class _MapLocation extends State<MapLocation> {
  LatLng _pickedPosition = const LatLng(0, 0);
  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione no mapa'),
        actions: [
          if (!widget.isReadyOnly)
            IconButton(
              onPressed: () => Navigator.of(context).pop(_pickedPosition),
              icon: Icon(Icons.check),
            ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            double.parse(widget.initialLocation.lat),
            double.parse(widget.initialLocation.lng),
          ),
          zoom: 13,
        ),
        onTap: widget.isReadyOnly ? null : _selectPosition,
        markers: {Marker(markerId: MarkerId('p1'), position: _pickedPosition)},
      ),
    );
  }
}
