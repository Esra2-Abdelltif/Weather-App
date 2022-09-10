import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/images.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/media_query.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/strings.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_state.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/enums.dart';

class SunsetSunrisceByCitySearch extends StatelessWidget {
  const SunsetSunrisceByCitySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          switch (state.currentRequestStateByCity) {
            case RequestState.loading:
              return const Center();
            case RequestState.loaded:
              return Padding(
                padding: const EdgeInsets.all(15.00),
                child: Container(
                  height: size.height * 0.22,
                  width: size.width,
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  padding: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.2, color: AppColors.blueColor),
                      borderRadius: BorderRadius.circular(35)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              AppStrings.sunrise,
                              style: TextStyle(
                                fontSize: context.height20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: context.height10/2),
                            Text(
                              DateFormat('h:mm a').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      state.currentWeatherByCity!.sunrise.toInt() * 1000)),
                              style: TextStyle(
                                fontSize: context.height20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            LottieBuilder.asset(
                              ImageAssest.sunrise,
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
                              AppStrings.sunset,
                              style: TextStyle(
                                fontSize: context.height20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: context.height10/2),
                            Text(
                              DateFormat('h:mm a').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      state.currentWeatherByCity!.sunset.toInt() * 1000)),
                              style: TextStyle(

                                fontSize: context.height20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            LottieBuilder.asset(
                              ImageAssest.sunset,
                              height: context.height30*3,
                              width: context.height30*5,
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              );
            case RequestState.error:
              return Center(child: Text(state.currentMessageByCity));
            default:
              return const SizedBox();
          }
        });
  }
}
