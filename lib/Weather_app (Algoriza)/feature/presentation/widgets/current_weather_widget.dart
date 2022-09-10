import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/images.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_state.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/enums.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<WeatherBloc, WeatherState>(
        buildWhen: (previous, current) =>
            previous.currentRequestState != current.currentRequestState,
        builder: (context, state) {
          switch (state.currentRequestState) {
            case RequestState.loading:
              return const SizedBox(
                  height: 400,
                  child: Center(child: CircularProgressIndicator()));
            case RequestState.loaded:
              return Container(
                height: size.height * 0.55,
                width: size.width,
                margin: const EdgeInsets.only(right: 10, left: 10),
                padding: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color(0xff981b25),
                    gradient: LinearGradient(
                        colors: [AppColors.purpleColor, AppColors.blueColor],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [.2, .85])),
                child: Column(
                  children: [
                    Text(
                      state.currentWeather!.cityName,
                      style:  TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 35,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      DateFormat("EEEEE, dd, MMM").format(DateTime.now()),
                      style:  TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    LottieBuilder.asset(
                      "${DateFormat(' a').format(DateTime.now()) == "AM" ? ImageAssest.evening : ImageAssest.morning}",
                      height: size.height * 0.22,
                      width: size.width * 0.4,
                    ),
                    Text(
                      "${state.currentWeather!.temperature.toInt()} \u00B0",
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 80,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      state.currentWeather!.weatherDescription.toString(),
                      style: TextStyle(
                          color:AppColors.whiteColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),

                  ],
                ),
              );
            case RequestState.error:
              print("error");
              return SizedBox(
                  height: 400,
                  child: Center(child: Text(state.currentMessage)));
          }
        });
  }
}
