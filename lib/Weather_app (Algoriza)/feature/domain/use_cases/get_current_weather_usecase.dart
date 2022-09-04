import 'package:dartz/dartz.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/error/failure.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/useCases/base_useCase.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/current_weather.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/repositories/base_weather_repository.dart';

class GetCurrentWeatherUseCase extends BaseUseCases<CurrentWeather,NoParameters> {
  final BaseWeatherRepository baseWeatherRepository;

  GetCurrentWeatherUseCase(this.baseWeatherRepository);


  @override
  Future<Either<Failure, CurrentWeather>> call(NoParameters Parameters)async {
    // TODO: implement call
    return await baseWeatherRepository.getWeather();
  }
}

