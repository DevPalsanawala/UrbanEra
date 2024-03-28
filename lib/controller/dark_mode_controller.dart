import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeController extends GetxController {
  RxBool isLightTheme = true.obs;

  Future<SharedPreferences> preference = SharedPreferences.getInstance();

  saveThemeStatus() async {
    SharedPreferences pref = await preference;
    pref.setBool('theme', isLightTheme.value);
  }

  getThemeStatus() async {
    var isLight = preference.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? true;
    }).obs;
    isLightTheme.value = await isLight.value;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }
}
