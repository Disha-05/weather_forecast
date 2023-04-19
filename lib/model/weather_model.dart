import 'dart:convert';

class Weather {
  var cityName;
  var temp;
  var wind;
  var humidity;
  var description;

  Weather(
      {required this.cityName,
      required this.temp,
      required this.wind,
      required this.humidity,
      required this.description});
  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["location"]["name"];
    temp = json["current"]["temp_c"];
    wind = json["current"]["wind_kph"];
    humidity = json["current"]["humidity"];
    description = json["current"]["condition"]["text"];
  }
}
