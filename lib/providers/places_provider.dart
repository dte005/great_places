import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  String _generateToken() {
    const List<String> chars = [
      'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      'abcdefghijklmnopqrstuvwxyz',
      '0123456789',
      '!@#\$%ˆ&*()_+',
    ];
    final rand = Random.secure();
    return List.generate(
      24,
      (_) => chars[rand.nextInt(chars.length)][rand.nextInt(chars.length)],
    ).join();
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: _generateToken(),
      title: title,
      image: image,
      location: PlaceLocation(lat: '0', lng: '0'),
    );
    _items.add(newPlace);
    notifyListeners();
  }
}
