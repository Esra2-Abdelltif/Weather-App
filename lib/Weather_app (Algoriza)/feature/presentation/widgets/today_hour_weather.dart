import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/network/api_constance.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/app_constance.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/enums.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/media_query.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/strings.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_state.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/pages/hour_details_cart.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/hourly_chart.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/weather_details.dart';

class TodayWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.00),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.today,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  NavigateTo(context: context ,router: HourDetialChart());

                },
                child:   Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          WeatherWidget(),
        ],
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      switch (state.hourlyRequestState) {
        case RequestState.loading:
          return const Center();
        case RequestState.loaded:
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                for (final weather in state.hourlyWeather)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.2, color: AppColors.blueColor),
                          borderRadius: BorderRadius.circular(35)),
                      child: Column(
                        children: [
                          Text(
                           "${ weather.temperature.toInt()} \u00B0",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Image.network(
                            ApiConstance.weatherIcon(weather.icon),
                            height: context.height20,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            DateFormat('h:mm a').format(DateTime.fromMillisecondsSinceEpoch(weather.time.toInt()*1000,isUtc: false)),
                            style:
                                TextStyle(fontSize: 16, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
              ],
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
