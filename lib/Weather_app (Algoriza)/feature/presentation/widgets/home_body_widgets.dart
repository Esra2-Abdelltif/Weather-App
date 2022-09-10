import 'package:flutter/material.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/hourly_chart.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/current_weather_widget.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/status.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/sunset_suneise.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/daily_table.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/today_hour_weather.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/weather_details.dart';

class HomeBodyWidgets extends StatelessWidget {
  const HomeBodyWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
          children:  [


            CurrentWeatherDetails(),
            SizedBox(height: 10,),
            TodayWeather(),
            Status(),
            DialyTable(),
            SunsetSunrisce(),
           // HourlyChart(),
            // CurrentWeatherWidget(),





            // Chart()



          ]),
    );
  }
}
