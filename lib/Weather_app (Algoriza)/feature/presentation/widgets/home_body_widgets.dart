import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/network/api_constance.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/styles/media_query.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/current_weather_widget.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/status.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/table.dart';

class HomeBodyWidgets extends StatelessWidget {
  const HomeBodyWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
          children:  [



            CurrentWeatherWidget(),
            SizedBox(height: 10,),
            DialyTable(),

            SizedBox(height: 10,),
            Status()


          ]),
    );
  }
}
