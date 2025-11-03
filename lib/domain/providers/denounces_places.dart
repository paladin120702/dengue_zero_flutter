import 'dart:io';
import 'package:dengue_zero/data/repositories/denounces/denounces_repository.dart';
import 'package:dengue_zero/data/services/firebase_storage/fb_storage.dart';
import 'package:dengue_zero/domain/entities/denounces.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DenouncesPlaces with ChangeNotifier {
  final DenouncesRepository denouncesRepository;

  DenouncesPlaces({
    required this.denouncesRepository,
  });

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
    final imageUrl = await FbStorage.uploadToFirebase(image);

    if (imageUrl == null) {
      debugPrint('Erro: a URL da imagem é nula');
      return;
    }

    try {
      await denouncesRepository.createDenounces(
        title: title,
        imageUrl: imageUrl,
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e, stackTrace) {
      debugPrint('Erro: $e');
      debugPrintStack(label: 'Stack trace:', stackTrace: stackTrace);
    }
    notifyListeners();
  }
}
