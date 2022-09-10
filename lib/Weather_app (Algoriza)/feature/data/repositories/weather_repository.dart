import 'package:dartz/dartz.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/error/exceptions.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/error/failure.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/data/data_sources/weather_base_datasource.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/current_weather.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/daily_weather.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/hourly_weather.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/repositories/base_weather_repository.dart';


class WeatherRepository extends BaseWeatherRepository{
  final BaseWeatherDataSource weatherDataSource;

  WeatherRepository({required this.weatherDataSource});

  @override
  Future<Either<Failure, CurrentWeather>> getWeather() async {
    final result = await weatherDataSource.getWeather();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.message));
    }
  }

  @override

  Future<Either<Failure, CurrentWeather>> getWeatherByCity(String city) async {
   final result = await weatherDataSource.getWeatherByCity(city);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.message));
    }
  }

  @override
  Future<Either<Failure, List<DailyWeather>>> getDailyWeather() async{
    final result = await weatherDataSource.getDailyWeather();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.message));
    }
  }

  @override
  Future<Either<Failure, List<HourlyWeather>>> getHourlyWeather() async{
    final result = await weatherDataSource.getHourlyWeather();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage.message));
    }
  }



}