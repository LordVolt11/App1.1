class Weather {
  String? country;
  String? city;
  String? area;
  double? temp;
  double? wind;
  int? humidity;
  int? pressure;

  Weather(
      {this.temp,
      this.area,
      this.country,
      this.city,
      this.wind,
      this.humidity,
      this.pressure});

  // Funciton to parse JSON file into the model

  Weather.fromJson(Map<String, dynamic> json) {
    // cityName = json['name'];
    city = json['name'];
    country = json['sys']['country'];
    temp = json['main']['temp'];
    wind = json['wind']['speed'];
    humidity = json['main']['humidity'];
    pressure = json['main']['pressure'];
  }
}
