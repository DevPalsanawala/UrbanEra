// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/routes/app_routes.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/splash/splash_view.dart';

import 'binding/bindingdata.dart';

class ShoppersEcommerceApp extends StatelessWidget {
  ShoppersEcommerceApp({super.key}) {
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
      title: "Shoppers Ecommerce UI",
    );
  }
}
