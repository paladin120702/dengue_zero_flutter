import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatelessWidget {
  final File? image;
  final Future<void> Function(File image) onSelectImage;

  const ImageInput({
    super.key,
    required this.image,
    required this.onSelectImage,
  });

  Future<void> _takePicture(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (pickedFile == null) return;

    final File imageFile = File(pickedFile.path);
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');

    await onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: image != null
              ? Image.file(
                  image!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : const Text('Nenhuma imagem!'),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            onPressed: () => _takePicture(context),
            label: const Text('Tirar Foto'),
            icon: const Icon(Icons.camera_alt),
          ),
        ),
      ],
    );
  }
}
