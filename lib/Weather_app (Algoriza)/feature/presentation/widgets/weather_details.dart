import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/enums.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/images.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_state.dart';



class CurrentWeatherDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
        buildWhen: (previous, current) =>
        previous.currentRequestState != current.currentRequestState,
        builder: (context, state) {
          Size size = MediaQuery.of(context).size;

          switch (state.currentRequestState) {
            case RequestState.loading:
              return const SizedBox(
                  height: 400,
                  child: Center(child: CircularProgressIndicator()));
            case RequestState.loaded:
              return GlowContainer(

                color: AppColors.blueColor,
                glowColor: AppColors.blueColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on,color: AppColors.whiteColor),
                              Text(
                                state.currentWeather!.cityName,
                                style:
                                TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: AppColors.whiteColor),
                              ),
                            ],
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.3,
                            height: MediaQuery.of(context).size.width / 2.3,
                           child:  LottieBuilder.asset(
                             ImageAssest.morning ,
                             height: size.height * 0.22,
                             width: size.width * 0.4,
                           ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.currentWeather!.weatherDescription,
                                style: TextStyle(fontSize: 30, height: 0.1,color: AppColors.whiteColor),
                              ),
                              Container(
                               height: 70,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                     "${ state.currentWeather!.maxTemperature.toInt()}",
                                      style: TextStyle(
                                          fontSize: 40, fontWeight: FontWeight.bold,color: AppColors.whiteColor),
                                    ),

                                    Text(
                                      "/" +  "${state.currentWeather!.minTemperature.toInt()}" + "\u00B0",
                                      style: TextStyle(
                                          color: Colors.black54.withOpacity(0.3),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),


                            ],
                          )
                        ],
                      ),
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
        });;
  }
}

