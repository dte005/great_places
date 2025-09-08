import 'package:drift/drift.dart';
import 'package:great_places/data/db/database.dart';
import 'package:great_places/data/db/tables/location_entity.dart';

part 'location_dao.g.dart';

@DriftAccessor(tables: [LocationEntity])
class LocationDao extends DatabaseAccessor<AppDb> with _$LocationDaoMixin {
  LocationDao(AppDb db) : super(db);

  Future<int> insertLocation(LocationEntityCompanion location) =>
      into(locationEntity).insert(location);

  Future<List<LocationEntityData>> getAllLocations() =>
      select(locationEntity).get();
}
