import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/network/api_constance.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/styles/media_query.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_state.dart';
import '../../../Core/utils/enums.dart';

class DialyTable extends StatelessWidget {
  const DialyTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      print("----------------------------------------${state.dailyRequestState.name}");

      switch (state.dailyRequestState) {
        case RequestState.loading:
          return const Center();
        case RequestState.loaded:
          return Container(

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
                  for (final weather in state.dailyWeather)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.height20,
                          vertical: context.height10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(DateFormat('MMMM d,EEEE').format(DateTime.fromMillisecondsSinceEpoch(weather.date * 1000, isUtc: false)) ==
                                          DateFormat('MMMM d,EEEE')
                                              .format(DateTime.now())
                                      ? 'Today'
                                      : DateFormat.EEEE().format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              weather.date * 1000,
                                              isUtc: false)),
                                  style: TextStyle(
                                    fontSize: context.height20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.droplet,
                                      color: Colors.white70,
                                      size: context.height10,
                                    ),
                                    Text(
                                      '${(weather.humidity).round()}%',
                                      style: TextStyle(
                                        fontSize: context.height15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    SizedBox(width: context.height30),
                                    Image.network(
                                      ApiConstance.weatherIcon(weather.icon),
                                      height: context.height20,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                children: [
                                  Text(
                                    '${weather.tempMax.round()}°',
                                    style: TextStyle(
                                      fontSize: context.height15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.width10,
                                  ),
                                  Text(
                                    '${weather.tempMin.round()}°',
                                    style: TextStyle(
                                      fontSize: context.height15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ))
                            ],
                          )
                        ],
                      ),
                    )
                ],
              ));
        case RequestState.error:
          return Center(
            child: Text(state.currentMessage),
          );
        default:
          return const SizedBox();
      }
    });
  }
}
