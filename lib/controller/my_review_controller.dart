import 'package:get/get.dart';

import '../config/image.dart';
import '../config/text_string.dart';

class MyReviewController extends GetxController {
  RxBool searchBoolean = false.obs;

  List<String> reviewImage = [
    ImageConfig.smartWatch,
    ImageConfig.mostPopularP3,
    ImageConfig.fashion1,
    ImageConfig.electronics,
  ];

  List<String> reviewName = [
    TextString.reviewTitle1,
    TextString.reviewTitle2,
    TextString.reviewTitle3,
    TextString.reviewTitle4,
  ];

  List<String> reviewDay = [
    TextString.days5Ago,
    TextString.month4Ago,
    TextString.month8Ago,
    TextString.month11Ago,
  ];

  List<String> reviewDescription = [
    TextString.reviewSubtitle1,
    TextString.reviewSubtitle2,
    TextString.reviewSubtitle3,
    TextString.reviewSubtitle4,
  ];

  List<String> ratingStarImages = [
    ImageConfig.star5,
    ImageConfig.ratings,
    ImageConfig.star3,
    ImageConfig.star5,
  ];

  List<String> ratingStarDarkImages = [
    ImageConfig.starDark,
    ImageConfig.starDark,
    ImageConfig.starDark,
    ImageConfig.starDark,
  ];

  List<String> reviewLikes = [
    TextString.reviewLike1,
    TextString.reviewLike2,
    TextString.reviewLike3,
    TextString.reviewLike2,
  ];
}