import 'package:get/get.dart';
// import 'package:UrbanEraFashion/controller/wishlist_controller.dart';
import 'package:UrbanEraFashion/controllermy/category_controller.dart';
import 'package:UrbanEraFashion/controllermy/currentuser_controller.dart';
import 'package:UrbanEraFashion/controllermy/product_controller.dart';
import 'package:UrbanEraFashion/controllermy/whishlist_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    /// -- Product Controllers
    Get.put(Productcontroller(), permanent: true);
    Get.put(Categorycontroller(), permanent: true);
    Get.put(UserController(), permanent: true);

    // Get.put(WishlistController1(), permanent: true);

    // Get.put(ProductController(), permanent: true);
    // Get.put(CartController(), permanent: true);
    // Get.put(CheckoutController(), permanent: true);
    // Get.put(CategoryController(), permanent: true);
    // Get.put(BrandController(), permanent: true);

    // /// -- User Controllers
    // Get.put(UserController(), permanent: true);
    // Get.put(AddressController(), permanent: true);
  }
}
