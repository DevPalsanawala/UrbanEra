import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/colors.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/font_family.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/font_size.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/image.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/size.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/button_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/currentuser_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/product_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/whishlist_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/category/fashion_details_view.dart';

class Searchpage extends StatelessWidget {
  Searchpage({super.key, this.txt});
  final txt;
  var data;
  Productcontroller productcontroller = Get.put(Productcontroller());
  WishlistController1 wishlistController1 = Get.put(WishlistController1());

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    if (txt == "Caps" || txt == "Kurta") {
      data = "none";
    } else {
      data = txt;
    }
    User? user = userController.currentUser.value;
    Map<String, dynamic> userData = userController.userData.value;
    return Scaffold(
      backgroundColor: darkModeController.isLightTheme.value
          ? ColorsConfig.backgroundColor
          : ColorsConfig.buttonColor,
      appBar: AppBar(
        backgroundColor: darkModeController.isLightTheme.value
            ? ColorsConfig.backgroundColor
            : ColorsConfig.buttonColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(
            left: SizeConfig.padding05,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image(
                  image: const AssetImage(ImageConfig.backArrow),
                  width: SizeConfig.width24,
                  height: SizeConfig.height24,
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.primaryColor
                      : ColorsConfig.secondaryColor,
                ),
              ),
              const SizedBox(
                width: SizeConfig.width10,
              ),
              Text(
                "Results for ${txt}",
                style: TextStyle(
                  fontFamily: FontFamily.lexendMedium,
                  fontSize: FontSize.heading4,
                  fontWeight: FontWeight.w500,
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.primaryColor
                      : ColorsConfig.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24,
          top: 15,
          right: 24,
          bottom: 12,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Obx(() {
            final List<Map<String, dynamic>> newarrived = productcontroller
                .produts
                .where((product) => product['sub_category'] == '${data}')
                .toList();

            if (newarrived.isEmpty) {
              return Center(
                child: Text(
                  "No Items Found",
                  style: TextStyle(
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                ),
              );
            } else {
              return SizedBox(
                child: GridView.builder(
                  semanticChildCount: null,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: SizeConfig.padding24,
                    crossAxisSpacing: SizeConfig.padding24,
                    mainAxisExtent: 280,
                  ),
                  itemCount: newarrived.length,
                  itemBuilder: (context, index) {
                    final imageNewIndex = index;
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FashionDetailsView(
                              product: newarrived[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 159,
                        padding: const EdgeInsets.only(
                          top: 0,
                          bottom: 14,
                          left: 15,
                          right: 15,
                        ),
                        decoration: BoxDecoration(
                          // color: Colors.grey.shade500,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.secondaryColor
                              : ColorsConfig.primaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image(
                                image: AssetImage(
                                    'assets/admin_site_images/all final images with background removed/${newarrived[index]['img']}'),
                                height: 190,
                                width: 190,
                              ),
                            ),
                            SizedBox(height: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // maxLines: 2,
                                  // softWrap: true,
                                  // overflow: TextOverflow
                                  //     .ellipsis,
                                  newarrived[index]['title'],
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    fontFamily: FontFamily.lexendMedium,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 02,
                                ),
                                Text(
                                  // maxLines: 1,
                                  // softWrap: true,
                                  // overflow: TextOverflow
                                  //     .ellipsis,
                                  newarrived[index]['subtitle'],
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    fontFamily: FontFamily.lexendLight,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ('\u{20B9} ${newarrived[index]['price']}'),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        fontFamily: FontFamily.lexendMedium,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                      ),
                                    ),
                                    Obx(() {
                                      final isInWishlist =
                                          wishlistController1.isAddedMap[
                                                  newarrived[index]['id']] ??
                                              false;
                                      return GestureDetector(
                                        onTap: () {
                                          wishlistController1
                                              .toggleWishlistItem(
                                                  user!.uid, newarrived[index]);
                                        },
                                        child: Image(
                                          image: AssetImage(
                                            !isInWishlist
                                                ? darkModeController
                                                        .isLightTheme.value
                                                    ? ImageConfig.favourite
                                                    : ImageConfig
                                                        .favouriteUnfill
                                                : darkModeController
                                                        .isLightTheme.value
                                                    ? ImageConfig.likeFill
                                                    : ImageConfig.favouriteFill,
                                          ),
                                          width: SizeConfig.width18,
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
