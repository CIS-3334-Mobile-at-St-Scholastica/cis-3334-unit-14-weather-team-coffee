import 'dart:convert';

List<Weather> userFromJson(String str) => List<Weather>.from(json.decode(str).map((x) => Weather.fromJson(x)));

String userToJson(List<Weather> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Weather {
  Weather({
    this.lat,
    this.lon,
    this.timezone,
    this.daily,

});

  int lat;
  int lon;
  String timezone;
  String daily;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    lat: json["lat"],
    lon: json["lon"],
    timezone: json["timezone"],
    daily: json["daily"],

  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
    "timezone": timezone,
    "daily": daily,

  };
}


