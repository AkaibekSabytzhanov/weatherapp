import 'package:flutter/cupertino.dart';

class Weather {
  
  String? cityName;
  double? temp;
  num? wind;
  int? humidity;

  Weather({
   
    this.cityName,
    this.humidity,
    this.temp,
    this.wind,
  });
 Weather.fromJson(Map<String, dynamic> json) {
   
    cityName = json['name'];
    temp = json['main']['temp'];
    wind = json['wind']['speed'];
    humidity = json['main']['humidity'];
  }
}
