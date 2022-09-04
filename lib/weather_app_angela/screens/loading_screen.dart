import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/weather_app_angela/screens/location_screen.dart';
import 'package:weather_app/weather_app_angela/sevices/location.dart';
import 'package:weather_app/weather_app_angela/sevices/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/weather_app_angela/sevices/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocationData();
  }

  void getlocationData() async {

    // WeatherModel weatherModel =WeatherModel();
    var weatherData = await WeatherModel().getlocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (contex){return LocationScreen(locationWeather: weatherData);}));

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        )
      ),
    );
  }
}
