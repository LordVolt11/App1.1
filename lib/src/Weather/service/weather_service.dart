// import 'dart:convert';
// import 'dart:html';
// import 'package:homepage/src/Weather/model/current_weather_data.dart';
// import 'package:http/http.dart' as http;

// class WeatherService {
//   // Future<CurrentWeatherData>? getCurrentWeather(
//   //     double? lat, double? lon) async {
//   //   var endpoint = Uri.parse(
//   //       "https://api.openweathermap.org/data/2.5/weather?lat=50&lon=50&appid=e4b5539432a7fcdfc3babb8dc0a53765");

//   //   var response = await http.get(endpoint);
//   //   var body = jsonDecode(response.body);
//   //   // print(CurrentWeatherData().fromJson(body).visibility);
//   //   return CurrentWeatherData.fromJson(body);
//   // }
//   double? lon;
//   double? lat;

//   String baseUrl = 'https://api.openweathermap.org/data/2.5';
//   String apiKey = 'appid=e4b5539432a7fcdfc3babb8dc0a53765';
//   WeatherService({this.lon, this.lat});

//   void getWeatherAqiData({
//     required Function() beforeSend,
//     required Function(dynamic currentAqiData) onSuccess,
//     required Function(dynamic error) onError,
//   }) {
//     final Url = '$baseUrl/weather?lat=$lat&lon=$lon&$apiKey';
//   }
// }
