import 'package:dartz/dartz.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/error/failure.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/current_weather.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/daily_weather.dart';


abstract class BaseWeatherRepository {
  Future<Either<Failure, CurrentWeather>> getWeather();
   Future<Either<Failure, CurrentWeather>> getWeatherByCity(String weatherCity);
  Future<Either<Failure, List<DailyWeather>>> getDailyWeather();


}