import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/image.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';

class RatingAndReviewController extends GetxController {

  RxList<bool> isCheckedList = List.generate(5, (index) => false).obs;

  void toggleCheckbox(int index) {
    isCheckedList[index] = !isCheckedList[index];
  }

  void resetFilters() {
    for (int i = 0; i < isCheckedList.length; i++) {
      isCheckedList[i] = false;
    }
  }

  List<String> reviewImage = [
    ImageConfig.reviewMan1,
    ImageConfig.reviewMan2,
    ImageConfig.reviewMan3,
    ImageConfig.reviewMan4,
  ];

  List<String> reviewName = [
    TextString.codyFisher,
    TextString.jacobJones,
    TextString.kristinWatson,
    TextString.jennyWilson,
  ];

  List<String> reviewDay = [
    TextString.days5Ago,
    TextString.month4Ago,
    TextString.month8Ago,
    TextString.month11Ago,
  ];

  List<String> reviewDescription = [
    TextString.review1,
    TextString.review2,
    TextString.review3,
    TextString.review4,
  ];

  List<String> ratingStarImages = [
    ImageConfig.star5,
    ImageConfig.ratings,
    ImageConfig.star3,
    ImageConfig.star2,
    ImageConfig.star1,
  ];

  List<String> ratingStarDarkImages = [
    ImageConfig.star5Dark,
    ImageConfig.ratingDark,
    ImageConfig.star3Dark,
    ImageConfig.star2Dark,
    ImageConfig.star1Dark,
  ];
}