import 'package:dartz/dartz.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/error/failure.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/base_use_case.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/current_weather.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/repositories/base_weather_repository.dart';


class GetWeatherByCityUserCase extends BaseUseCase<CurrentWeather,String> {
  final BaseWeatherRepository repository;

  GetWeatherByCityUserCase(this.repository);

  @override
  Future<Either<Failure, CurrentWeather>> execute(String params) async {
    return await repository.getWeatherByCity(params);
  }
}