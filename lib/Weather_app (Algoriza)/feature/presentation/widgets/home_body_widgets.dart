import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/styles/images.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/current_weather_widget.dart';

class HomeBodyWidgets extends StatelessWidget {
  const HomeBodyWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
          children: [
         Container(
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
                            const Text(
                              "london",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w400),
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
                              humidity,
                              height: size.height * 0.2,
                              width: size.height * 0.5,
                            ),
                            const Text(
                              "humidity",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "15°",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 80,
                                  fontWeight: FontWeight.w800),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      LottieBuilder.asset(
                                        wind,
                                        height: size.height * 0.1,
                                        width: size.width * 0.2,
                                      ),
                                      const Text(
                                        "17.5 km/h",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "wind",
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
                                        humidity,
                                        height: size.height * 0.1,
                                        width: size.width * 0.2,
                                      ),
                                      const Text(
                                        "81",
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
                                        sunset,
                                        height: size.height * 0.1,
                                        width: size.width * 0.2,
                                      ),
                                      const Text(
                                        "SE",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "wind Direction",
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
                      ),
            CurrentWeatherWidget()


          ]),
    );
  }
}
