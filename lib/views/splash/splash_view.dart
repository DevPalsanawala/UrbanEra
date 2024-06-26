// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/image.dart';
import 'package:UrbanEraFashion/config/size.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/controller/splash_controller.dart';

import '../../config/colors.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);

  SplashController splashController = Get.put(SplashController());
  DarkModeController darkModeController = Get.put(DarkModeController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Obx(() => Scaffold(
            backgroundColor: darkModeController.isLightTheme.value
                ? ColorsConfig.backgroundColor
                : ColorsConfig.buttonColor,
            body: Center(
              child: Image(
                image: AssetImage(
                  darkModeController.isLightTheme.value
                      ? 'assets/images/logowhite.png'
                      : 'assets/images/logoblack.png',
                ),
                width: 350,
                height: 350,
              ),
            ),
          )),
    );
  }
}
