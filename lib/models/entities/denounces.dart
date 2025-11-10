import 'dart:io';
import 'package:dengue_zero/models/entities/place_location.dart';

class Denounces {
  final String id;
  final String title;
  final PlaceLocation? location;
  final File? image;
  final String? imageUrl;

  Denounces({
    required this.id,
    required this.title,
    required this.location,
    this.image,
    this.imageUrl,
  });

  factory Denounces.fromJson(Map<String, dynamic> json) {
    return Denounces(
      id: json['id'].toString(),
      title: json['titulo'],
      imageUrl: json['imgUrl'],
      location: PlaceLocation(
        latitude: double.parse(json['latitude'].toString()),
        longitude: double.parse(json['longitude'].toString()),
      ),
    );
  }
}
