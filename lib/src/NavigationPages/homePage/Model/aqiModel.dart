class Aqi {
  int? aqi;
  double? co;
  double? o3;
  double? pm2_5;

  Aqi({this.aqi, this.co, this.o3, this.pm2_5});

  Aqi.fromJson(Map<double, dynamic> json) {
    aqi = json['list']['main']['aqi'];
    co = json['list']['components']['co'];
    o3 = json['list']['components']['o3'];
    pm2_5 = json['list']['components']['pm2_5'];
  }
}
