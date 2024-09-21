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
    print('Failed to load blood data: ${response.body}');
    throw Exception('Failed to load blood data');
  }
}

//Create (CRUD)
Future<void> addBloodData(String name, String phone, String blood) async {
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8000/api/add'), // Replace with your actual URL
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'name': name, 'phone': phone, 'blood': blood}),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    print('Blood data added successfully!');
  } else {
    // Log the error response for debugging
    print('Failed to add blood data: ${response.statusCode}');
    print('Response body:');  // This will show why the request failed
    throw Exception('Failed to add blood data:');
  }
}