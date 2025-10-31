import 'package:dengue_zero/domain/models/denounces.dart';
import 'package:dengue_zero/domain/usecases/denounces_places.dart';
import 'package:flutter/material.dart';

class MyComplaintsViewModel with ChangeNotifier {
  final DenouncesPlaces _model;
  MyComplaintsViewModel(this._model);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Denounces> get items => _model.items;
  int get itemsCount => _model.itemsCount;

  Denounces itemByIndex(int index) => _model.itemByIndex(index);

  Future<void> loadDenounces() async {
    _isLoading = true;
    notifyListeners();

    await _model.loadDenounces(); // chama o método do Model

    _isLoading = false;
    notifyListeners();
  }
}
