import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/app_constance.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/media_query.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/strings.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/config/theme/bloc_themes/theme_bloc.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/config/theme/theme_mode.dart';

import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/manager/cubit/search_by_city_screen.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/pages/Search_Screen.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/feature/presentation/widgets/favouriteLocation.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                size: context.height30,
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(height: context.height30),
            ListTile(
              leading: Icon(
                Icons.star_rounded,
                size: context.height30,
                color: Colors.grey.shade400,
              ),
              title: Text(
                AppStrings.favouriteLocation,
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                Icons.info_outline,
                color: Colors.grey.shade400,
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
                              : Colors.grey.shade400,
                          height: 2,
                        ),
                      )),
            ),
            SizedBox(height: context.height20),
            GestureDetector(
              onTap: () {
                NavigateTo(context: context, router: SearchScreen());
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
                        color: AppColors.whiteColor,
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
                              : Colors.grey.shade400,
                          height: 2,
                        ),
                      )),
            ),
            SizedBox(height: context.height20),
            ListTile(
              leading: Icon(
                Icons.dark_mode,
                size: context.height30,
                color:   Colors.grey.shade400,

              ),
              title: Text(
                'Mode',
                style: TextStyle(fontSize: 18),
              ),
              trailing: DayNightSwitcher(
                  isDarkModeEnabled:
                      BlocProvider.of<ThemeBloc>(context).state.isDark,
                  onStateChanged: (isDarkModeEnabled) {
                    BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(
                        theme: isDarkModeEnabled
                            ? AppTheme.dark
                            : AppTheme.light));
                  }),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: context.height10 / 5),
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                color:   Colors.grey.shade400,
                size: context.height30,
              ),
              title: Text(
                'Report wrong location',
                style: TextStyle(fontSize: 18),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: context.height10 / 5),
            ),
            ListTile(
              leading: Icon(
                Icons.headset_mic_outlined,
                size: context.height30,
                color:   Colors.grey.shade400,

              ),
              title: Text(
                'Contact us',
                style: TextStyle(fontSize: 18),
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

// class SwitchTheme extends StatelessWidget {
//   const SwitchTheme({ Key? key,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//          return BlocProvider(
//       create:  ((context) => ThemeAppCubit()),
//       child: BlocConsumer<ThemeAppCubit, ThemeAppStates>(
//         listener: (BuildContext context, ThemeAppStates state) {
//           if(state is AppChangeModeState ){
//           };
//         },
//         builder: (BuildContext context,  ThemeAppStates state) {
//           return CupertinoSwitch(
//             value: ThemeAppCubit.get(context).IsDark,
//             activeColor: Theme.of(context).primaryColor,
//             onChanged: (value) {
//               ThemeAppCubit.get(context).ChangeAppMode();
//
//             },
//           );
//         },
//       ),
//     );
//   }
// }
