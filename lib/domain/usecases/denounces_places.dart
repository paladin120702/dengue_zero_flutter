import 'dart:io';
import 'dart:math';
import 'package:dengue_zero/data/services/google_maps/location_maps.dart';
import 'package:dengue_zero/domain/models/denounces.dart';
import 'package:dengue_zero/domain/models/place_location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DenouncesPlaces with ChangeNotifier {
  final List<Denounces> _items = [];

  List<Denounces> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Denounces itemByIndex(int index) {
    return _items[index];
  }

  Future<void> loadDenounces() async {
    notifyListeners();
  }

  Future<void> addDenounces(String title, File image, LatLng position) async {
    String address = await LocationMaps.getAddressFrom(position);
    final newDenounces = Denounces(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: PlaceLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
      ),
    );
    _items.add(newDenounces);
    notifyListeners();
  }
}
