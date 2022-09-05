
import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class GetCurrentWeatherEvent extends WeatherEvent {}

class GetCurrentWeatherByCityEvent extends WeatherEvent {
  final String city;
  const GetCurrentWeatherByCityEvent(this.city);

  @override
  List<Object?> get props => [city];
}
class GetDailyWeatherEvent extends WeatherEvent {}
