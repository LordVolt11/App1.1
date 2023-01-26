// class WeatherMain {
//   double? temp;
//   double? feels_like;
//   double? temp_min;
//   double? temp_max;
//   int? humidity;
//   int? pressure;
//   int? sea_level;
//   int? grnd_level;

//   // double? feels_like;

//   WeatherMain({
//     this.temp,
//     this.feels_like,
//     this.temp_min,
//     this.temp_max,
//     this.humidity,
//     this.pressure,
//     this.sea_level,
//     this.grnd_level,
//     /*this.feels_like*/
//   });

//   // Funciton to parse JSON file into the model

//   WeatherMain.fromJson(Map<int, dynamic> json) {
//     temp = json['main']['temp'];
//     feels_like = json['main']['feels_like'];
//     temp_min = json['main']['temp_min'];
//     temp_max = json['main']['temp_max'];
//     humidity = json['main']['humidity'];
//     pressure = json['main']['pressure'];
//     sea_level = json['main']['sea_level'];
//     grnd_level = json['main']['grnd_level'];

//     // feels_like = double.parse(json['main']['feelslike'].toString());
//   }
// }
