import 'dart:convert';
import 'package:http/http.dart' as http;
import 'blood.dart';

//Read (CRUD)
Future<List<Blood>> fetchBloodData() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/data'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    // Print the response for debugging
    print(jsonResponse);
    return jsonResponse.map((data) => Blood.fromJson(data)).toList();
  } else {
    // Print the error response for debugging
    print('Failed to load blood data: ');
    throw Exception('Failed to load blood data');
  }
}

//Create (CRUD)
Future<void> addBloodData(String name, String phone, String bloodGroup) async {
  // Construct the URL with query parameters
  final response = await http.get(
    Uri.parse('http://127.0.0.1:8000/api/add?name=$name&phone=$phone&blood=$bloodGroup'),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to add donor: ${response.body}');
  }
}