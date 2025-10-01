import 'package:dengue_zero/domain/models/denounces.dart';
import 'package:flutter/material.dart';

class DenouncesPlaces with ChangeNotifier {
  List<Denounces> _items = [];

  List<Denounces> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Denounces itemByIndex(int index) {
    return _items[index];
  }
}
