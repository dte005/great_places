import 'dart:io';

class PlaceLocation {
  final String lat;
  final String lng;
  final String? address;
  const PlaceLocation({required this.lat, required this.lng, this.address});
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  const Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
