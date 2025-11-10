import 'dart:convert';
import 'package:dengue_zero/models/repositories/auth/auth_repository.dart';
import 'package:dengue_zero/models/repositories/denounces/denounces_repository.dart';
import 'package:dengue_zero/models/entities/denounces.dart';
import 'package:dengue_zero/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DenouncesRepositoryImpl
    with ChangeNotifier
    implements DenouncesRepository {
  final AuthRepository auth;
  DenouncesRepositoryImpl({required this.auth});

  @override
  Future<Map<String, dynamic>> createDenounces({
    required String title,
    required String imageUrl,
    required double latitude,
    required double longitude,
  }) async {
    final token = auth.token;
    final url = Uri.parse('${AppConfig.backendUrl}/denounces');

    final body = {
      'titulo': title,
      'imgUrl': imageUrl,
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
    };

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isNotEmpty || response.body.trim().length < 2) {
        return {};
      }
      try {
        return jsonDecode(response.body);
      } catch (e) {
        debugPrint(
            'FATAL ERROR parsing JSON in the complaint response. Body: ${response.body}');
        return {};
      }
    } else {
      throw Exception('Error creating complaint: ${response.statusCode}');
    }
  }

  @override
  Future<List<Denounces>> fetchDenounces() async {
    final token = auth.token;
    final url = Uri.parse('${AppConfig.backendUrl}/denounces/user');

    final response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => Denounces.fromJson(json)).toList();
    } else {
      throw Exception('Error loading data: ${response.statusCode}');
    }
  }
}
