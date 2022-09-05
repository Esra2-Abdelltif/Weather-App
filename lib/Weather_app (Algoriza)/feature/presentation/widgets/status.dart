import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/styles/images.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/styles/media_query.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_state.dart';

import '../../../Core/styles/colors.dart';
import '../../../Core/utils/enums.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
      switch (state.currentRequestState) {
        case RequestState.loading:
          return const Center();
        case RequestState.loaded:
          return Container(
            height: size.height * 0.22,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Sunrise',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.height20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: context.height10/2),
                      Text(
                        DateFormat('h:mm a').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                state.currentWeather!.sunrise * 1000)),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.height20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      LottieBuilder.asset(
                        sunrise,
                        height: context.height30*3,
                        width: context.height30*5,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Sunset',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.height20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: context.height10/2),
                      Text(
                        DateFormat('h:mm a').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                state.currentWeather!.sunset * 1000)),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.height20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      LottieBuilder.asset(
                        sunrise,
                        height: context.height30*3,
                        width: context.height30*5,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        case RequestState.error:
          return Center(child: Text(state.currentMessage));
        default:
          return const SizedBox();
      }
    });
  }
}
