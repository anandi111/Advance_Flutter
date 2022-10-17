import 'dart:convert';
import 'package:db_miner_2/models/animal_data.dart';
import 'package:http/http.dart' as http;

class AnimalAPIHelper {
  AnimalAPIHelper._();

  static final AnimalAPIHelper animalAPIHelper = AnimalAPIHelper._();

  Future<AnimalData?> fetchingUserData({required String name}) async {
    http.Response response = await http.get(
        Uri.parse("https://api.api-ninjas.com/v1/animals?name=$name"),
        headers: {'X-Api-Key': 'aiDw8vt6l6n27GVF9nevQBCvyM8T7ocC8QPYBiqZ'});

    // print(response.statusCode);

    if (response.statusCode == 200) {
      List decodedData = jsonDecode(response.body);

      Map passMap = decodedData[0];

      AnimalData animalData = AnimalData.fromMap(e: passMap);

      return animalData;
    }
    return null;
  }
}
