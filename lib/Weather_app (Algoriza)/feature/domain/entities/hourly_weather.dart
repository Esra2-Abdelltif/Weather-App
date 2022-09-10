import 'package:equatable/equatable.dart';

class HourlyWeather extends Equatable {
  String icon;
  num time;
  num temperature;
  num humidity;

  HourlyWeather({
    required this.icon,
    required this.time,
    required this.temperature,
    required this.humidity
  });

  @override
  List<Object> get props => [icon, time, temperature, humidity];
}
