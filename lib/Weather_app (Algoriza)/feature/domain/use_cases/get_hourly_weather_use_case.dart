import 'package:dartz/dartz.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/error/failure.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/useCases/base_useCase.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/hourly_weather.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/repositories/base_weather_repository.dart';


class GetHourlyWeatherUseCase  extends BaseUseCases<List<HourlyWeather>, NoParameters>{
  final BaseWeatherRepository baseWeatherRepository;


  GetHourlyWeatherUseCase(this.baseWeatherRepository);
  @override
  Future<Either<Failure, List<HourlyWeather>>> call(NoParameters Parameters)async {

    return await baseWeatherRepository.getHourlyWeather();

  }
  }
