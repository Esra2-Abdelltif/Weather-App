import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/styles/images.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_state.dart';
import '../../../Core/utils/enums.dart';
import 'package:intl/intl.dart';


class CurrentWeatherWidget extends StatelessWidget {

  const CurrentWeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<WeatherBloc,WeatherState>(
        buildWhen: (previous, current) => previous.currentRequestState != current.currentRequestState,
        builder: (context,state){
          switch (state.currentRequestState){
            case RequestState.loading:
              print('Loading');
              return const SizedBox(
                  height: 400,
                  child: Center(child: CircularProgressIndicator()));
            case RequestState.loaded:
              return  Container(
                              height: size.height * 0.7,
                              width: size.width,
                              margin: const EdgeInsets.only(right: 10, left: 10),
                              padding: const EdgeInsets.only(top: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: const Color(0xff981b25),
                                  gradient: const LinearGradient(
                                      colors: [ Color(0xff955cd1), Color(0xff3fa2fa)],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      stops: [.2, .85])),
                              child: Column(
                                children: [
                                   Text(
                                    state.currentWeather!.cityName,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    DateFormat("EEEEE, dd, MMM").format(DateTime.now()),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                   LottieBuilder.asset(
                                     "${ DateFormat(' a').format(DateTime.now()) =="AM"? evening:morning}"
                                    , height: size.height * 0.22,
                                    width: size.width * 0.4,
                                  ),
                                  Text(
                                    "${state.currentWeather!.temperature.toInt()} \u00B0",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 80,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    state.currentWeather!.weatherDescription.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                             LottieBuilder.asset(
                                               humidity,
                                               height: size.height * 0.1,
                                               width: size.width * 0.2,
                                             ),
                                             Text(
                                              '${state.currentWeather!.humidity.toInt()} %',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "humidity",
                                              style: TextStyle(
                                                  color: Colors.white.withOpacity(.6),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            LottieBuilder.asset(
                                              wind,
                                              height: size.height * 0.1,
                                              width: size.width * 0.2,
                                            ),
                                            Text(
                                              "${state.currentWeather!.speed.toInt()} km/h",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text("Wind",
                                              style: TextStyle(
                                                  color: Colors.white.withOpacity(.6),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            LottieBuilder.asset(
                                              uvIndex,
                                              height: size.height * 0.1,
                                              width: size.width * 0.2,
                                            ),
                                            const Text(
                                              "Low",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "UV index",
                                              style: TextStyle(
                                                  color: Colors.white.withOpacity(.6),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )


                                ],
                              ),
                            );
            case RequestState.error:
              print("error");
              return SizedBox(
                  height: 400,
                  child: Center(child:Text(state.currentMessage)));

          }
        });
  }
}
