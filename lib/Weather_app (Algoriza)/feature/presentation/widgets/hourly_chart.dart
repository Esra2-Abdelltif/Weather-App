import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/media_query.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/domain/entities/hourly_weather.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_state.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/enums.dart';

class HourlyChart extends StatelessWidget {
  const HourlyChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {

      switch (state.hourlyRequestState) {
        case RequestState.loading:
          return const Center();
        case RequestState.loaded:
          return Padding(
            padding: const EdgeInsets.all(15.00),
            child: Container(
              padding: EdgeInsets.all(context.height10/2),
              height: context.height20*12,
              width: context.screenWidth,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.2, color: AppColors.blueColor),
                  borderRadius: BorderRadius.circular(35)),
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  labelStyle:  TextStyle(

                    fontWeight: FontWeight.bold,
                  ),
                ),
                primaryYAxis: NumericAxis(
                  labelStyle:  TextStyle(

                    fontWeight: FontWeight.bold,
                  ),
                ),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries>[
                  SplineSeries<HourlyWeather,String>(
                    dataSource: state.hourlyWeather,
                    xValueMapper: (HourlyWeather weather,_) => DateFormat('h:mm a').format(DateTime.fromMillisecondsSinceEpoch(weather.time.toInt()*1000,isUtc: false)),

                    yValueMapper: (HourlyWeather weather,_) => weather.temperature,

                  ),
                ],
              ),
            ),
          );
        case RequestState.error:
          return Center(
            child: Text(state.hourlyMessage),
          );
        default:
          return const SizedBox();
      }
    });
  }
}
