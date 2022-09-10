import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/service/service_locator.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/strings.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/config/route/app_routes.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/config/theme/themes.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_state.dart';

import 'Weather_app (Algoriza)/feature/presentation/manager/weather_event.dart';
import 'Weather_app (Algoriza)/feature/presentation/pages/weather_home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => sl<WeatherBloc>()..add(GetHourlyWeatherEvent())..add(GetDailyWeatherEvent())..add(GetCurrentWeatherEvent()))),

      ],
      child: BlocConsumer<WeatherBloc,WeatherState>(
        listener: (context ,state){},
        builder: (context ,state){
          return MaterialApp(
            title: AppStrings.weather,
            theme:DarkTheme(),
          //  home:  WeatherHomeScreen(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}