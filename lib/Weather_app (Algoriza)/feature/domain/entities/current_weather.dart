import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class CurrentWeather extends Equatable {
  final String cityName;
  final String country;
  final num temperature;
  final String weatherDescription;
  final num feelsLikeTemperature;
  final num maxTemperature;
  final num minTemperature;
  final num humidity;
  final num pressure;
  final num sunrise;
  final num sunset;
  final num speed;
  final String weatherIcon;


  const CurrentWeather({
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.weatherDescription,
    required this.feelsLikeTemperature,
    required this.humidity,
    required this.pressure,
    required this.weatherIcon,
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
    minTemperature,
    weatherIcon
  ];
}