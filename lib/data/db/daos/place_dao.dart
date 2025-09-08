import 'package:drift/drift.dart';
import 'package:great_places/data/db/database.dart';

import '../tables/location_entity.dart';
import '../tables/place_entity.dart';

part 'place_dao.g.dart';

@DriftAccessor(tables: [PlaceEntity, LocationEntity])
class PlaceDao extends DatabaseAccessor<AppDb> with _$PlaceDaoMixin {
  PlaceDao(AppDb db) : super(db);

  Future<int> insertPlace(PlaceEntityCompanion place) =>
      into(placeEntity).insert(place);

  Future<int> deletePlace(int id) =>
      (delete(placeEntity)..where((p) => p.id.equals(id))).go();

  Stream<List<PlaceEntityData>> watchAllPlaces() => select(placeEntity).watch();

  Stream<List<({PlaceEntityData place, LocationEntityData location})>>
  watchAllWithLocation() {
    final placeLocation = select(placeEntity).join([
      innerJoin(
        locationEntity,
        locationEntity.id.equalsExp(placeEntity.locationId),
      ),
    ]);
    return placeLocation.watch().map(
      (rows) => rows
          .map(
            (r) => (
              place: r.readTable(placeEntity),
              location: r.readTable(locationEntity),
            ),
          )
          .toList(),
    );
  }
}
