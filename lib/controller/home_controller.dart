// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:UrbanEraFashion/config/image.dart';
import 'package:UrbanEraFashion/config/text_string.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxString keyword = ''.obs;
  RxBool hasKeyword = false.obs;

  List<String> imageSearchTerms = <String>[
    "Tshirt",
    "Shirt",
    "Pants",
    "Shorts",
    "Shoes",
    "Socks",
    "Dress",
    "Cap",
    "Kurta"
  ];

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

  String getClothCategory(String phrase) {
    phrase = phrase.replaceAll('T-shirt', 'Tshirt');
    phrase = phrase.replaceAll('T-Shirt', 'Tshirt');
    int index = imageSearchTerms.indexWhere((element) {
      debugPrint(
          '${phrase.toLowerCase()} | ${element.toLowerCase()} || ${phrase.toLowerCase().contains(element.toLowerCase())}');

      return phrase.toLowerCase().contains(element.toLowerCase());
    });

    if (index == -1) {
      Get.back();
      Get.snackbar('Oops!', 'Clothes category not found!');
      return '';
    }

    return imageSearchTerms[index];
  }

  Future<String> openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print('Image path: ${pickedFile.path}');
      String phrase = await uploadImageAndGeneratePhrase(pickedFile.path);
      if (phrase == 'Error') return '';

      return getClothCategory(phrase);
    } else {
      print('No image taken.');
      return '';
    }
  }

  Future<String> openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 30,
        maxHeight: 500,
        maxWidth: 500);

    if (pickedFile != null) {
      print('Image path: ${pickedFile.path}');
      String phrase = await uploadImageAndGeneratePhrase(pickedFile.path);
      if (phrase == 'Error') return '';

      return getClothCategory(phrase);
    } else {
      print('No image taken.');
      return '';
    }
  }

  Future<String> uploadImageAndGeneratePhrase(String imagePath) async {
    try {
      File imageFile = File(imagePath);
      List<int> imageBytes = await imageFile.readAsBytes();
      String imageB64 = base64Encode(imageBytes);

      debugPrint('image size --> ${imageFile.lengthSync()}');

      Map<String, String> headers = {
        "Authorization":
            "Bearer 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",
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      Map<String, dynamic> payload = {
        "messages": [
          {
            "role": "user",
            // What category of cloth does this image relates the best from these categories
            // I have categories of clothes or attire, now u have to decide from scale 1 to 10. What categories from these ("Tshirt", "Dress", "Kurta", "Cap", "Shirt", "Pants", "Shorts", "Shoes", "Socks"), matches the cloth in the image and name only one category, keep only that category and make the output response of one word only, remove everything else?
            "content":
                'Which type of cloth, attire or apparel (shoes, socks etc..) category this image contains or matches the most? Respond in only word <img src="data:image/png;base64,$imageB64" />'
          }
        ],
        "max_tokens": 500,
        "temperature": 0.20,
        "top_p": 0.20
      };

      http.Response response = await http.post(
          Uri.parse('https://ai.api.nvidia.com/v1/vlm/microsoft/kosmos-2'),
          headers: headers,
          body: json.encode(payload));

      debugPrint('response --> ${response.body}');

      if (response.statusCode != 200) throw response.reasonPhrase ?? '';

      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> choices = jsonResponse['choices'];
      if (choices.isEmpty) throw response.reasonPhrase ?? '';

      String content = choices[0]['message']['content'];
      return content;
    } catch (error) {
      Get.back();
      Get.snackbar('Oops!', 'Something went wrong while doing image search');
      debugPrint('Error ---> $error');
      return 'Error';
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
