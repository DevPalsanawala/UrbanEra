import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardDetailsController extends GetxController {
  final FocusNode focusNode = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  RxBool isTextTapped = false.obs;
  RxBool isTextTapped2 = false.obs;
  RxBool isTextTapped3 = false.obs;
  RxBool isTextTapped4 = false.obs;
  final isButtonEnabled = RxBool(false);
  final isImageToggled = false.obs;

  void resetFocus() {
    focusNode.unfocus();
    isTextTapped.value = false;
    focusNode2.unfocus();
    isTextTapped2.value = false;
    focusNode3.unfocus();
    isTextTapped3.value = false;
    focusNode4.unfocus();
    isTextTapped4.value = false;
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

  void navigateBackAndReset() {
    resetFocus();
    Get.back();
    nameController.clear();
    cardNumberController.clear();
    expiryController.clear();
    cvvController.clear();
  }

  void checkButtonEnabled() {
    isButtonEnabled.value = nameController.text.isNotEmpty &&
        cardNumberController.text.isNotEmpty &&
        expiryController.text.isNotEmpty &&
        cvvController.text.isNotEmpty;
  }

  void toggleImage() {
    isImageToggled.value = !isImageToggled.value;
  }
}