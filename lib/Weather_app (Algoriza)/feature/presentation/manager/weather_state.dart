import 'package:equatable/equatable.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/current_weather.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/daily_weather.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/hourly_weather.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/enums.dart';


class WeatherState extends Equatable {
  final CurrentWeather? currentWeather;
  final String currentMessage;
  final RequestState currentRequestState;

  final CurrentWeather? currentWeatherByCity;
  final String currentMessageByCity;
  final RequestState currentRequestStateByCity;

  final List<DailyWeather> dailyWeather;
  final String dailyMessage;
  final RequestState dailyRequestState;

  final List<HourlyWeather> hourlyWeather;
  final String hourlyMessage;
  final RequestState hourlyRequestState;

  const WeatherState({
    this.currentWeather,
    this.currentMessage = '',
    this.currentRequestState = RequestState.loading,
    this.currentWeatherByCity,
    this.currentMessageByCity = '',
    this.currentRequestStateByCity = RequestState.loading,
    this.dailyWeather = const [],
    this.dailyMessage = "",
    this.dailyRequestState = RequestState.loading,
    this.hourlyWeather = const [],
    this.hourlyMessage = "",
    this.hourlyRequestState = RequestState.loading,
  });

  WeatherState copyWith({
    CurrentWeather? currentWeather,
    CurrentWeather? currentWeatherByCity,
    List<DailyWeather>? dailyWeather,
    List<HourlyWeather>? hourlyWeather,
    RequestState? currentRequestState,
    RequestState? dailyRequestState,
    RequestState? hourlyRequestState,
    RequestState? currentRequestStateByCity,
    String? currentMessage,
    String? dailyMessage,
    String? hourlyMessage,
    String? currentMessageByCity,
  }) {
    return WeatherState(
      currentWeather: currentWeather ?? this.currentWeather,
      currentWeatherByCity: currentWeatherByCity ?? this.currentWeatherByCity,
      dailyWeather: dailyWeather ?? this.dailyWeather,
      hourlyWeather: hourlyWeather ?? this.hourlyWeather,
      currentRequestState: currentRequestState ?? this.currentRequestState,
      dailyRequestState: dailyRequestState ?? this.dailyRequestState,
      hourlyRequestState: hourlyRequestState ?? this.hourlyRequestState,
      currentRequestStateByCity:
          currentRequestStateByCity ?? this.currentRequestStateByCity,
      currentMessage: currentMessage ?? this.currentMessage,
      dailyMessage: dailyMessage ?? this.dailyMessage,
      hourlyMessage: hourlyMessage ?? this.hourlyMessage,
      currentMessageByCity: currentMessageByCity ?? this.currentMessageByCity,
    );
  }

  @override
  List<Object?> get props => [
        currentWeather,
        currentWeatherByCity,
        currentRequestState,
        currentRequestStateByCity,
        currentMessage,
        currentMessageByCity,
        dailyRequestState,
        dailyMessage,
        dailyWeather,
        hourlyMessage,
        hourlyRequestState,
        hourlyWeather
      ];
}
