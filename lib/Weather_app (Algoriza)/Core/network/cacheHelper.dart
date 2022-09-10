import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static Future<bool> putDate({required String key ,required bool value}) async
  {
   return await sharedPreferences!.setBool(key, value);
  }
  static bool? getDate({required String key })
  {
    return  sharedPreferences!.getBool(key);
  }
}

