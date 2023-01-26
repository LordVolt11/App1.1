// import 'dart:convert';
// import 'dart:html';
// import 'package:homepage/src/Weather/model/current_weather_data.dart';
// import 'package:http/http.dart' as http;

// import '../model/current_aqi_data.dart';

// class AQIService {
//   Future<CurrentAqiData>? getCurrentAqi(double? lat, double? lon) async {
//     var endpoint = Uri.parse(
//         "http://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$lon&appid=e4b5539432a7fcdfc3babb8dc0a53765");

//     var response = await http.get(endpoint);
//     var body = jsonDecode(response.body);
//     // print(CurrentWeatherData().fromJson(body));
//     return CurrentAqiData.fromJson(body);
//   }
//   // double? lon;
//   // double? lat;

//   // String baseUrl = 'https://api.openweathermap.org/data/2.5';
//   // String apiKey = 'appid=e4b5539432a7fcdfc3babb8dc0a53765';
//   // AQIService({this.lon, this.lat});

//   // void getAqiData({
//   //   required Function() beforeSend,
//   //   required Function(dynamic currentAqiData) onSuccess,
//   //   required Function(dynamic error) onError,
//   // }) {
//   //   final Url = '$baseUrl/air_pollution?lat=$lat&lon=$lon&$apiKey';
//   // }
// }
