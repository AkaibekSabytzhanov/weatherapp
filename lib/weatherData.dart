import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weatherapp/weatherModel.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? cityName) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=6d5830824237c279c652209909f5aee0&units=metric");
    var resposne = await http.get(endpoint);
    var body = jsonDecode(resposne.body);
    log('Response ====> $body');
    print(Weather.fromJson(body).cityName);

    return Weather.fromJson(body);
  }
}
