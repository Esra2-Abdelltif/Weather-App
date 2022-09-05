import 'package:equatable/equatable.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/enums.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/current_weather.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/daily_weather.dart';

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

  const WeatherState(
      {this.currentWeather,
      this.currentMessage = '',
      this.currentRequestState = RequestState.loading,
      this.currentWeatherByCity,
      this.currentMessageByCity = '',
      this.currentRequestStateByCity = RequestState.loading,
      this.dailyWeather = const [],
      this.dailyMessage = "",
      this.dailyRequestState = RequestState.loading});

  WeatherState copyWith({
    CurrentWeather? currentWeather,
    CurrentWeather? currentWeatherByCity,
    List<DailyWeather>? dailyWeather,
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
      currentMessage: currentMessage ?? this.currentMessage,
      currentRequestState: currentRequestState ?? this.currentRequestState,
      currentWeatherByCity: currentWeatherByCity ?? this.currentWeatherByCity,
      currentMessageByCity: currentMessageByCity ?? this.currentMessageByCity,
      currentRequestStateByCity: currentRequestStateByCity ?? this.currentRequestStateByCity,
      dailyWeather: dailyWeather ?? this.dailyWeather,
      dailyMessage: dailyMessage ?? this.dailyMessage,
      dailyRequestState:  dailyRequestState ?? this.dailyRequestState,

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
        dailyWeather
      ];
}
