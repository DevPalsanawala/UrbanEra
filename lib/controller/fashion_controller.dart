import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/image.dart';

import '../config/colors.dart';
import '../config/text_string.dart';

class FashionController extends GetxController {
  final ScrollController scrollController = ScrollController();
  bool showTitle = false;
  final List<RxBool> isFavouriteList = List.generate(200, (_) => true.obs);
  RxBool isFashionFavouriteList = true.obs;
  RxBool searchBoolean = false.obs;

  void toggleFavorite(int imageIndex) {
    isFavouriteList[imageIndex].value = !isFavouriteList[imageIndex].value;
  }

  void toggleFashionFavorite() {
    isFashionFavouriteList.value = !isFashionFavouriteList.value;
  }

  void resetState() {
    scrollController.removeListener(() {});
    showTitle = false;
  }

  RxInt currentPage = 0.obs;

  final PageController pageFashionController = PageController();

  @override
  void onInit() {
    super.onInit();
    pageFashionController.addListener(() {
      currentPage.value = (pageFashionController.page?.round() ?? 0);
    });
    selectedSize.value = sizesList.isNotEmpty ? sizesList[0] : '';
    selectedSizeshoes.value =
        sizesListshoes.isNotEmpty ? sizesListshoes[0] : '';
  }

  RxInt selectedColorIndex = (-1).obs;

  void selectColor(int index) {
    selectedColorIndex.value = index;
  }

  RxInt selectedSizeIndex = (-1).obs;
  RxString selectedSize = RxString('');

  void selectSize(int index) {
    selectedSizeIndex.value = index;
    selectedSize.value = sizesList[index];
  }

  RxInt selectedSizeIndexShoes = (-1).obs;
  RxString selectedSizeshoes = RxString('');

  void selectSizeshoes(int index) {
    selectedSizeIndexShoes.value = index;
    selectedSizeshoes.value = sizesListshoes[index];
  }

  List<String> fashionImageList = [
    ImageConfig.fashion1,
    ImageConfig.fashion2,
    ImageConfig.fashion3,
    ImageConfig.fashion4,
    ImageConfig.fashion5,
    ImageConfig.fashion6,
    ImageConfig.trendingP2,
  ];

  List<String> fashionTitle = [
    TextString.jeansTShirt,
    TextString.tShirts,
    TextString.generic,
    TextString.kidsWestern,
    TextString.fashionDress,
    TextString.fashionSarees,
    TextString.mintJeansShirt,
  ];

  List<String> fashionSubtitle = [
    TextString.mintBlack,
    TextString.blackColor,
    TextString.mintBlack,
    TextString.creamy,
    TextString.mintBlack,
    TextString.mintBlack,
    TextString.mintShiner,
  ];

  List<String> fashionPrice = [
    TextString.dollar260,
    TextString.dollar460,
    TextString.dollar180,
    TextString.dollar150,
    TextString.dollar559,
    TextString.dollar499,
    TextString.dollar790,
  ];

  List<Color> colorsList = [
    ColorsConfig.blackColor,
    ColorsConfig.redColor,
    ColorsConfig.greenColor,
    ColorsConfig.blueColor,
    ColorsConfig.yellowColor,
    ColorsConfig.greyColor,
  ];

  List<String> sizesList = [
    TextString.sizeS,
    TextString.sizeM,
    TextString.sizeL,
    TextString.sizeXL,
    TextString.sizeXXL,
    TextString.size3XL,
  ];
  List<String> sizesListshoes = [
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
  ];
}
