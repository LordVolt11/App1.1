import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Model/aqiModel.dart';
import '../Model/weatherModel.dart';

class ApiClient {
  Future<String> getCurrentAqi(String? lat, String? lon) async {
    var endpoint = Uri.parse(
        // "https://nominatim.openstreetmap.org/search?q=Alipur,%20Delhi&format=json");
        "http://api.openweathermap.org/data/2.5/air_pollution?lat=50&lon=50&appid=e4b5539432a7fcdfc3babb8dc0a53765");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    // Aqi dataAqi = Aqi.fromJson(body);
    // print(Aqi.fromJson(body).pm2_5);
    print(body);

    return body['list'][0]['main']['aqi'].toString();
  }

  Future<Weather>? getCurrentWeather(String? lat, String? lon) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=50&lon=50&appid=e4b5539432a7fcdfc3babb8dc0a53765");
    // "https://api.openweathermap.org/pollution/v1/co/${lat},${lon}/current.json?appid=99e8cec141cdf5d93c7ed599ba439f2d");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    Weather weather = Weather.fromJson(body);
    print(Weather.fromJson(body).pressure);

    return Weather.fromJson(body);
  }
}
