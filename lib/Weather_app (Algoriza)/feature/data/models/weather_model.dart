import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/current_weather.dart';

class WeatherModel extends CurrentWeather {
  const WeatherModel(
      {required String cityName,
      required String weatherIcon,
      required String country,
      required num temperature,
      required String weatherDescription,
      required num feelsLikeTemperature,
      required num humidity,
      required num pressure,
      required num sunrise,
      required num sunset,
      required num speed,
      required num maxTemperature,
      required num minTemperature})
      : super(
            cityName: cityName,
            weatherIcon: weatherIcon,
            country: country,
            temperature: temperature,
            weatherDescription: weatherDescription,
            feelsLikeTemperature: feelsLikeTemperature,
            humidity: humidity,
            pressure: pressure,
            sunrise: sunrise,
            sunset: sunset,
            speed: speed,
            maxTemperature: maxTemperature,
            minTemperature: minTemperature);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      weatherIcon: json['weather'][0]['icon'],
      country: json['sys']['country'],
      temperature: json['main']['temp'].toDouble(),
      weatherDescription: json['weather'][0]['description'],
      feelsLikeTemperature: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      speed: json['wind']['speed'],
      maxTemperature: json['main']['temp_max'],
      minTemperature: json['main']['temp_min'],
    );
  }
}
