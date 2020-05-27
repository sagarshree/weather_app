import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkingHelper {
  final String url;
  NetworkingHelper({this.url});

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      var weatherData = jsonDecode(data);

      return weatherData;
    } else {
      print('error:${response.statusCode}');
    }
  }
}
