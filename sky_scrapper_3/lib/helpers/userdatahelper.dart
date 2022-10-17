import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sky_scrapper_3/models/userdata.dart';

class UserAPIHelper {
  UserAPIHelper._();

  static final UserAPIHelper userAPIHelper = UserAPIHelper._();

  Future<UserData?> fetchingUserData() async {
    http.Response response =
        await http.get(Uri.parse("https://randomuser.me/api/"));

    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);

      UserData userData = UserData.fromMap(e: decodedData);

      return userData;
    }
    return null;
  }
}
