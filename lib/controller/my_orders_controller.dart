import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/image.dart';
import 'package:UrbanEraFashion/config/text_string.dart';

class MyOrdersController extends GetxController {

  RxBool contentChanged = false.obs;
  RxBool searchBoolean = false.obs;

  void toggleContent() {
    contentChanged.value = !contentChanged.value;
  }

  RxList<bool> isCheckedTopList = List.generate(4, (index) => false).obs;
  RxList<bool> isCheckedTopAllList = List.generate(9, (index) => false).obs;
  final List<RxBool> isFavouriteArrivalList = List.generate(4, (_) => true.obs);

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

  void toggleArrivalFavorite(int imageArrivalIndex) {
    isFavouriteArrivalList[imageArrivalIndex].value = !isFavouriteArrivalList[imageArrivalIndex].value;
  }

  List<String> ordersImage = [
    ImageConfig.trendingP2,
    ImageConfig.fashion4,
    ImageConfig.fashion1,
  ];

  List<String> ordersTitle = [
    TextString.mintJeansShirt,
    TextString.kidsWestern,
    TextString.jeansShirt,
  ];

  List<String> ordersSubtitle = [
    TextString.mintShiner,
    TextString.mintBlack,
    TextString.mintBlack,
  ];

  List<String> filterOrderStatusList = [
    TextString.onTheWay,
    TextString.delivered,
    TextString.cancelled,
    TextString.returned,
  ];

  List<String> filterOrderDateList = [
    TextString.last30Days,
    TextString.last3Months,
    TextString.year2023,
    TextString.year2022,
    TextString.year2021,
    TextString.year2020,
    TextString.year2019,
    TextString.year2018,
    TextString.year2017,
  ];
}