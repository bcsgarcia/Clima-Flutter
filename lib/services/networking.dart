import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final domain = 'api.openweathermap.org';
  final urlPath = '/data/2.5/weather';
  final String apiKey = '305712ce702fef5e05b05a11dc2a4337';

  Future<dynamic> getDataFromLatLon(double latitude, double longitude) async {
    Map<String, String> query = {
      'lat': '$latitude',
      'lon': '$longitude',
      'appid': '$apiKey',
      'units': 'metric'
    };

    return _get(query);
  }

  Future<dynamic> getDataFromCity(String city) async {
    Map<String, String> query = {
      'q': city,
      'appid': '$apiKey',
      'units': 'metric'
    };

    return _get(query);
  }

  Future<dynamic> _get(Map<String, String> query) async {
    http.Response response = await http.get(Uri.https(domain, urlPath, query));

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
