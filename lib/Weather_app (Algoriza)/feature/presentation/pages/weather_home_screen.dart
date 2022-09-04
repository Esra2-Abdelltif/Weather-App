import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/service/service_locator.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_event.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/build_drawer.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/home_body_widgets.dart';
import '../../../../Weather_app%20(Algoriza)/Core/styles/images.dart';

class WeatherHomeScreen extends StatelessWidget {
  late String cityName='suez';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (BuildContext context) => sl<WeatherBloc>()..add(GetCurrentWeatherEvent())..add(GetCurrentWeatherByCityEvent(cityName)),

      child: Scaffold(
        backgroundColor: const Color(0xff081b25),
        drawer:CustomDrawer(),
        body: HomeBodyWidgets(),
        appBar: AppBar(
          backgroundColor:const Color(0xff081b25) ,
          elevation: 0,
        ),
        // body: SingleChildScrollView(
        //   child: Container(
        //       child: Column(
        //           children: [
        //             HomeBodyWidgets(),
        //             Container(
        //               height: size.height * 0.8,
        //               width: size.width,
        //               margin: const EdgeInsets.only(right: 10, left: 10),
        //               padding: const EdgeInsets.only(top: 30),
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(40),
        //                   color: const Color(0xff981b25),
        //                   gradient: const LinearGradient(
        //                       colors: [ Color(0xff955cd1), Color(0xff3fa2fa)],
        //                       begin: Alignment.bottomCenter,
        //                       end: Alignment.topCenter,
        //                       stops: [.2, .85])),
        //               child: Column(
        //                 children: [
        //                   const Text(
        //                     "london",
        //                     style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 35,
        //                         fontWeight: FontWeight.w400),
        //                   ),
        //                   const SizedBox(
        //                     height: 10,
        //                   ),
        //                   Text(
        //                     DateFormat("EEEEE, dd, MMM").format(DateTime.now()),
        //                     style: const TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 15,
        //                         fontWeight: FontWeight.w400),
        //                   ),
        //                   LottieBuilder.asset(
        //                     humidity,
        //                     height: size.height * 0.2,
        //                     width: size.height * 0.5,
        //                   ),
        //                   const Text(
        //                     "humidity",
        //                     style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 35,
        //                         fontWeight: FontWeight.w800),
        //                   ),
        //                   const SizedBox(
        //                     height: 5,
        //                   ),
        //                   const Text(
        //                     "15°",
        //                     style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 80,
        //                         fontWeight: FontWeight.w800),
        //                   ),
        //                   Row(
        //                     children: [
        //                       Expanded(
        //                         child: Column(
        //                           children: [
        //                             LottieBuilder.asset(
        //                               wind,
        //                               height: size.height * 0.1,
        //                               width: size.width * 0.2,
        //                             ),
        //                             const Text(
        //                               "17.5 km/h",
        //                               style: const TextStyle(
        //                                   color: Colors.white,
        //                                   fontSize: 20,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                             const SizedBox(
        //                               height: 10,
        //                             ),
        //                             Text(
        //                               "wind",
        //                               style: TextStyle(
        //                                   color: Colors.white.withOpacity(.6),
        //                                   fontSize: 17,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                       Expanded(
        //                         child: Column(
        //                           children: [
        //                             LottieBuilder.asset(
        //                               humidity,
        //                               height: size.height * 0.1,
        //                               width: size.width * 0.2,
        //                             ),
        //                             const Text(
        //                               "81",
        //                               style: const TextStyle(
        //                                   color: Colors.white,
        //                                   fontSize: 20,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                             const SizedBox(
        //                               height: 10,
        //                             ),
        //                             Text(
        //                               "humidity",
        //                               style: TextStyle(
        //                                   color: Colors.white.withOpacity(.6),
        //                                   fontSize: 17,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                       Expanded(
        //                         child: Column(
        //                           children: [
        //                             LottieBuilder.asset(
        //                               sunset,
        //                               height: size.height * 0.1,
        //                               width: size.width * 0.2,
        //                             ),
        //                             const Text(
        //                               "SE",
        //                               style: const TextStyle(
        //                                   color: Colors.white,
        //                                   fontSize: 20,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                             const SizedBox(
        //                               height: 10,
        //                             ),
        //                             Text(
        //                               "wind Direction",
        //                               style: TextStyle(
        //                                   color: Colors.white.withOpacity(.6),
        //                                   fontSize: 17,
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ],
        //                         ),
        //                       )
        //                     ],
        //                   )
        //                 ],
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        //               child: Row(
        //                 children: [
        //                   Expanded(
        //                     child: Column(
        //                       children: [
        //                         Text(
        //                           "Gust",
        //                           style: TextStyle(
        //                               color: Colors.white.withOpacity(.6),
        //                               fontSize: 17,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                         const SizedBox(
        //                           height: 5,
        //                         ),
        //                         const Text(
        //                           "17.5 kp/h",
        //                           style: TextStyle(
        //                             color: Colors.white,
        //                             fontSize: 20,
        //
        //                           ),
        //                         ),
        //                         const SizedBox(
        //                           height: 20,
        //                         ),
        //                         Text(
        //                           "pressure",
        //                           style: TextStyle(
        //                               color: Colors.white.withOpacity(.6),
        //                               fontSize: 17,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                         const SizedBox(
        //                           height: 5,
        //                         ),
        //                         const Text(
        //                           "1011.0 hpa",
        //                           style: TextStyle(
        //                             color: Colors.white,
        //                             fontSize: 20,
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                   Expanded(
        //                     child: Column(
        //                       children: [
        //                         Text(
        //                           "UV",
        //                           style: TextStyle(
        //                               color: Colors.white.withOpacity(.6),
        //                               fontSize: 17,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                         const SizedBox(
        //                           height: 10,
        //                         ),
        //                         const Text(
        //                           "1.0",
        //                           style: TextStyle(
        //                               color: Colors.white,
        //                               fontSize: 20,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                         const SizedBox(
        //                           height: 20,
        //                         ),
        //                         Text(
        //                           "precipitation",
        //                           style: TextStyle(
        //                               color: Colors.white.withOpacity(.6),
        //                               fontSize: 17,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                         const SizedBox(
        //                           height: 10,
        //                         ),
        //                         const Text(
        //                           "0.0 mm",
        //                           style: TextStyle(
        //                               color: Colors.white,
        //                               fontSize: 20,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                   Expanded(
        //                     child: Column(
        //                       children: [
        //                         Text(
        //                           "Wind",
        //                           style: TextStyle(
        //                               color: Colors.white.withOpacity(.6),
        //                               fontSize: 17,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                         const SizedBox(
        //                           height: 10,
        //                         ),
        //                         const Text(
        //                           "17.5 km/h",
        //                           style: const TextStyle(
        //                               color: Colors.white,
        //                               fontSize: 20,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                         const SizedBox(
        //                           height: 20,
        //                         ),
        //                         Text(
        //                           "last update",
        //                           style: TextStyle(
        //                               color: Colors.white.withOpacity(.6),
        //                               fontSize: 17,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                         const SizedBox(
        //                           height: 10,
        //                         ),
        //                         Text(
        //                           "${DateFormat(" yyyy-MM-dd").format(DateTime.now())}",
        //                           style: const TextStyle(
        //                               color: Colors.green,
        //                               fontSize: 20,
        //                               fontWeight: FontWeight.bold),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ])),
        // ),

      ),
      );

  }
}
