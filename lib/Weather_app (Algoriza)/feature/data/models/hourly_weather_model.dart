import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/hourly_weather.dart';

class HourlyWeatherModel extends HourlyWeather {
  HourlyWeatherModel(
      {required String icon,
      required num time,
      required num temperature,
      required num humidity})
      : super(
            icon: icon,
            time: time,
            temperature: temperature,
            humidity: humidity);

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherModel(
      icon: json['weather'][0]['icon'],
      time: json['dt'],
      temperature: json['temp'].toDouble(),
      humidity: json['humidity'].toDouble(),
    );
  }
}
