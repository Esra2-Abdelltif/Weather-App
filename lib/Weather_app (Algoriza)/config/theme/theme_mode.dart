import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/Weather_app%20(Algoriza)/Core/utils/colors.dart';


enum AppTheme {
  light,
  dark,
}

final appThemeData = {
  AppTheme.light: ThemeData(

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
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.black),
        bodyText2:  TextStyle(fontSize: 16, color: Colors.black),
        headline1:TextStyle(fontSize: 30, color: Colors.black54, fontWeight: FontWeight.w600,),
        headline2: TextStyle(fontWeight: FontWeight.w300,color: Color(0xFF8D8E98)),
      ),
      iconTheme: IconThemeData(color:  Colors.grey.shade400),

      drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white
    )
  ),

  AppTheme.dark: ThemeData(
      backgroundColor: AppColors.colorSplash,
      scaffoldBackgroundColor: AppColors.colorSplash,
      iconTheme: IconThemeData( color: Colors.grey.shade400),
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

      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.white,),
        bodyText2:  TextStyle(fontSize: 16, color: Colors.white),
        headline1:TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600,),
        headline2: TextStyle(fontWeight: FontWeight.w300,color: AppColors.whiteColor),
      ),



      drawerTheme:  DrawerThemeData(
          backgroundColor: AppColors.colorSplash
    )
  ),
};