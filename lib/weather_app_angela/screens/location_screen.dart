import 'package:flutter/material.dart';
import 'package:weather_app/weather_app_angela/screens/city_screen.dart';
import 'package:weather_app/weather_app_angela/sevices/weather.dart';

import '../until/constants.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  const LocationScreen({Key? key, this.locationWeather}) : super(key: key);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel =WeatherModel();
  late int temperature;
  late String weatherIcon ;
  late String weatherMessage;
  late String cityName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateUi(widget.locationWeather);
    print(widget.locationWeather);
  }
  void UpdateUi( dynamic weatherData) {
    setState(() {
      if(weatherData==null){
        temperature =0;
        weatherMessage="Unble to get weather";
        weatherIcon='Error';
        cityName="";
      }
      double temp =weatherData["main"]["temp"];
      temperature=temp.toInt();
      weatherMessage= weatherModel.getMessage(temperature);

      var condition =weatherData["weather"][0]["id"];
      weatherIcon= weatherModel.getWeatherIcon(condition);
      cityName =weatherData["name"];



    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: ()async{
                      setState(() async {
                        var currentWeatherData= await weatherModel.getlocationWeather();
                        UpdateUi(currentWeatherData);
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                      var typeName= await Navigator.push(context, MaterialPageRoute(builder: (contex){
                        return CityScreen();
                      }));
                      if(typeName!=null){
                        var weathercity= await weatherModel.getCityWeather(typeName);
                        UpdateUi(weathercity);
                      }

                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
