import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dogswelove/models/dog.dart';

Future<List<Dog>> fetchDogs() async {
  Uri dogsListAPIUrl = Uri.https(
      'https://jsonblob.com', '/api/880188946124021760', {'q': '{http}'});
  final response = await http.get(dogsListAPIUrl);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => new Dog.fromJson(job)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}
