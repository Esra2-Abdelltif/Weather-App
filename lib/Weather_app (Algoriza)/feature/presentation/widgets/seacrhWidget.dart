import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/images.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/strings.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_state.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/enums.dart';

class WeatherByCityWidget extends StatelessWidget {
  const WeatherByCityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<WeatherBloc, WeatherState>(
        buildWhen: (previous, current) =>
        previous.currentRequestStateByCity != current.currentRequestStateByCity,
        builder: (context, state) {
          switch (state.currentRequestStateByCity) {
            case RequestState.loading:
              return const SizedBox(
                  height: 400,
                  child: Center(child: CircularProgressIndicator()));
            case RequestState.loaded:
              return  GlowContainer(

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
                                state.currentWeatherByCity!.cityName,
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
                                state.currentWeatherByCity!.weatherDescription,
                                style: TextStyle(fontSize:  size.width * 0.06, height: 0.1,color: AppColors.whiteColor),
                              ),
                              Container(
                                height: 70,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${ state.currentWeatherByCity!.maxTemperature.toInt()}",
                                      style: TextStyle(
                                          fontSize: 40, fontWeight: FontWeight.bold,color: AppColors.whiteColor),
                                    ),

                                    Text(
                                      "/" +  "${state.currentWeatherByCity!.minTemperature.toInt()}" + "\u00B0",
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
              );;
            case RequestState.error:
              print("error");
              return SizedBox(
                  height: 400,
                  child: Center(child: Text(state.currentMessageByCity)));
          }
        });
  }
}
// Container(
// height: size.height * 0.7,
// width: size.width,
// margin: const EdgeInsets.only(right: 10, left: 10),
// padding: const EdgeInsets.only(top: 30),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(40),
// color: const Color(0xff981b25),
// gradient: LinearGradient(
// colors: [AppColors.purpleColor, AppColors.blueColor],
// begin: Alignment.bottomCenter,
// end: Alignment.topCenter,
// stops: [.2, .85])),
// child: Column(
// children: [
// Text(
// state.currentWeatherByCity!.cityName,
// style:  TextStyle(
// color: AppColors.whiteColor,
// fontSize: 35,
// fontWeight: FontWeight.w800),
// ),
// const SizedBox(
// height: 10,
// ),
// Text(
// DateFormat("EEEEE, dd, MMM").format(DateTime.now()),
// style:  TextStyle(
// color: AppColors.whiteColor,
// fontSize: 15,
// fontWeight: FontWeight.w400),
// ),
// LottieBuilder.asset(
// "${DateFormat(' a').format(DateTime.now()) == "AM" ? ImageAssest.evening : ImageAssest.morning}",
// height: size.height * 0.22,
// width: size.width * 0.4,
// ),
// Text(
// "${state.currentWeatherByCity!.temperature.toInt()} \u00B0",
// style: TextStyle(
// color: AppColors.whiteColor,
// fontSize: 80,
// fontWeight: FontWeight.w800),
// ),
// const SizedBox(
// height: 5,
// ),
// Text(
// state.currentWeatherByCity!.weatherDescription.toString(),
// style: TextStyle(
// color:AppColors.whiteColor,
// fontSize: 25,
// fontWeight: FontWeight.w400),
// ),
// Row(
// children: [
// Expanded(
// child: Column(
// children: [
// LottieBuilder.asset(
// ImageAssest.humidity,
// height: size.height * 0.1,
// width: size.width * 0.2,
// ),
// Text(
// '${state.currentWeatherByCity!.humidity.toInt()} %',
// style:  TextStyle(
// color: AppColors.whiteColor,
// fontSize: 20,
// fontWeight: FontWeight.bold),
// ),
// const SizedBox(
// height: 10,
// ),
// Text(
// AppStrings.humidity,
// style: TextStyle(
// color: AppColors.whiteColor.withOpacity(.6),
// fontSize: 17,
// fontWeight: FontWeight.bold),
// ),
// ],
// ),
// ),
// Expanded(
// child: Column(
// children: [
// LottieBuilder.asset(
// ImageAssest.wind,
// height: size.height * 0.1,
// width: size.width * 0.2,
// ),
// Text(
// "${state.currentWeatherByCity!.speed.toInt() } ${AppStrings.kmOnH}",
// style:  TextStyle(
// color: AppColors.whiteColor,
// fontSize: 20,
// fontWeight: FontWeight.bold),
// ),
// const SizedBox(
// height: 10,
// ),
// Text(
// AppStrings.wind,
// style: TextStyle(
// color:AppColors.whiteColor.withOpacity(.6),
// fontSize: 17,
// fontWeight: FontWeight.bold),
// ),
// ],
// ),
// ),
// Expanded(
// child: Column(
// children: [
// LottieBuilder.asset(
// ImageAssest.uvIndex,
// height: size.height * 0.1,
// width: size.width * 0.2,
// ),
// Text(
// AppStrings.low,
// style:  TextStyle(
// color: AppColors.whiteColor,
// fontSize: 20,
// fontWeight: FontWeight.bold),
// ),
// const SizedBox(
// height: 10,
// ),
// Text(
// AppStrings.uv,
// style: TextStyle(
// color: AppColors.whiteColor.withOpacity(.6),
// fontSize: 17,
// fontWeight: FontWeight.bold),
// ),
// ],
// ),
// )
// ],
// )
// ],
// ),
// );