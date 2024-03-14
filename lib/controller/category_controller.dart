import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/image.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';

class CategoryController extends GetxController {

  bool isAppBarVisible = true;
  RxList<bool> isCheckedList = List.generate(5, (index) => false).obs;
  RxList<bool> isCheckedTopList = List.generate(4, (index) => false).obs;
  RxList<bool> isCheckedTopAllList = List.generate(9, (index) => false).obs;
  RxBool searchBoolean = false.obs;
  late ScrollController scrollController;
  RxBool showElevation = false.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (scrollController.offset > 0 && !showElevation.value) {
      showElevation.value = true;
    } else if (scrollController.offset <= 0 && showElevation.value) {
      showElevation.value = false;
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void toggleCheckbox(int index) {
    isCheckedList[index] = !isCheckedList[index];
  }

  void resetFilters() {
    for (int i = 0; i < isCheckedList.length; i++) {
      isCheckedList[i] = false;
    }
  }

  void toggleTopCheckbox(int index) {
    isCheckedTopList[index] = !isCheckedTopList[index];
  }

  void resetTopFilters() {
    for (int i = 0; i < isCheckedTopList.length; i++) {
      isCheckedTopList[i] = false;
    }
  }

  void toggleTopAllCheckbox(int index) {
    isCheckedTopAllList[index] = !isCheckedTopAllList[index];
  }

  void resetTopAllFilters() {
    for (int i = 0; i < isCheckedTopAllList.length; i++) {
      isCheckedTopAllList[i] = false;
    }
  }

  List<String> categoriesImageList = [
    ImageConfig.fashion,
    ImageConfig.mobile,
    ImageConfig.homeDecor,
    ImageConfig.electronics,
    ImageConfig.shoesNike,
    ImageConfig.kitchenAppliances,
  ];

  List<String> categoriesList = [
    TextString.fashions,
    TextString.mobiles,
    TextString.home,
    TextString.electronics,
    TextString.shoes,
    TextString.kitchen,
  ];

  List<String> categoriesSubTitle = [
    TextString.fashionDescription,
    TextString.mobileDescription,
    TextString.homeDescription,
    TextString.electronicsDescription,
    TextString.shoesDescription,
    TextString.kitchenDescription,
  ];

  List<String> categoriesAllList = [
    TextString.menCategory,
    TextString.womenCategory,
    TextString.boysCategory,
    TextString.girlsCategory,
    TextString.infantsCategory,
  ];

  List<String> topCategoriesList = [
    TextString.tShirtsCategory,
    TextString.shirtsCategory,
    TextString.jeansCategory,
    TextString.hoodiesCategory,
  ];

  List<String> topAllCategoriesList = [
    TextString.ethnicCategory,
    TextString.suitCategory,
    TextString.blazerCategory,
    TextString.jeansAllCategory,
    TextString.kurtasCategory,
    TextString.sweatShirtsCategory,
    TextString.shirtsAllCategory,
    TextString.trackSuitsCategory,
  ];
}