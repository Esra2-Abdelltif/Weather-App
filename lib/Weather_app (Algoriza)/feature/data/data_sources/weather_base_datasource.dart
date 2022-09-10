import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/error/exceptions.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/network/api_constance.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/network/error_message_model.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/data/models/daily_weather_model.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/data/models/hourly_weather_model.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/data/models/weather_model.dart';


abstract class BaseWeatherDataSource {
  Future<WeatherModel> getWeather();
  Future<WeatherModel> getWeatherByCity(String city);
  Future<List<DailyWeatherModel>> getDailyWeather();
  Future<List<HourlyWeatherModel>> getHourlyWeather();


}

class WeatherRemoteDataSource extends BaseWeatherDataSource {

  @override
  Future<WeatherModel> getWeather() async{
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double latitude = position.latitude;
    double longitude = position.longitude;
    print("position: ${position}");
    final response = await Dio().get(ApiConstance.currentWeatherByCoordinates(latitude, longitude));
    if (response.statusCode == 200) {

      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<WeatherModel> getWeatherByCity(String city) async{
    final response = await Dio().get(ApiConstance.currentWeather(city));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<DailyWeatherModel>> getDailyWeather() async{
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double latitude = position.latitude;
    double longitude = position.longitude;
    final response = await Dio().get(ApiConstance.dailyWeather(latitude, longitude));
    if (response.statusCode == 200) {
      //print("------------------------------------------ ${response.data['daily']}");
      return List.from((response.data['daily'] as List).map((element) => DailyWeatherModel.fromJson(element)));
      //return List<DailyWeatherModel>.from(response.data['daily'].map((item) => DailyWeatherModel.fromJson(item)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<HourlyWeatherModel>> getHourlyWeather() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double latitude = position.latitude;
    double longitude = position.longitude;

    final response = await Dio().get(ApiConstance.hourlyWeather(latitude, longitude));
    if (response.statusCode == 200) {
      print("-hourly----------------------------------------- ${response.data['hourly']}");
      return List.from((response.data['hourly'] as List).map((element) => HourlyWeatherModel.fromJson(element)));
      //return List<HourlyWeatherModel>.from(response.data['hourly'].map((item) => HourlyWeatherModel.fromJson(item)));
    } else {
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }







}