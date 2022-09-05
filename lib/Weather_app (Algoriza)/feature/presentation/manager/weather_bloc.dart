import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/useCases/base_useCase.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/enums.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/use_cases/get_current_weather_usecase.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/use_cases/get_daily_weather_usecase.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/use_cases/get_weather_by_ciry_use_case.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_event.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  final GetWeatherByCityUserCase getWeatherByCityUserCase;
  final GetDailyWeatherUseCase getDailyWeatherUseCase;



  WeatherBloc(this.getCurrentWeatherUseCase, this.getWeatherByCityUserCase, this.getDailyWeatherUseCase)
      : super(const WeatherState()){
    on<GetCurrentWeatherEvent>(_getCurrentWeather);
    on<GetCurrentWeatherByCityEvent>(_getWeatherByCity);
    on<GetDailyWeatherEvent>(_getDailyWeather);
  }

  Future <void> _getCurrentWeather(GetCurrentWeatherEvent event ,Emitter<WeatherState>emit) async {
    final result = await getCurrentWeatherUseCase.call(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(currentRequestState: RequestState.error, currentMessage: l.message)),
            (r) => emit(state.copyWith(currentWeather: r, currentRequestState: RequestState.loaded))
    );
  }



  Future <void> _getWeatherByCity(GetCurrentWeatherByCityEvent event ,Emitter<WeatherState>emit) async {
    final result = await getWeatherByCityUserCase.call(event.city);
    result.fold(
            (l) => emit(state.copyWith  (currentRequestStateByCity: RequestState.error, currentMessageByCity: l.message)),
            (r) => emit(state.copyWith(currentWeatherByCity: r, currentRequestStateByCity: RequestState.loaded))
    );
  }


  Future <void> _getDailyWeather(GetDailyWeatherEvent event ,Emitter<WeatherState>emit) async {
    final result = await getDailyWeatherUseCase.call(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(dailyRequestState: RequestState.error, dailyMessage: l.message)),
            (r) => emit(state.copyWith(dailyWeather: r, dailyRequestState: RequestState.loaded))
    );
  }
}
