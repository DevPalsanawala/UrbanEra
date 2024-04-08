// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/routes/app_routes.dart';
import 'package:UrbanEraFashion/views/splash/splash_view.dart';

import 'binding/bindingdata.dart';

class UrbanEraFashion extends StatelessWidget {
  UrbanEraFashion({super.key}) {
    darkModeController.getThemeStatus();
  }

  DarkModeController darkModeController = Get.put(DarkModeController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: SplashView(),
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      title: "UrbanEraFashion",
    );
  }
}
