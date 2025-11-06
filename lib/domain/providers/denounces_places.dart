import 'dart:io';
import 'package:dengue_zero/data/repositories/denounces/denounces_repository.dart';
import 'package:dengue_zero/data/services/firebase_storage/fb_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DenouncesPlaces with ChangeNotifier {
  final DenouncesRepository denouncesRepository;

  DenouncesPlaces({
    required this.denouncesRepository,
  });

  Future<void> addDenounces(String title, File image, LatLng position) async {
    final imageUrl = await FbStorage.uploadToFirebase(image);

    if (imageUrl == null) {
      debugPrint('Error: The image URL is null.');
      return;
    }

    await denouncesRepository.createDenounces(
      title: title,
      imageUrl: imageUrl,
      latitude: position.latitude,
      longitude: position.longitude,
    );
    notifyListeners();
  }
}
