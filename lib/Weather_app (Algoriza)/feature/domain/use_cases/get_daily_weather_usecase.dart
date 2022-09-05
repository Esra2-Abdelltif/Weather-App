import 'package:dartz/dartz.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/error/failure.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/useCases/base_useCase.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/daily_weather.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/repositories/base_weather_repository.dart';

class GetDailyWeatherUseCase extends BaseUseCases<List<DailyWeather>, NoParameters>{
  final BaseWeatherRepository baseWeatherRepository;

  GetDailyWeatherUseCase(this.baseWeatherRepository);

  @override
  Future<Either<Failure, List<DailyWeather>>> call(NoParameters Parameters)async {

      return await baseWeatherRepository.getDailyWeather();

  }

}