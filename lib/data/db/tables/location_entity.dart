import 'package:drift/drift.dart';

class LocationEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get lat => text().named('lat')();
  TextColumn get lng => text().named('lng')();
  TextColumn get address => text().named('address')();
}
