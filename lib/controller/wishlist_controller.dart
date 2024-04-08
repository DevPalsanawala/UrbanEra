import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/image.dart';
import 'package:UrbanEraFashion/config/text_string.dart';

class WishlistController extends GetxController {

  RxBool showBottomBar = false.obs;
  final RxBool showFirstContent = true.obs;
  RxBool searchBoolean = false.obs;

  void toggleContent() {
    showFirstContent.toggle();
  }

  List<String> wishListProducts = [
    ImageConfig.fashion1,
    ImageConfig.smartWatch,
    ImageConfig.leatherHandbag,
    ImageConfig.trendingP3,
  ];

  List<String> wishListProductsName = [
    TextString.jeansShirt,
    TextString.smartWatch,
    TextString.leatherHandbag,
    TextString.whiteSofa,
  ];

  List<String> wishListProductsDescription = [
    TextString.mintBlack,
    TextString.stylishAndLatest,
    TextString.latestColor,
    TextString.softAndHighQuality,
  ];

  List<String> wishlistProductsPrice = [
    TextString.dollar260,
    TextString.dollar1460,
    TextString.dollar245point10,
    TextString.dollar5160,
  ];
}