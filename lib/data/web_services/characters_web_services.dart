import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_flutter/constants/strings.dart';

// This service is responsible for fetching data from API
class CharactersWebServices {
  // Dio instance to handle all API requests
  late Dio dio;

  CharactersWebServices() {
    // Base options for Dio (base URL, timeouts, etc.)
    final BaseOptions options = BaseOptions(
      baseUrl: ConstantStrings.baseUrl, // Base URL for the API
      receiveDataWhenStatusError: true, // Get data even when status is error
      connectTimeout: const Duration(seconds: 60), // Connection timeout
      receiveTimeout: const Duration(seconds: 60), // Response timeout
    );

    // Initialize Dio with the given options
    dio = Dio(options);
  }

  // Fetch all characters from API
  Future<List<dynamic>> getAllCharacters() async {
    try {
      // GET request to /character endpoint
      Response response = await dio.get('character');

      // Return the results list (API specific: "results" contains characters)
      return response.data['results'];
    } catch (e) {
      // In case of error, return empty list
      debugPrint("Error: $e");
      return [];
    }
  }
}
