import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 5), () => checkIfUserIsLoggedIn());
    // Get.offAllNamed(AppRoutes.onBoardingView));
  }

  void checkIfUserIsLoggedIn() async {
    User? user = FirebaseAuth.instance.currentUser; // Get the current user
    if (user != null) {
      // If user is not null, user is logged in
      Get.offAllNamed(AppRoutes.bottomView); // Navigate to home page
    } else {
      // If user is null, user is not logged in
      Get.offAllNamed(AppRoutes.onBoardingView); // Navigate to onboarding page
    }
  }
}
