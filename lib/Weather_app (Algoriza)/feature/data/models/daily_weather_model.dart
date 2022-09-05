import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/daily_weather.dart';

class DailyWeatherModel extends DailyWeather {
  DailyWeatherModel(
      {required double tempMin,
      required double tempMax,
      required int humidity,
      required int date,
      required String icon})
      : super(
            tempMin: tempMin,
            tempMax: tempMax,
            humidity: humidity,
            date: date,
            icon: icon);

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
      tempMin: json['temp']['min'].toDouble(),
      tempMax: json['temp']['max'].toDouble(),
      humidity: json['humidity'],
      date: json['dt'],
      icon: json['weather'][0]['icon'],
    );
  }
}
