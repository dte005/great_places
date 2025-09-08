import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:great_places/data/db/tables/place_entity.dart';
import 'package:path_provider/path_provider.dart';

import 'daos/location_dao.dart';
import 'daos/place_dao.dart';
import 'tables/location_entity.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [PlaceEntity, LocationEntity],
  daos: [PlaceDao, LocationDao],
)
class AppDb extends _$AppDb {
  AppDb([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await _seed(this);
    },
    onUpgrade: (m, from, to) async {},
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'great_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  Future<void> _seed(AppDb db) async {
    final rjId = await db
        .into(db.locationEntity)
        .insert(
          LocationEntityCompanion.insert(
            lat: '-22.9183917',
            lng: '-43.2499096',
            address: 'Rua teodoro da silva, 796',
          ),
        );

    await db
        .into(db.placeEntity)
        .insert(
          PlaceEntityCompanion.insert(
            title: "Vila Isabel",
            image: "/path",
            locationId: rjId,
          ),
        );
  }
}
