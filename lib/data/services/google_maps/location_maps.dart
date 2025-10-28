import 'package:dengue_zero/utils/app_config.dart';

class LocationMaps {
  static const String _baseUrl = AppConfig.googleApi;
  static String generateLocationPreviewImage({
    double? latitude,
    double? longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$_baseUrl';
  }
}
