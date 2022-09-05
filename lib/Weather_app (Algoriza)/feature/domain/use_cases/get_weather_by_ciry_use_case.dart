import 'package:dartz/dartz.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/error/failure.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/useCases/base_useCase.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/current_weather.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/repositories/base_weather_repository.dart';


class GetWeatherByCityUserCase extends BaseUseCases<CurrentWeather,String> {
  final BaseWeatherRepository repository;

  GetWeatherByCityUserCase(this.repository);

  @override
  Future<Either<Failure, CurrentWeather>> call(String params) async {
    return await repository.getWeatherByCity(params);
  }
}