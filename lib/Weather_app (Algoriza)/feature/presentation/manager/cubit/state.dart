abstract class WeatherAppStates {}

class InitializeWeatherAppState extends WeatherAppStates {}

class LoadingWeatherAppState extends WeatherAppStates {}

class WeatherSuccessDataAppState extends WeatherAppStates {}

class WeatherErrorDataAppState extends WeatherAppStates {
  final String error;

  WeatherErrorDataAppState(this.error);
}
