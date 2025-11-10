import 'dart:io';
import 'package:dengue_zero/models/repositories/denounces/denounces_repository.dart';
import 'package:dengue_zero/models/repositories/denounces/denounces_repository_impl.dart';
import 'package:dengue_zero/models/services/firebase_storage/fb_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class NewComplaintViewModel extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  File? pickedImage;
  LatLng? pickedPosition;

  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;

  NewComplaintViewModel(DenouncesRepository read) {
    titleController.addListener(() {
      notifyListeners();
    });
  }

  void selectImage(File image) {
    pickedImage = image;
    notifyListeners();
  }

  void selectPosition(LatLng position) {
    pickedPosition = position;
    notifyListeners();
  }

  bool get isValidForm {
    return titleController.text.isNotEmpty &&
        pickedImage != null &&
        pickedPosition != null &&
        !_isSubmitting;
  }

  void resetForm() {
    titleController.clear();
    pickedImage = null;
    pickedPosition = null;
    notifyListeners();
  }

  Future<void> submitForm(BuildContext context) async {
    if (!isValidForm) return;

    _isSubmitting = true;
    notifyListeners();

    final imageUrl = await FbStorage.uploadToFirebase(pickedImage!);

    if (imageUrl == null) {
      debugPrint('Error: The image URL is null.');
      return;
    }

    try {
      await Provider.of<DenouncesRepositoryImpl>(context, listen: false)
          .createDenounces(
        title: titleController.text,
        imageUrl: imageUrl,
        latitude: pickedPosition!.latitude,
        longitude: pickedPosition!.longitude,
      );
      resetForm();
    } catch (e, stackTrace) {
      debugPrint('Error adding complaint: $e');
      debugPrintStack(label: 'Stack trace:', stackTrace: stackTrace);
    } finally {
      _isSubmitting = false;
      notifyListeners();
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }
}
