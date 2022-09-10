import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/data/2.5/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(
      'weather',
      queryParameters: query,
    );
  }
}
//https://api.openweathermap.org/data/2.5/weather/