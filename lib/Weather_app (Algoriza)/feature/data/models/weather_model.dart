

import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/current_weather.dart';

class WeatherModel extends CurrentWeather {
  const WeatherModel({required String cityName, required String country, required double temperature, required String weatherDescription, required double feelsLikeTemperature, required int humidity, required int pressure, required int sunrise, required int sunset, required double speed, required double maxTemperature, required double minTemperature}) : super(cityName: cityName, country: country, temperature: temperature, weatherDescription: weatherDescription, feelsLikeTemperature: feelsLikeTemperature, humidity: humidity, pressure: pressure, sunrise: sunrise, sunset: sunset, speed: speed, maxTemperature: maxTemperature, minTemperature: minTemperature);
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      country: json['sys']['country'],
      temperature: json['main']['temp'].toDouble(),
      weatherDescription: json['weather'][0]['description'],
      feelsLikeTemperature: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      speed: json['wind']['speed'],
      maxTemperature: json['main']['temp_max'],
      minTemperature: json['main']['temp_min'],
    );
  }
}
