// ignore_for_file: file_names

import 'dart:convert';
import 'package:weather_app/weatherModel.dart';
import 'package:http/http.dart' as http;

class WeatherData {
  // ignore: non_constant_identifier_names
  Future<weather> getData(var Latitude, var Longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=1234736793a94ed9a25131131221511&q=$Latitude,$Longitude&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return weather.fromJson(body);
  }
}
