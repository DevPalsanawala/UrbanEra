import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/colors.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';

class FiltersController extends GetxController {

  int selectedIdx = 0;

  final selectedColorIndices = <int>[].obs;
  final selectedColorCount = 0.obs;

  bool isSelected(int index) {
    return selectedColorIndices.contains(index);
  }

  void toggleColorSelection(int index) {
    if (selectedColorIndices.contains(index)) {
      selectedColorIndices.remove(index);
      decreaseCount(index);
    } else {
      selectedColorIndices.add(index);
      increaseCount(index);
    }
  }

  void increaseCount(int index) {
    selectedColorCount.value++;
  }

  void decreaseCount(int index) {
    selectedColorCount.value--;
  }

  void resetFilters() {
    selectedColorIndices.clear();
    selectedColorCount.value = 0;
  }

  List<String> filtersList = [
    TextString.deliveryFilter,
    TextString.categoriesFilter,
    TextString.colorsFilter,
    TextString.sizeFilter,
    TextString.priceFilter,
    TextString.discountFilter,
    TextString.sortByFilter,
    TextString.reviewFilter,
    TextString.newArrivalsFilter,
  ];

  List<Color> colorsList = [
    ColorsConfig.blackColor,
    ColorsConfig.redColor,
    ColorsConfig.greenColor,
    ColorsConfig.blueColor,
    ColorsConfig.yellowColor,
    ColorsConfig.greyColor,
    ColorsConfig.purpleColor,
    ColorsConfig.pinkColor,
    ColorsConfig.cyanColor,
    ColorsConfig.greenAccentColor,
    ColorsConfig.indigoColor,
    ColorsConfig.yellowAccentColor,
    ColorsConfig.amberColor,
    ColorsConfig.blueGreyColor,
    ColorsConfig.brownColor,
  ];
}