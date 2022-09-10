import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/service/service_locator.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/enums.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/media_query.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_event.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_state.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/favouriteLocation.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/hourly_chart.dart';

class HourDetialChart extends StatelessWidget {
  const HourDetialChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CurrenCityName(),
          SizedBox(height: 70,),
          HourlyChart(),
        ],

      ),



    );
  }
}


class CurrenCityName extends StatelessWidget {
  const CurrenCityName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          switch (state.currentRequestState) {
            case RequestState.loading:
              return const Center();
            case RequestState.loaded:
              return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_location,
                    size: context.height30,
                      color: AppColors.blueColor
                  ),
                  SizedBox(width: 10,),
                  Text(
                    state.currentWeather!.cityName,
                    style:
                    TextStyle( fontSize: 25,color: AppColors.blueColor),
                  ),
                ],
              );
            case RequestState.error:
              return Center(child: Text(state.currentMessage));
            default:
              return const SizedBox();
          }
        });
  }
}