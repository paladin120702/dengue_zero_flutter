import 'dart:convert';
import 'package:dengue_zero/utils/app_config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class LocationMaps {
  static const String _baseUrl = AppConfig.googleApi;
  static String generateLocationPreviewImage({
    double? latitude,
    double? longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$_baseUrl';
  }

  static Future<String> getAddressFrom(LatLng position) async {
    final String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$_baseUrl';
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
