import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/service/service_locator.dart';
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
        BlocProvider(create: ((context) => sl<WeatherBloc>())),

      ],
      child: BlocConsumer<WeatherBloc,WeatherState>(
        listener: (context ,state){},
        builder: (context ,state){
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.dark(),
            home:  WeatherHomeScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}