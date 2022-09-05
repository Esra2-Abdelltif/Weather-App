import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/error/exceptions.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/service/service_locator.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/pages/weather_home_screen.dart';
import 'package:weather_app/my_app.dart';
import 'package:weather_app/observer_bloc.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();


  BlocOverrides.runZoned( () {
    runApp( MyApp());

  },
    blocObserver: MyBlocObserver(),
  );
}



