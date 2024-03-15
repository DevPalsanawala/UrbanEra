import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';

import '../config/image.dart';

class OnBoardingModel {
  String? title;
  String? description;
  String? image;

  OnBoardingModel({this.title, this.description, this.image});
}

DarkModeController darkModeController = Get.put(DarkModeController());

List<OnBoardingModel> onBoardingModelList = [
  OnBoardingModel(
    title: TextString.discover,
    description: TextString.onBoard1,
    image: darkModeController.isLightTheme.value
        ? ImageConfig.onBoard1
        : ImageConfig.onBoardDark1,
  ),
  OnBoardingModel(
    title: TextString.purchase,
    description: TextString.onBoard2,
    image: darkModeController.isLightTheme.value
        ? ImageConfig.onBoard2
        : ImageConfig.onBoardDark2,
  ),
  OnBoardingModel(
    title: TextString.delivery,
    description: TextString.onBoard3,
    image: darkModeController.isLightTheme.value
        ? ImageConfig.onBoard3
        : ImageConfig.onBoardDark3,
  ),
];
