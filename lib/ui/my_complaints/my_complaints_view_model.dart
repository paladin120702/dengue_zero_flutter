import 'package:dengue_zero/models/repositories/denounces/denounces_repository.dart';
import 'package:dengue_zero/models/entities/denounces.dart';
import 'package:flutter/material.dart';

class MyComplaintsViewModel with ChangeNotifier {
  final DenouncesRepository _repository;
  MyComplaintsViewModel(this._repository);

  final List<Denounces> _items = [];

  List<Denounces> get items {
    return [..._items];
  }

  Denounces itemByIndex(int index) {
    return _items[index];
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadDenounces() async {
    _isLoading = true;
    notifyListeners();

    try {
      final fetched = await _repository.fetchDenounces();
      _items.clear();
      _items.addAll(fetched);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading reports: $e');
    }
  }
}
