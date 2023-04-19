import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:weather_forecast/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=5ea0a13fae5a47faa8a161337231904&q=$latitude,$longitude&aqi=no");

    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
