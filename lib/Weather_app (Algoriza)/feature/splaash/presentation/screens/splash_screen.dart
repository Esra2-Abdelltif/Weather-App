import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/images.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/media_query.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/strings.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/config/route/app_routes.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_event.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _startDelay() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.pushReplacementNamed(context, Routes.currentweather);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
    GetCurrentWeatherEvent();
    GetHourlyWeatherEvent();
    GetDailyWeatherEvent();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // backgroundColor: AppColors.colorSplash,
      body: Column(
        children: [
          Spacer(),
          Center(
            child:  LottieBuilder.asset(
               ImageAssest.splash,
              height:600,
              width:500,
            ),
          ),
          Spacer(),
          Text(
            AppStrings.weather,
            style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,),
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
