import 'package:get_it/get_it.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/data/data_sources/weather_base_datasource.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/data/repositories/weather_repository.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/repositories/base_weather_repository.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/use_cases/get_current_weather_usecase.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/use_cases/get_daily_weather_usecase.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/use_cases/get_weather_by_ciry_use_case.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init(){

    // register data sources
    sl.registerLazySingleton<BaseWeatherDataSource>(() => WeatherRemoteDataSource());

    // register repositories
    sl.registerLazySingleton<BaseWeatherRepository>(() => WeatherRepository(weatherDataSource: sl()));

    // register use cases
    sl.registerLazySingleton<GetCurrentWeatherUseCase>(() => GetCurrentWeatherUseCase(sl()));
    sl.registerLazySingleton<GetWeatherByCityUserCase>(() => GetWeatherByCityUserCase(sl()));
    sl.registerLazySingleton<GetDailyWeatherUseCase>(() => GetDailyWeatherUseCase(sl()));

    // register blocs
    sl.registerFactory<WeatherBloc>(() => WeatherBloc(sl(), sl(),sl()));
  }
}