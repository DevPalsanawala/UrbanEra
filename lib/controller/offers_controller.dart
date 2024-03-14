import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';

class OffersController extends GetxController {
  RxBool searchBoolean = false.obs;
  RxBool searchBoolean2 = false.obs;

  List<String> offersPercentage = [
    TextString.offer30,
    TextString.offer80,
    TextString.offer10,
    TextString.offer50,
    TextString.offer80,
    TextString.offer18,
    TextString.offer50,
  ];

  List<String> offersDescription = [
    TextString.offer1,
    TextString.offer2,
    TextString.offer3,
    TextString.offer4,
    TextString.offer5,
    TextString.offer6,
    TextString.offer1,
  ];

  List<String> offersCode = [
    TextString.code1,
    TextString.code2,
    TextString.code3,
    TextString.code4,
    TextString.code2,
    TextString.code5,
    TextString.code6,
  ];

  List<String> offersCodeMode = [
    TextString.useCode,
    TextString.useCode,
    TextString.useCode,
    TextString.cashBack,
    TextString.useCode,
    TextString.cashBack,
    TextString.useCode,
  ];

  List<String> paymentOffersPercentage = [
    TextString.offer80,
    TextString.offer10,
    TextString.offers20,
    TextString.offer50,
  ];

  List<String> paymentOffersDescription = [
    TextString.offer2,
    TextString.offer2,
    TextString.offer7,
    TextString.offer1,
  ];

  List<String> paymentOffersCode = [
    TextString.code2,
    TextString.code3,
    TextString.code2,
    TextString.code2,
  ];
}