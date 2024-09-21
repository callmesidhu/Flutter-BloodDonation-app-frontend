import 'dart:convert';
import 'package:http/http.dart' as http;
import 'blood.dart';

Future<List<Blood>> fetchBloodData() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/data'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    // Print the response for debugging
    print(jsonResponse);
    return jsonResponse.map((data) => Blood.fromJson(data)).toList();
  } else {
    // Print the error response for debugging
    print('Failed to load blood data: ${response.body}');
    throw Exception('Failed to load blood data');
  }
}

