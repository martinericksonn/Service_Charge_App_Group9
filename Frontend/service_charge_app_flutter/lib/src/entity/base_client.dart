import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'http://localhost:8080';

class BaseClient {
  var client = http.Client();

   get(String api) async {
    try {
      var url = Uri.parse(baseUrl + api);
      var response = await http.get(
        url,
      );
  
      if (response.statusCode == 200) {
        return response.body;
      } else {
        //throw exception and catch it in UI
      }
    } catch (e) {
      print(e);
    }
  }
}
