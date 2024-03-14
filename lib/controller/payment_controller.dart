import 'package:get/get.dart';

class PaymentController extends GetxController {
  final isImageToggled = false.obs;

  void toggleImage() {
    isImageToggled.value = !isImageToggled.value;
  }
}