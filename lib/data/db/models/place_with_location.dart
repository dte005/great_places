import 'package:great_places/data/db/tables/location_entity.dart';
import 'package:great_places/data/db/tables/place_entity.dart';

class PlaceWithLocation {
  final PlaceEntity place;
  final LocationEntity location;

  PlaceWithLocation({required this.place, required this.location});
}
