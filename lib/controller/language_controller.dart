import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/text_string.dart';

import '../config/image.dart';

class LanguageController extends GetxController {

  RxInt selectedContainerIndex = (-1).obs;
  RxBool searchBoolean = false.obs;

  void selectContainer(int index) {
    if (selectedContainerIndex.value == index) {
      selectedContainerIndex.value = -1;
    } else {
      selectedContainerIndex.value = index;
    }
  }

  String getContainerImage(int index) {
    return selectedContainerIndex.value == index
        ? ImageConfig.fillRound
        : ImageConfig.emptyRound;
  }

  List<String> languagesList = [
    TextString.language1,
    TextString.language2,
    TextString.language3,
    TextString.language4,
    TextString.language5,
    TextString.language6,
    TextString.language7,
    TextString.language8,
    TextString.language9,
  ];
}