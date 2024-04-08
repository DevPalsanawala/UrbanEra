import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/colors.dart';
import 'package:UrbanEraFashion/config/text_string.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';

DarkModeController darkModeController = Get.put(DarkModeController());

class ButtonController extends GetxController {
  final RxString buttonLabel = TextString.textButtonAddToBag.obs;
  RxBool isCartVisible = false.obs;
  final RxBool showFirstContent = true.obs;
  bool showToast = true;

  void toggleCartVisibility() {
    isCartVisible.value = !isCartVisible.value;
  }

  void toggleContainer() {
    showFirstContent.toggle();
  }

  void addToBag() async {
    Fluttertoast.showToast(
      msg: TextString.addedToBag,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: darkModeController.isLightTheme.value
          ? ColorsConfig.buttonColor
          : ColorsConfig.secondaryColor,
      textColor: darkModeController.isLightTheme.value
          ? ColorsConfig.secondaryColor
          : ColorsConfig.buttonColor,
    );
    buttonLabel.value = TextString.textButtonViewBag;
  }
}
