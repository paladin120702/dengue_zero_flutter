abstract class DenouncesRepository {
  Future<Map<String, dynamic>> createDenounces({
    required String title,
    required String imageUrl,
    required double latitude,
    required double longitude,
  });
  Future<List<Map<String, dynamic>>> fetchDenounces();
}
