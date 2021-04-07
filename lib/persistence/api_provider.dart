import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:video_ventures_flluter/model/countries_model.dart';

class ApiProvider {
  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
  final _baseUrl = "http://159.89.233.116:3000/api/v1/countries";

  Future<CountriesModel> fetchCountries() async {
    print("request made --->");
    final response = await http.get(_baseUrl, headers: headers);
    print("response  --> " + response.toString());
    if (response.statusCode == 200) {
      return CountriesModel.fromJson(json.decode(response.body));
    } else {
      print("Error ");
      throw Exception("Failed to fetch countries");
    }
  }
}
