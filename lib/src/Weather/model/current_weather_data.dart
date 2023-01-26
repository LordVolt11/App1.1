// import 'package:homepage/src/AQI/model/coord.dart';
// import 'package:homepage/src/Weather/model/Sys.dart';
// import 'package:homepage/src/Weather/model/base.dart';
// import 'package:homepage/src/Weather/model/city_name.dart';
// import 'package:homepage/src/Weather/model/clouds.dart';
// import 'package:homepage/src/Weather/model/dt.dart';
// import 'package:homepage/src/Weather/model/main_weather.dart';
// import 'package:homepage/src/Weather/model/time_zone.dart';
// import 'package:homepage/src/Weather/model/visibility.dart';
// import 'package:homepage/src/Weather/model/weather.dart';
// import 'package:homepage/src/Weather/model/wind.dart';

// class CurrentWeatherData {
//   Coord? coord;
//   WeatherMain? weatherMain;
//   Base? base;
//   Weather? weather;
//   Visibility? visibility;
//   Wind? wind;
//   Clouds? clouds;
//   Dt? dt;
//   Sys? sys;
//   CityName? cityName;
//   TimeAndDate? timeAndDate;

//   CurrentWeatherData(
//       {this.coord,
//       this.weatherMain,
//       this.base,
//       this.weather,
//       this.visibility,
//       this.wind,
//       this.clouds,
//       this.dt,
//       this.sys,
//       this.cityName,
//       this.timeAndDate});

//   CurrentWeatherData.fromJson(Map<String, dynamic> json) {
//     coord = Coord.fromJson(json['coord']);
//     weatherMain = WeatherMain.fromJson(json['weatherMain']);
//     base = Base.fromJson(json['base']);
//     weather = Weather.fromJson(json['weather']);
//     visibility = Visibility.fromJson(json['visibility']);
//     wind = Wind.fronJson(json['wind']);
//     clouds = Clouds.fromJson(json['clouds']);
//     dt = Dt.fromJson(json['dt']);
//     sys = Sys.fromJson(json['sys']);
//     cityName = CityName.fromJson(json['cityName']);
//     timeAndDate = TimeAndDate.fromJson(json['timeAndDate']);
//   }

//   Object? fromJson(body) {}
// }
