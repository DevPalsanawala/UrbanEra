import 'package:get/get.dart';

class PaymentController extends GetxController {
  final isImageToggled = false.obs;
  final isonlinePayment = false.obs;

  void toggleImage() {
    isImageToggled.value = !isImageToggled.value;
  }

  void onlinepayment() {
    isonlinePayment.value = !isonlinePayment.value;
  }
}
