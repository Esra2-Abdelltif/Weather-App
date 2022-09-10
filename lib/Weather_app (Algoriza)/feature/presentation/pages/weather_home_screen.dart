import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/service/service_locator.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/app_constance.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/weather_event.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/pages/Search_Screen.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/custom_drawer.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/home_body_widgets.dart';

class WeatherHomeScreen extends StatelessWidget {
  late String cityName='suez';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (BuildContext context) => sl<WeatherBloc>()..add(GetHourlyWeatherEvent())..add(GetCurrentWeatherEvent())..add(GetDailyWeatherEvent()),

      child: Scaffold(
      //  backgroundColor: const Color(0xff081b25),
        drawer:CustomDrawer(),
        body: HomeBodyWidgets(),
        appBar: AppBar(
          backgroundColor:AppColors.blueColor ,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon:  Icon(
                  Icons.menu,
                  color: AppColors.whiteColor,
                  // Changing Drawer Icon Size
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),

          elevation: 0,
          actions:  [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: (){
                NavigateTo(context: context,router: SearchScreen());
                },
                  child: Icon(Icons.search,color: AppColors.whiteColor,)),
            ),
          ],

        ),


      ),
      );

  }
}
