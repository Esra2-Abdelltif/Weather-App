import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/service/service_locator.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/app_constance.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_event.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/pages/Search_Screen.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/pages/weather_home_screen.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/seacrhWidget.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/status_widget_by_city_search.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/sunset_suneise_by_city_search.dart';

class WeatherByCityScreen extends StatelessWidget {

  String? cityName;
  WeatherByCityScreen({required this.cityName});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => sl<WeatherBloc>()..add(GetCurrentWeatherByCityEvent(cityName!))..add(GetCurrentWeatherEvent()),

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blueColor,
          leading: InkWell(
            onTap: (){
              NavigateTo(router: WeatherHomeScreen(),context: context);
            },
              child: Icon(Icons.near_me_rounded)),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                  onTap: (){
                    NavigateTo(router: SearchScreen(),context: context);
                  },
                  child: Icon(Icons.search)),
            ),
          ],

        ),
        body: SingleChildScrollView(
          child: Column(children: [
            WeatherByCityWidget(),
            SizedBox(height: 20,),
            StatusWidgetByCityName(),
            SunsetSunrisceByCitySearch()
          ]),
        ),
    )


    );
  }

}
