class PlaceLocation {
  final String id;
  final String lat;
  final String lng;
  final String address;
  const PlaceLocation({
    this.id = '',
    required this.lat,
    required this.lng,
    this.address = '',
  });
}
