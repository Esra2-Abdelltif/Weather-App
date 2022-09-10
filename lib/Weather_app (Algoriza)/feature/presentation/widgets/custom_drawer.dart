import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/app_constance.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/media_query.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/strings.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/config/theme/cubit/cubit.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/cubit/search_by_city_screen.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/pages/Search_Screen.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/favouriteLocation.dart';

import '../../../config/theme/cubit/states.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.colorSplash,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(context.height15),
          bottomRight: Radius.circular(context.height15),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.height10,
          horizontal: context.height15,
        ),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.settings_outlined,
                color: Colors.white,
                size: context.height30,
              ),
            ),
            SizedBox(height: context.height30),
            ListTile(
              leading: Icon(
                Icons.star_rounded,
                color: Colors.white,
                size: 25,
              ),
              title: Text(
                AppStrings.favouriteLocation,
                style:
                    TextStyle(color: Colors.white, fontSize:18),
              ),
              trailing: Icon(
                Icons.info_outline,
                color: Colors.white,
                size: context.height30,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: context.height10 / 5),
            ),
            SizedBox(height: context.height20),

            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: FavouriteLocation(),
            ),
            SizedBox(height: context.height20),
            Row(
              children: List.generate(
                  1000 ~/ 10,
                  (index) => Expanded(
                        child: Container(
                          color: index % 2 == 0
                              ? Colors.transparent
                              : Colors.white54,
                          height: 2,
                        ),
                      )),
            ),
            SizedBox(height: context.height20),
            GestureDetector(
              onTap: () {
                NavigateTo(context: context,router: SearchScreen());
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: context.height30 * 1,
                    vertical: context.height10),
                decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  borderRadius: BorderRadius.circular(context.height30),

                ),
                child: Center(
                  child: Text(
                    AppStrings.manageLocations,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: context.height20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: context.height20),
            Row(
              children: List.generate(
                  1000 ~/ 10,
                  (index) => Expanded(
                        child: Container(
                          color: index % 2 == 0
                              ? Colors.transparent
                              : Colors.white54,
                          height: 2,
                        ),
                      )),
            ),
            SizedBox(height: context.height20),

            ListTile(
              leading: Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 25,
              ),
              title: Text(
                'Report wrong location',
                style:
                    TextStyle(color: Colors.white, fontSize: 18),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: context.height10 / 5),
            ),
            ListTile(
              leading: Icon(
                Icons.headset_mic_outlined,
                color: Colors.white,
                size: 25
              ),
              title: Text(
                'Contact us',
                style:
                    TextStyle(color: Colors.white, fontSize: 18),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: context.height10 / 5),
            ),
          ],
        ),
      ),
    );
  }
}


class SwitchTheme extends StatelessWidget {
  const SwitchTheme({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
         return BlocProvider(
      create:  ((context) => ThemeAppCubit()),
      child: BlocConsumer<ThemeAppCubit, ThemeAppStates>(
        listener: (BuildContext context, ThemeAppStates state) {
          if(state is AppChangeModeState ){
          };
        },
        builder: (BuildContext context,  ThemeAppStates state) {
          return CupertinoSwitch(
            value: ThemeAppCubit.get(context).IsDark,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (value) {
              ThemeAppCubit.get(context).ChangeAppMode();

            },
          );
        },
      ),
    );
  }
}