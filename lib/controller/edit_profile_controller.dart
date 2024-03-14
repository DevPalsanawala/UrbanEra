import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../config/image.dart';
import '../config/text_string.dart';

class EditProfileController extends GetxController {
  TextEditingController firstNameController = TextEditingController(text: TextString.rajan);
  TextEditingController lastNameController = TextEditingController(text: TextString.sharma);
  TextEditingController mobileNumberController = TextEditingController(text: TextString.rajanMobileNumber);
  TextEditingController changeMobileController = TextEditingController(text: TextString.rajanMobileNumber);
  TextEditingController pinController = TextEditingController();
  final FocusNode pinFocusNode = FocusNode();
  final FocusNode focusNode = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  RxBool isTextTapped = false.obs;
  RxBool isTextTapped2 = false.obs;
  RxBool isTextTapped3 = false.obs;
  RxInt selectedContainerIndex = 0.obs;
  DateTime? selectedDate;
  final isButtonEnabled = RxBool(false);
  final showError = RxBool(false);
  final isPhoneNumber = RxBool(false);
  RxString mobileNumber = ''.obs;
  RxString pickedImagePath = ''.obs;
  RxBool switchValue = false.obs;

  void resetFocus() {
    focusNode.unfocus();
    isTextTapped.value = false;
    focusNode2.unfocus();
    isTextTapped2.value = false;
    focusNode3.unfocus();
    isTextTapped3.value = false;
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

  void navigateBackAndReset() {
    resetFocus();
    Get.back();
    firstNameController.clear();
    lastNameController.clear();
    mobileNumberController.clear();
  }

  void selectContainer(int index) {
    if (selectedContainerIndex.value == index) {
      selectedContainerIndex.value = 0;
    } else {
      selectedContainerIndex.value = index;
    }
  }

  String getContainerImage(int index) {
    return selectedContainerIndex.value == index
        ? ImageConfig.fillRound
        : ImageConfig.emptyRound;
  }

  List<String> genderTypes = [
    TextString.male,
    TextString.female,
  ];

  final RxInt _seconds = 120.obs;
  late Timer _timer;
  final RxBool _timerRunning = false.obs;
  final RxBool timerCompleted = false.obs;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    if (!_timerRunning.value) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_seconds.value > 0) {
          _seconds.value -= 1;
        } else {
          timer.cancel();
          _timerRunning.value = false;
          timerCompleted.value = true;
        }
      });
      _timerRunning.value = true;
    }
  }

  void restartTimer() {
    _seconds.value = 120;
    timerCompleted.value = false;
    startTimer();
  }

  String getFormattedTime() {
    int seconds = _seconds.value;
    int minutes = seconds ~/ 60;
    seconds = seconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel();
  }

  Future<void> openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImagePath.value = pickedFile.path;
    }
  }
}