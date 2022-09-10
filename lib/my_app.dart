import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/service/service_locator.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/strings.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/config/route/app_routes.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/config/theme/bloc_themes/theme_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';

import 'Weather_app (Algoriza)/feature/presentation/manager/weather_event.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => sl<WeatherBloc>()..add(GetHourlyWeatherEvent())..add(GetDailyWeatherEvent())..add(GetCurrentWeatherEvent()))),
        BlocProvider(create: ((context) => ThemeBloc())),

      ],
      child:BlocBuilder<ThemeBloc,ThemeState>(
          builder: (context,state){
            return MaterialApp(
              title: AppStrings.weather,
              debugShowCheckedModeBanner: false,
              theme: state.themeData,
              //  home:  WeatherHomeScreen(),
              onGenerateRoute: AppRoutes.onGenerateRoute,
            );
          }
      ),
    );
  }
}