import 'package:get/get.dart';
// import 'package:homepage/src/AQI/service/aqi_service.dart';
// import 'package:homepage/src/Weather/service/weather_service.dart';

class HomeController extends GetxController {
  String? city;
  // String searchText;

  HomeController({this.city});

  @override
  void onInit() {
    initState();
    super.onInit();
  }

  void initState() {
    // AQIService();
    // WeatherService();
  }
}
