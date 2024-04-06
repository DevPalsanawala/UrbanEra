// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/image.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxString keyword = ''.obs;
  RxBool hasKeyword = false.obs;

  void updateKeyword(String value) {
    keyword.value = value;
    hasKeyword.value = value.isNotEmpty;
  }

  void clearKeyword() {
    keyword.value = '';
  }

  final List<RxBool> isFavouriteList = List.generate(6, (_) => true.obs);
  final List<RxBool> isFavouriteArrivalList = List.generate(4, (_) => true.obs);
  final List<RxBool> isFavouriteArrival2List =
      List.generate(4, (_) => true.obs);
  RxList<bool> isCheckedList = List.generate(8, (index) => false).obs;

  void resetFilters() {
    for (int i = 0; i < isCheckedList.length; i++) {
      isCheckedList[i] = false;
    }
  }

  void toggleCheckbox(int index) {
    isCheckedList[index] = !isCheckedList[index];
  }

  void toggleFavorite(int imageIndex) {
    isFavouriteList[imageIndex].value = !isFavouriteList[imageIndex].value;
  }

  void toggleArrivalFavorite(int imageArrivalIndex) {
    isFavouriteArrivalList[imageArrivalIndex].value =
        !isFavouriteArrivalList[imageArrivalIndex].value;
  }

  void toggleArrival2Favorite(int imageArrival2Index) {
    isFavouriteArrival2List[imageArrival2Index].value =
        !isFavouriteArrival2List[imageArrival2Index].value;
  }

  Future<void> openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print('Image path: ${pickedFile.path}');
    } else {
      print('No image selected.');
    }
  }

  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      print('Image path: ${pickedFile.path}');
    } else {
      print('No image taken.');
    }
  }

  List<String> trendingProductsImage = [
    ImageConfig.trendingP2,
    ImageConfig.trendingP1,
    ImageConfig.trendingP4,
    ImageConfig.trendingP3,
    ImageConfig.trendingP6,
    ImageConfig.trendingP5,
  ];

  List<String> trendingProductsTitle = [
    TextString.mintJeansShirt,
    TextString.silentHeadphone,
    TextString.smartWatch,
    TextString.whiteSofa,
    TextString.leatherHandbag,
    TextString.leatherShoes,
  ];

  List<String> trendingProductsSubtitle = [
    TextString.mintShiner,
    TextString.mintBlack,
    TextString.stylishAndLatest,
    TextString.softAndHighQuality,
    TextString.latestColor,
    TextString.pumaSpecialShoes,
  ];

  List<String> trendingProductsPrice = [
    TextString.dollar790,
    TextString.dollar460,
    TextString.dollar1460,
    TextString.dollar5160,
    TextString.dollar245,
    TextString.dollar260,
  ];

  List<String> mostPopularImage = [
    ImageConfig.mostPopularP1,
    ImageConfig.mostPopularP2,
    ImageConfig.mostPopularP3,
  ];

  List<String> mostPopularTitle = [
    TextString.nikeAirMax,
    TextString.sugaLeatherShoes,
    TextString.pumaSneakersShoes,
  ];

  List<String> mostPopularSubtitle = [
    TextString.mintCreamy,
    TextString.blackMint,
    TextString.blackAndRedCombination,
  ];

  List<String> mostPopularPrice = [
    TextString.dollar100,
    TextString.dollar258,
    TextString.dollar576,
  ];

  List<String> newArrivedImage = [
    ImageConfig.trendingP1,
    ImageConfig.trendingP3,
    ImageConfig.newArrivedP1,
    ImageConfig.newArrivedP2,
  ];

  List<String> newArrivedTitle = [
    TextString.silentHeadphone,
    TextString.whiteSofa,
    TextString.leatherShoes,
    TextString.leatherHandbag,
  ];

  List<String> newArrivedSubtitle = [
    TextString.mintBlack,
    TextString.softAndHighQuality,
    TextString.pumaSpecialShoes,
    TextString.latestColor,
  ];

  List<String> newArrivedPrice = [
    TextString.dollar460,
    TextString.dollar5160,
    TextString.dollar260,
    TextString.dollar245,
  ];

  List<String> filterList = [
    TextString.trendingF,
    TextString.todaysDealsF,
    TextString.newArrived,
    TextString.topSellingF,
    TextString.highPriceF,
    TextString.lowPriceF,
    TextString.bestOffersF,
    TextString.bestSellingF,
  ];
}
