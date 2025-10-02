import 'dart:io';
import 'dart:math';
import 'package:dengue_zero/domain/models/denounces.dart';
import 'package:flutter/material.dart';

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

  void addDenounces(String title, File image) {
    final newDenounces = Denounces(
      id: Random().nextDouble().toString(),
      title: title,
      location: null,
      image: image,
    );
    _items.add(newDenounces);
    notifyListeners();
  }
}
