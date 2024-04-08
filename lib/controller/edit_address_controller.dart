import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/text_string.dart';

import '../config/image.dart';

class EditAddressController extends GetxController {
  final FocusNode focusNode = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  final FocusNode focusNode6 = FocusNode();
  final FocusNode focusNode7 = FocusNode();
  final FocusNode focusNode8 = FocusNode();
  TextEditingController nameController = TextEditingController(text: TextString.janeCooper);
  TextEditingController mobileNumberController = TextEditingController(text: TextString.addressMobile1);
  TextEditingController pinCodeController = TextEditingController(text: TextString.pinCodeEdit);
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController houseController = TextEditingController(text: TextString.houseNoEdit);
  TextEditingController areaController = TextEditingController();
  TextEditingController landMarkController = TextEditingController(text: TextString.landMarkEdit);
  RxBool isTextTapped = false.obs;
  RxBool isTextTapped2 = false.obs;
  RxBool isTextTapped3 = false.obs;
  RxBool isTextTapped4 = false.obs;
  RxBool isTextTapped5 = false.obs;
  RxBool isTextTapped6 = false.obs;
  RxBool isTextTapped7 = false.obs;
  RxBool isTextTapped8 = false.obs;
  RxInt selectedContainerIndex = (-1).obs;
  final isButtonEnabled = RxBool(false);
  final Geolocator geolocator = Geolocator();
  Position? currentPosition;

  void resetFocus() {
    focusNode.unfocus();
    isTextTapped.value = false;
    focusNode2.unfocus();
    isTextTapped2.value = false;
    focusNode3.unfocus();
    isTextTapped3.value = false;
    focusNode4.unfocus();
    isTextTapped4.value = false;
    focusNode5.unfocus();
    isTextTapped5.value = false;
    focusNode6.unfocus();
    isTextTapped6.value = false;
    focusNode7.unfocus();
    isTextTapped7.value = false;
    focusNode8.unfocus();
    isTextTapped8.value = false;
  }

  void onTapText() {
    resetFocus();
    isTextTapped.value = true;
    focusNode.requestFocus();
  }

  void onTapText2() {
    resetFocus();
    isTextTapped2.value = true;
    focusNode2.requestFocus();
  }

  void onTapText3() {
    resetFocus();
    isTextTapped3.value = true;
    focusNode3.requestFocus();
  }

  void onTapText4() {
    resetFocus();
    isTextTapped4.value = true;
    focusNode4.requestFocus();
  }

  void onTapText5() {
    resetFocus();
    isTextTapped5.value = true;
    focusNode5.requestFocus();
  }

  void onTapText6() {
    resetFocus();
    isTextTapped6.value = true;
    focusNode6.requestFocus();
  }

  void onTapText7() {
    resetFocus();
    isTextTapped7.value = true;
    focusNode7.requestFocus();
  }

  void onTapText8() {
    resetFocus();
    isTextTapped8.value = true;
    focusNode8.requestFocus();
  }

  void navigateBackAndReset() {
    resetFocus();
    Get.back();
    nameController.clear();
    mobileNumberController.clear();
    pinCodeController.clear();
    stateController.clear();
    cityController.clear();
    houseController.clear();
    areaController.clear();
    landMarkController.clear();
  }

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

  void checkButtonEnabled() {
    isButtonEnabled.value = nameController.text.isNotEmpty &&
        mobileNumberController.text.isNotEmpty &&
        pinCodeController.text.isNotEmpty &&
        stateController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        houseController.text.isNotEmpty &&
        areaController.text.isNotEmpty;
  }

  List<String> addressTypes = [
    TextString.home,
    TextString.work,
    TextString.office,
  ];
}
