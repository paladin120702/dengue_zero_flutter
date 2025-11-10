import 'package:dengue_zero/models/services/google_maps/location_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationInput extends StatelessWidget {
  final LatLng? location;
  final Future<void> Function(LatLng position) onSelectPosition;

  const LocationInput({
    super.key,
    required this.location,
    required this.onSelectPosition,
  });

  Future<void> _getCurrentUserLocation(BuildContext context) async {
    final locData = await Location().getLocation();

    if (locData.latitude == null || locData.longitude == null) {
      return;
    }

    final selectedPosition = LatLng(locData.latitude!, locData.longitude!);
    await onSelectPosition(selectedPosition);
  }

  String? get previewImageUrl {
    if (location == null) return null;
    return LocationMaps.generateLocationPreviewImage(
      latitude: location!.latitude,
      longitude: location!.longitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: previewImageUrl == null
              ? const Text('Nenhuma localização!')
              : Image.network(
                  previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        TextButton.icon(
          onPressed: () => _getCurrentUserLocation(context),
          label: const Text('Localização Atual'),
          icon: const Icon(Icons.location_on),
        ),
      ],
    );
  }
}
