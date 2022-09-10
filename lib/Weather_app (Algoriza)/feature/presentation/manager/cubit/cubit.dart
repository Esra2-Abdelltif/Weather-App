import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/network/dio_helper.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/data/models/weather_model.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/cubit/state.dart';


class WeatherAppCubit extends Cubit<WeatherAppStates>{
  WeatherAppCubit() : super(InitializeWeatherAppState());

  static WeatherAppCubit get(context) => BlocProvider.of(context);
  WeatherModel? weatherModel;

  void getWeatherData({
    required String city,
}){
    emit(LoadingWeatherAppState());

    DioHelper.getData(query: {
      'q': city,
      'appid':'d0d253c5dca7fb4ab6caf8ec961238f2',
    }).then((value) {
      weatherModel = WeatherModel.fromJson(value.data) ;
      emit(WeatherSuccessDataAppState());
    }).catchError((error){
      emit(WeatherErrorDataAppState(error.toString()));
    });
  }
}