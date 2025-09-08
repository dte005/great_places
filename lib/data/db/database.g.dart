// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LocationEntityTable extends LocationEntity
    with TableInfo<$LocationEntityTable, LocationEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<String> lat = GeneratedColumn<String>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<String> lng = GeneratedColumn<String>(
    'lng',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, lat, lng, address];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'location_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocationEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationEntityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lat'],
      )!,
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lng'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
    );
  }

  @override
  $LocationEntityTable createAlias(String alias) {
    return $LocationEntityTable(attachedDatabase, alias);
  }
}

class LocationEntityData extends DataClass
    implements Insertable<LocationEntityData> {
  final int id;
  final String lat;
  final String lng;
  final String address;
  const LocationEntityData({
    required this.id,
    required this.lat,
    required this.lng,
    required this.address,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lat'] = Variable<String>(lat);
    map['lng'] = Variable<String>(lng);
    map['address'] = Variable<String>(address);
    return map;
  }

  LocationEntityCompanion toCompanion(bool nullToAbsent) {
    return LocationEntityCompanion(
      id: Value(id),
      lat: Value(lat),
      lng: Value(lng),
      address: Value(address),
    );
  }

  factory LocationEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationEntityData(
      id: serializer.fromJson<int>(json['id']),
      lat: serializer.fromJson<String>(json['lat']),
      lng: serializer.fromJson<String>(json['lng']),
      address: serializer.fromJson<String>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lat': serializer.toJson<String>(lat),
      'lng': serializer.toJson<String>(lng),
      'address': serializer.toJson<String>(address),
    };
  }

  LocationEntityData copyWith({
    int? id,
    String? lat,
    String? lng,
    String? address,
  }) => LocationEntityData(
    id: id ?? this.id,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    address: address ?? this.address,
  );
  LocationEntityData copyWithCompanion(LocationEntityCompanion data) {
    return LocationEntityData(
      id: data.id.present ? data.id.value : this.id,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      address: data.address.present ? data.address.value : this.address,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationEntityData(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, lat, lng, address);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationEntityData &&
          other.id == this.id &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.address == this.address);
}

class LocationEntityCompanion extends UpdateCompanion<LocationEntityData> {
  final Value<int> id;
  final Value<String> lat;
  final Value<String> lng;
  final Value<String> address;
  const LocationEntityCompanion({
    this.id = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.address = const Value.absent(),
  });
  LocationEntityCompanion.insert({
    this.id = const Value.absent(),
    required String lat,
    required String lng,
    required String address,
  }) : lat = Value(lat),
       lng = Value(lng),
       address = Value(address);
  static Insertable<LocationEntityData> custom({
    Expression<int>? id,
    Expression<String>? lat,
    Expression<String>? lng,
    Expression<String>? address,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (address != null) 'address': address,
    });
  }

  LocationEntityCompanion copyWith({
    Value<int>? id,
    Value<String>? lat,
    Value<String>? lng,
    Value<String>? address,
  }) {
    return LocationEntityCompanion(
      id: id ?? this.id,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      address: address ?? this.address,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lat.present) {
      map['lat'] = Variable<String>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<String>(lng.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationEntityCompanion(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }
}

class $PlaceEntityTable extends PlaceEntity
    with TableInfo<$PlaceEntityTable, PlaceEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaceEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationIdMeta = const VerificationMeta(
    'locationId',
  );
  @override
  late final GeneratedColumn<int> locationId = GeneratedColumn<int>(
    'location_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES location_entity (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, image, locationId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'place_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaceEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('location_id')) {
      context.handle(
        _locationIdMeta,
        locationId.isAcceptableOrUnknown(data['location_id']!, _locationIdMeta),
      );
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlaceEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaceEntityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      )!,
      locationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}location_id'],
      )!,
    );
  }

  @override
  $PlaceEntityTable createAlias(String alias) {
    return $PlaceEntityTable(attachedDatabase, alias);
  }
}

class PlaceEntityData extends DataClass implements Insertable<PlaceEntityData> {
  final int id;
  final String title;
  final String image;
  final int locationId;
  const PlaceEntityData({
    required this.id,
    required this.title,
    required this.image,
    required this.locationId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['image'] = Variable<String>(image);
    map['location_id'] = Variable<int>(locationId);
    return map;
  }

  PlaceEntityCompanion toCompanion(bool nullToAbsent) {
    return PlaceEntityCompanion(
      id: Value(id),
      title: Value(title),
      image: Value(image),
      locationId: Value(locationId),
    );
  }

  factory PlaceEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaceEntityData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      image: serializer.fromJson<String>(json['image']),
      locationId: serializer.fromJson<int>(json['locationId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'image': serializer.toJson<String>(image),
      'locationId': serializer.toJson<int>(locationId),
    };
  }

  PlaceEntityData copyWith({
    int? id,
    String? title,
    String? image,
    int? locationId,
  }) => PlaceEntityData(
    id: id ?? this.id,
    title: title ?? this.title,
    image: image ?? this.image,
    locationId: locationId ?? this.locationId,
  );
  PlaceEntityData copyWithCompanion(PlaceEntityCompanion data) {
    return PlaceEntityData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      image: data.image.present ? data.image.value : this.image,
      locationId: data.locationId.present
          ? data.locationId.value
          : this.locationId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaceEntityData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('locationId: $locationId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, image, locationId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaceEntityData &&
          other.id == this.id &&
          other.title == this.title &&
          other.image == this.image &&
          other.locationId == this.locationId);
}

class PlaceEntityCompanion extends UpdateCompanion<PlaceEntityData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> image;
  final Value<int> locationId;
  const PlaceEntityCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.image = const Value.absent(),
    this.locationId = const Value.absent(),
  });
  PlaceEntityCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String image,
    required int locationId,
  }) : title = Value(title),
       image = Value(image),
       locationId = Value(locationId);
  static Insertable<PlaceEntityData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? image,
    Expression<int>? locationId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (image != null) 'image': image,
      if (locationId != null) 'location_id': locationId,
    });
  }

  PlaceEntityCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? image,
    Value<int>? locationId,
  }) {
    return PlaceEntityCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      locationId: locationId ?? this.locationId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<int>(locationId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaceEntityCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('image: $image, ')
          ..write('locationId: $locationId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $LocationEntityTable locationEntity = $LocationEntityTable(this);
  late final $PlaceEntityTable placeEntity = $PlaceEntityTable(this);
  late final PlaceDao placeDao = PlaceDao(this as AppDb);
  late final LocationDao locationDao = LocationDao(this as AppDb);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    locationEntity,
    placeEntity,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'location_entity',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('place_entity', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$LocationEntityTableCreateCompanionBuilder =
    LocationEntityCompanion Function({
      Value<int> id,
      required String lat,
      required String lng,
      required String address,
    });
typedef $$LocationEntityTableUpdateCompanionBuilder =
    LocationEntityCompanion Function({
      Value<int> id,
      Value<String> lat,
      Value<String> lng,
      Value<String> address,
    });

final class $$LocationEntityTableReferences
    extends BaseReferences<_$AppDb, $LocationEntityTable, LocationEntityData> {
  $$LocationEntityTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$PlaceEntityTable, List<PlaceEntityData>>
  _placeEntityRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.placeEntity,
    aliasName: $_aliasNameGenerator(
      db.locationEntity.id,
      db.placeEntity.locationId,
    ),
  );

  $$PlaceEntityTableProcessedTableManager get placeEntityRefs {
    final manager = $$PlaceEntityTableTableManager(
      $_db,
      $_db.placeEntity,
    ).filter((f) => f.locationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_placeEntityRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LocationEntityTableFilterComposer
    extends Composer<_$AppDb, $LocationEntityTable> {
  $$LocationEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> placeEntityRefs(
    Expression<bool> Function($$PlaceEntityTableFilterComposer f) f,
  ) {
    final $$PlaceEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.placeEntity,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaceEntityTableFilterComposer(
            $db: $db,
            $table: $db.placeEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocationEntityTableOrderingComposer
    extends Composer<_$AppDb, $LocationEntityTable> {
  $$LocationEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocationEntityTableAnnotationComposer
    extends Composer<_$AppDb, $LocationEntityTable> {
  $$LocationEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<String> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  Expression<T> placeEntityRefs<T extends Object>(
    Expression<T> Function($$PlaceEntityTableAnnotationComposer a) f,
  ) {
    final $$PlaceEntityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.placeEntity,
      getReferencedColumn: (t) => t.locationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaceEntityTableAnnotationComposer(
            $db: $db,
            $table: $db.placeEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocationEntityTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $LocationEntityTable,
          LocationEntityData,
          $$LocationEntityTableFilterComposer,
          $$LocationEntityTableOrderingComposer,
          $$LocationEntityTableAnnotationComposer,
          $$LocationEntityTableCreateCompanionBuilder,
          $$LocationEntityTableUpdateCompanionBuilder,
          (LocationEntityData, $$LocationEntityTableReferences),
          LocationEntityData,
          PrefetchHooks Function({bool placeEntityRefs})
        > {
  $$LocationEntityTableTableManager(_$AppDb db, $LocationEntityTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocationEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocationEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocationEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> lat = const Value.absent(),
                Value<String> lng = const Value.absent(),
                Value<String> address = const Value.absent(),
              }) => LocationEntityCompanion(
                id: id,
                lat: lat,
                lng: lng,
                address: address,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String lat,
                required String lng,
                required String address,
              }) => LocationEntityCompanion.insert(
                id: id,
                lat: lat,
                lng: lng,
                address: address,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LocationEntityTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({placeEntityRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (placeEntityRefs) db.placeEntity],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (placeEntityRefs)
                    await $_getPrefetchedData<
                      LocationEntityData,
                      $LocationEntityTable,
                      PlaceEntityData
                    >(
                      currentTable: table,
                      referencedTable: $$LocationEntityTableReferences
                          ._placeEntityRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$LocationEntityTableReferences(
                            db,
                            table,
                            p0,
                          ).placeEntityRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.locationId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LocationEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $LocationEntityTable,
      LocationEntityData,
      $$LocationEntityTableFilterComposer,
      $$LocationEntityTableOrderingComposer,
      $$LocationEntityTableAnnotationComposer,
      $$LocationEntityTableCreateCompanionBuilder,
      $$LocationEntityTableUpdateCompanionBuilder,
      (LocationEntityData, $$LocationEntityTableReferences),
      LocationEntityData,
      PrefetchHooks Function({bool placeEntityRefs})
    >;
typedef $$PlaceEntityTableCreateCompanionBuilder =
    PlaceEntityCompanion Function({
      Value<int> id,
      required String title,
      required String image,
      required int locationId,
    });
typedef $$PlaceEntityTableUpdateCompanionBuilder =
    PlaceEntityCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> image,
      Value<int> locationId,
    });

final class $$PlaceEntityTableReferences
    extends BaseReferences<_$AppDb, $PlaceEntityTable, PlaceEntityData> {
  $$PlaceEntityTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LocationEntityTable _locationIdTable(_$AppDb db) =>
      db.locationEntity.createAlias(
        $_aliasNameGenerator(db.placeEntity.locationId, db.locationEntity.id),
      );

  $$LocationEntityTableProcessedTableManager get locationId {
    final $_column = $_itemColumn<int>('location_id')!;

    final manager = $$LocationEntityTableTableManager(
      $_db,
      $_db.locationEntity,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_locationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PlaceEntityTableFilterComposer
    extends Composer<_$AppDb, $PlaceEntityTable> {
  $$PlaceEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  $$LocationEntityTableFilterComposer get locationId {
    final $$LocationEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locationEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationEntityTableFilterComposer(
            $db: $db,
            $table: $db.locationEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlaceEntityTableOrderingComposer
    extends Composer<_$AppDb, $PlaceEntityTable> {
  $$PlaceEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  $$LocationEntityTableOrderingComposer get locationId {
    final $$LocationEntityTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locationEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationEntityTableOrderingComposer(
            $db: $db,
            $table: $db.locationEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlaceEntityTableAnnotationComposer
    extends Composer<_$AppDb, $PlaceEntityTable> {
  $$PlaceEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  $$LocationEntityTableAnnotationComposer get locationId {
    final $$LocationEntityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.locationId,
      referencedTable: $db.locationEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocationEntityTableAnnotationComposer(
            $db: $db,
            $table: $db.locationEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlaceEntityTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $PlaceEntityTable,
          PlaceEntityData,
          $$PlaceEntityTableFilterComposer,
          $$PlaceEntityTableOrderingComposer,
          $$PlaceEntityTableAnnotationComposer,
          $$PlaceEntityTableCreateCompanionBuilder,
          $$PlaceEntityTableUpdateCompanionBuilder,
          (PlaceEntityData, $$PlaceEntityTableReferences),
          PlaceEntityData,
          PrefetchHooks Function({bool locationId})
        > {
  $$PlaceEntityTableTableManager(_$AppDb db, $PlaceEntityTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlaceEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlaceEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlaceEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<int> locationId = const Value.absent(),
              }) => PlaceEntityCompanion(
                id: id,
                title: title,
                image: image,
                locationId: locationId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String image,
                required int locationId,
              }) => PlaceEntityCompanion.insert(
                id: id,
                title: title,
                image: image,
                locationId: locationId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlaceEntityTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({locationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (locationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.locationId,
                                referencedTable: $$PlaceEntityTableReferences
                                    ._locationIdTable(db),
                                referencedColumn: $$PlaceEntityTableReferences
                                    ._locationIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PlaceEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $PlaceEntityTable,
      PlaceEntityData,
      $$PlaceEntityTableFilterComposer,
      $$PlaceEntityTableOrderingComposer,
      $$PlaceEntityTableAnnotationComposer,
      $$PlaceEntityTableCreateCompanionBuilder,
      $$PlaceEntityTableUpdateCompanionBuilder,
      (PlaceEntityData, $$PlaceEntityTableReferences),
      PlaceEntityData,
      PrefetchHooks Function({bool locationId})
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$LocationEntityTableTableManager get locationEntity =>
      $$LocationEntityTableTableManager(_db, _db.locationEntity);
  $$PlaceEntityTableTableManager get placeEntity =>
      $$PlaceEntityTableTableManager(_db, _db.placeEntity);
}
