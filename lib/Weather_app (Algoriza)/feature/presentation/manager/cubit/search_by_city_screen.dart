import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/images.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/strings.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/cubit/cubit.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/cubit/state.dart';

class SearchByCityScreen extends StatelessWidget {
  SearchByCityScreen({Key? key});

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherAppCubit(),
      child: BlocConsumer<WeatherAppCubit, WeatherAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = WeatherAppCubit.get(context);
          Size size = MediaQuery.of(context).size;
          return Scaffold(
            appBar: AppBar(
                elevation:0,
            ),

            body: Padding(
              padding: const EdgeInsets.all(20.00),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.blueColor.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                )
                              ],
                            ),
                            child: TextFormField(
                              style: Theme.of(context).textTheme.bodyText2,
                              controller: searchController,
                              onFieldSubmitted: (value) {
                                cubit.getWeatherData(
                                    city: searchController.text);
                              },
                              decoration: InputDecoration(
                                hintText: AppStrings.searchCity,
                                hintStyle: TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        FloatingActionButton(
                          backgroundColor: AppColors.blueColor,
                          onPressed: () {
                            cubit.getWeatherData(city: searchController.text);
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ConditionalBuilder(
                      condition: state is WeatherSuccessDataAppState,
                      builder: (context) =>  Container(
                        height: size.height * 0.55,
                        width: size.width,
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        padding: const EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: const Color(0xff981b25),
                            gradient: LinearGradient(
                                colors: [AppColors.purpleColor, AppColors.blueColor],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [.2, .85])),
                        child: Column(
                          children: [
                            Text(
                             cubit.weatherModel!.cityName,
                              style:  TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w800),
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
                            LottieBuilder.asset(
                              "${DateFormat(' a').format(DateTime.now()) == "AM" ? ImageAssest.evening : ImageAssest.morning}",
                              height: size.height * 0.22,
                              width: size.width * 0.4,
                            ),
                            Text(
                            "${(cubit.weatherModel!.temperature - 273.15).toInt() } \u00B0"
                             ,
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 80,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              cubit.weatherModel!.weatherDescription.toString(),
                              style: TextStyle(
                                  color:AppColors.whiteColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),

                          ],
                        ),
                      ),
                      fallback: (context) => Center(
                        child: Column(
                          children: [

                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                               'Please, enter your city.',


                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
