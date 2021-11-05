import 'dart:convert';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:http/http.dart' as http;
import 'package:dogswelove/models/dog.dart';

Future<List<Dog>> fetchDogs() async {
  var isCacheExist = await APICacheManager().isAPICacheKeyExist("API_Dogs");

  if (!isCacheExist) {
    print("api");
    Uri dogsListAPIUrl =
        Uri.https('jsonblob.com', '/api/880188946124021760', {'q': '{http}'});
    final response = await http.get(dogsListAPIUrl);

    if (response.statusCode == 200) {
      APICacheDBModel cacheDBModel =
          APICacheDBModel(key: "API_Dogs", syncData: response.body);
      await APICacheManager().addCacheData(cacheDBModel);
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((dog) => Dog.fromJson(dog)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  } else {
    print("cache");
    var cacheData = await APICacheManager().getCacheData("API_Dogs");
    List data = json.decode(cacheData.syncData);
    return data.map((dog) => Dog.fromJson(dog)).toList();
  }
}
