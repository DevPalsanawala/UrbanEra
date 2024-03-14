// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/bottom_navigation_controller.dart';
import '../routes/app_routes.dart';

BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());

class OrderSummaryController extends GetxController {
  RxInt itemQuantity = 1.obs;

  void incrementQuantity() {
    itemQuantity++;
  }

  void decrementQuantity() {
    if (itemQuantity > 0) {
      itemQuantity--;

      if (itemQuantity == 0) {
        goToTab(1);
      }
    }
  }

  void goToTab(int tabIndex) {
    bottomNavigationController.changePage(tabIndex);
    Get.toNamed(AppRoutes.bottomView);
  }
}