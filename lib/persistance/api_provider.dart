
import 'dart:convert';

import 'package:appramadan/model/main_model.dart';
import 'package:http/http.dart';

class ApiProvider{
  Client client = Client();
  final baseUrl = "https://api.pray.zone/v2/times/day.json";

  Future<MainModel> fetchPrayTime({String city, String date}) async {
    final path = "$baseUrl?city=$city&date=$date";
    final response = await client.get(path);

    if(response.statusCode == 200){
      return MainModel.parseJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

}