import 'package:get/get.dart';

import '../config/image.dart';
import '../config/text_string.dart';

class SaveForLaterController extends GetxController {

  RxList<int> itemQuantities = List.generate(3, (index) => 1).obs;
  RxBool searchBoolean = false.obs;

  void incrementCounter(int index) {
    itemQuantities[index]++;
  }

  void decrementCounter(int index) {
    if (itemQuantities[index] > 1) {
      itemQuantities[index]--;
    }
  }

  List<String> bagProducts = [
    ImageConfig.trendingP2,
    ImageConfig.trendingP3,
    ImageConfig.leatherHandbag,
  ];

  List<String> bagProductsTitle = [
    TextString.mintJeansShirt,
    TextString.whiteSofa,
    TextString.leatherHandbag,
  ];

  List<String> bagProductsSubtitle = [
    TextString.mintShiner,
    TextString.softAndHighQuality,
    TextString.latestColor,
  ];

  List<String> bagProductsPrice = [
    TextString.dollar260,
    TextString.dollar5160,
    TextString.dollar245point10,
  ];
}