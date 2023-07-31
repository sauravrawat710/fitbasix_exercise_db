import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'https://exercisedb.p.rapidapi.com/';
const String apiKey = '6ac1eb479amsh034ca15be14abbep166a94jsna80ac6e1ebaf';

class ExerciseService {
  static Future<dynamic> fetchAllExercises() async {
    final response = await http.get(
      Uri.parse('${baseUrl}exercises'),
      headers: {'X-RapidAPI-Key': apiKey},
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch exercises');
    }
  }

  static Future<Map<String, dynamic>> fetchExerciseById(String id) async {
    final response = await http.get(
      Uri.parse('${baseUrl}exercises/exercise/$id'),
      headers: {'X-RapidAPI-Key': apiKey},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch exercise details');
    }
  }
}
