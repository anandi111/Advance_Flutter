import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sky_scrapper_1/models/carrdata.dart';

class CarrAPIHelper {
  CarrAPIHelper._();

  static final CarrAPIHelper currAPIHelper = CarrAPIHelper._();

  Future<CurrData?> fetchingUserData(
      {required String From, required String To}) async {
    http.Response response = await http.get(Uri.parse(
        "https://www.amdoren.com/api/currency.php?api_key=tSiNF3weUYf79AMbQS78Vgd34gehSu&from=$From&to=$To"));

    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);

      CurrData currData = CurrData(
          data: decodedData["amount"], error: decodedData["error_message"]);

      return currData;
    }
    return null;
  }
}
