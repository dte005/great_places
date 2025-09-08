import 'package:drift/drift.dart';

import 'location_entity.dart';

class PlaceEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().named('title')();
  TextColumn get image => text().named('image')();
  IntColumn get locationId =>
      integer().references(LocationEntity, #id, onDelete: KeyAction.cascade)();
}
