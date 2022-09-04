import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/error/exceptions.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/network/api_constance.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/network/error_message_model.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/data/models/weather_model.dart';


abstract class BaseWeatherDataSource {
  Future<WeatherModel> getWeather();
  Future<WeatherModel> getWeatherByCity(String city);

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





}