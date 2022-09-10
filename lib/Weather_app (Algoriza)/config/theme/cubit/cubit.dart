import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/network/cacheHelper.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/config/theme/cubit/states.dart';

class ThemeAppCubit extends Cubit<ThemeAppStates>
{
  ThemeAppCubit() : super(InitialThemeAppState());
  static  ThemeAppCubit get(context) => BlocProvider.of(context);

  bool IsDark=false;
  void ChangeAppMode({ bool? fromShared}){
    if(fromShared != null) {
      IsDark = fromShared;
      emit(AppChangeModeState());
    }
    else {
      IsDark = !IsDark;
      CacheHelper.putDate(key: 'IsDark', value: IsDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }




}
