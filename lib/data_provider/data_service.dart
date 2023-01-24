import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travelapp/model/data_model.dart';

class dataservice {
  final baseUrl = "http://192.168.137.1:8000/api";

  Future<List<DataModel>> getinfo() async {
    var apiurl = "/getplaces";
    try {
      http.Response res = await http.get(Uri.parse(baseUrl + apiurl));
      print(res);
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print("ERR");
      print(e.toString());
      return <DataModel>[];
    }
  }
}
