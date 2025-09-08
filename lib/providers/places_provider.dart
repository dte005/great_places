import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/data/db/daos/location_dao.dart';
import 'package:great_places/data/db/daos/place_dao.dart';
import 'package:great_places/data/db/database.dart';
import 'package:great_places/models/place.dart';

import '../models/location.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];
  PlaceDao placesDao;
  LocationDao locationDao;

  StreamSubscription<
    List<({PlaceEntityData place, LocationEntityData location})>
  >?
  _sub;

  int get itemsCount {
    return _items.length;
  }

  PlacesProvider({required this.placesDao, required this.locationDao}) {
    _attach();
  }

  Place _mapRowToEntity(PlaceEntityData p, LocationEntityData l) {
    final String idPStr = p.id.toString();
    final String idLStr = l.id.toString();
    return Place(
      id: idPStr,
      title: p.title,
      image: File(p.image),
      location: PlaceLocation(
        id: idLStr,
        lat: l.lat.toString(),
        lng: l.lng.toString(),
        address: l.address.toString(),
      ),
    );
  }

  void _attach() {
    _sub?.cancel();
    _sub = placesDao.watchAllWithLocation().listen((rows) {
      _items
        ..clear()
        ..addAll(
          rows.map((rec) {
            final p = rec.place;
            final l = rec.location;

            return _mapRowToEntity(p, l);
          }),
        );
      notifyListeners();
    });
  }

  void rebind(PlaceDao pDao, LocationDao lDao) {
    if (identical(placesDao, pDao) && identical(locationDao, lDao)) return;
    placesDao = pDao;
    locationDao = lDao;
    _attach();
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(
    String title,
    File image, [
    String? lat,
    String? lng,
    String? address,
  ]) async {
    await placesDao.attachedDatabase.transaction(() async {
      final lId = await locationDao.insertLocation(
        LocationEntityCompanion.insert(
          lat: lat ?? '',
          lng: lng ?? '',
          address: address ?? '',
        ),
      );

      await placesDao.insertPlace(
        PlaceEntityCompanion.insert(
          title: title,
          image: !image.existsSync() || image.path.isEmpty
              ? File('/path').path
              : image.path,
          locationId: lId,
        ),
      );
    });
  }

  void deletePlace(int placeId) async {
    await placesDao.deletePlace(placeId);
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
