import 'package:flutter/material.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/styles/media_query.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:  Color(0xff081b25),
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
                size: context.height30,
              ),
              title: Text(
                'Favourite Location',
                style:
                    TextStyle(color: Colors.white, fontSize: context.height20),
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
            SizedBox(height: context.height30),
            ListTile(
              leading: Icon(
                Icons.add_location,
                color:Colors.white,
                size: context.height15,
              ),
              title: Text(
                'Favourite Location',
                style:
                TextStyle(color: Colors.white, fontSize: context.height20),
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
                Icons.add_location_outlined,
                color: Colors.white,
                size: context.height30,
              ),
              title: Text(
                'Other Locations',
                style:
                    TextStyle(color: Colors.white, fontSize: context.height20),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: context.height10 / 5),
            ),
            SizedBox(height: context.height30),
            GestureDetector(
              onTap: () {
                // Preferences().pickCountry(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: context.height30 * 2,
                    vertical: context.height10),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(context.height30),
                    gradient: const LinearGradient(
                    colors: [ Color(0xff955cd1), Color(0xff3fa2fa)],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  stops: [.2, .85])
                ),
                child: Center(
                  child: Text(
                    'Manage Locations',
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
                Icons.star_half,
                color: Colors.white,
                size: context.height30,
              ),
              title: Text(
                'Switch Mode',
                style:
                    TextStyle(color: Colors.white, fontSize: context.height20),
              ),
              // trailing: DayNightSwitcher(
              //     isDarkModeEnabled:
              //         BlocProvider.of<ThemeBloc>(context).state.isDark,
              //     onStateChanged: (isDarkModeEnabled) {
              //       BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(
              //           theme: isDarkModeEnabled
              //               ? AppTheme.dark
              //               : AppTheme.light));
              //     }),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: context.height10 / 5),
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                color: Colors.white,
                size: context.height30,
              ),
              title: Text(
                'Report wrong location',
                style:
                    TextStyle(color: Colors.white, fontSize: context.height20),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: context.height10 / 5),
            ),
            ListTile(
              leading: Icon(
                Icons.headset_mic_outlined,
                color: Colors.white,
                size: context.height30,
              ),
              title: Text(
                'Contact us',
                style:
                    TextStyle(color: Colors.white, fontSize: context.height20),
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


