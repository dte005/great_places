import 'package:great_places/data/db/daos/location_dao.dart';
import 'package:great_places/data/db/daos/place_dao.dart';

class PlaceRepository {
  final PlaceDao placeDao;
  final LocationDao locationDao;

  PlaceRepository({required this.placeDao, required this.locationDao});

  Future<void> addPlaceWithLocation({
    required String placeName,
    required String lat,
    required String lng,
    required String address,
  }) async {
    print('dao');
  }
}
