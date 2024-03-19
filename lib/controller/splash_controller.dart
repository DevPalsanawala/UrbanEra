import 'dart:async';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 5),
        () => Get.offAllNamed(AppRoutes.onBoardingView));
  }
}
