import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FbStorage {
  static Future<String?> uploadToFirebase(File imageFile) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('images/img-${DateTime.now().toString()}.jpg');
    await ref.putFile(imageFile);
    final downloadUrl = await ref.getDownloadURL();
    return downloadUrl;
  }
}
