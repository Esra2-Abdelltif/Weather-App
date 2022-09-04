import 'package:equatable/equatable.dart';

class CurrentWeather extends Equatable {
  final String cityName;
  final String country;
  final double temperature;
  final String weatherDescription;
  final double feelsLikeTemperature;
  final double maxTemperature;
  final double minTemperature;
  final int humidity;
  final int pressure;
  final int sunrise;
  final int sunset;
  final double speed;


  const CurrentWeather({
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.weatherDescription,
    required this.feelsLikeTemperature,
    required this.humidity,
    required this.pressure,
    required this.sunrise,
    required this.sunset,
    required this.speed,
    required this.maxTemperature,
    required this.minTemperature
  });

  @override
  List<Object> get props => [
    cityName,
    country,
    temperature,
    weatherDescription,
    feelsLikeTemperature,
    humidity,
    pressure,
    sunrise,
    sunset,
    speed,
    maxTemperature,
    minTemperature
  ];
}