import 'package:clima/auth/secrets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.lat, this.long});

  final double lat;
  final double long;

  Future<Map> getData() async {
    Uri uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': '$lat',
      'lon': '$long',
      'appid': '$mySecretKey',
      'units': 'metric'
    });
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }

  Future<Map> getDataSearch(cityName) async {
    Uri uri = Uri.https('api.openweathermap.org', '/data/2.5/weather',
        {'q': '$cityName', 'appid': '$mySecretKey', 'units': 'metric'});
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
