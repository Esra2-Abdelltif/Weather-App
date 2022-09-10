import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/hex_color.dart';

ThemeData DarkTheme() {
  return ThemeData(
      // primaryColor: AppColors.primary,
      // hintColor: AppColors.hint,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.colorSplash,
      iconTheme: IconThemeData(color: Colors.white),
      //fontFamily: AppStrings.fontFamily,
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:  Colors.transparent,
            statusBarIconBrightness:Brightness.light,


          ),
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black, fontSize: 20)),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
            height: 1.3,
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ));
}






ThemeData darkthemes = ThemeData(

  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.white,),
    bodyText2:  TextStyle(fontSize: 16, color: Colors.white),
    headline1:TextStyle(fontSize: 30, color: Colors.black54, fontWeight: FontWeight.w600,),
    headline2: TextStyle(fontWeight: FontWeight.w300,color: Color(0xFF8D8E98)),
  ),


  scaffoldBackgroundColor: AppColors.colorSplash,
  iconTheme: IconThemeData(color: Colors.white),
  appBarTheme: AppBarTheme(
    titleSpacing: 15,
    iconTheme: IconThemeData(color: Colors.white),
    //backwardsCompatibility: false,
    backgroundColor: AppColors.colorSplash,
    elevation: 0,
    titleTextStyle: TextStyle(
      color:Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      //fontStyle: FontStyle.italic
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:  Colors.transparent,
      statusBarIconBrightness:Brightness.light,


    ),
  ),



  drawerTheme: DrawerThemeData(backgroundColor: AppColors.colorSplash ),



);






ThemeData lightthemes = ThemeData(

  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 15,
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color:Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:Colors.transparent,
      statusBarIconBrightness:Brightness.dark,

    ),
  ),

  drawerTheme: DrawerThemeData(backgroundColor: Colors.white, ),
  textTheme: TextTheme(
    bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.black),
    bodyText2:  TextStyle(fontSize: 16, color: Colors.black),
    headline1:TextStyle(fontSize: 30, color: Colors.black54, fontWeight: FontWeight.w600,),
    headline2: TextStyle(fontWeight: FontWeight.w300,color: Color(0xFF8D8E98)),

  ),



);