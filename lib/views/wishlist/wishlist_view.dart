// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/button_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/home_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/wishlist_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/wishlist/widget/remove_wishlist_bottom_sheet.dart';
import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';
import '../../routes/app_routes.dart';

class WishlistView extends StatelessWidget {
  WishlistView({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());
  WishlistController wishlistController = Get.put(WishlistController());
  ButtonController buttonController = Get.put(ButtonController());
  DarkModeController darkModeController = Get.put(DarkModeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
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
            top: SizeConfig.padding10,
            left: SizeConfig.padding10,
          ),
          child: !wishlistController.searchBoolean.value
              ? Text(
                TextString.wishList,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.lexendMedium,
                  fontSize: FontSize.heading4,
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.primaryColor
                      : ColorsConfig.secondaryColor,
                ),
              )
              : _searchTextField(),
        ),
        actions: [
          Obx(() => Padding(
            padding: const EdgeInsets.only(
              // top: SizeConfig.padding05,
              right: SizeConfig.padding24,
            ),
            child: !wishlistController.searchBoolean.value
                ? Row(
              children: [
                GestureDetector(
                  onTap: () {
                    wishlistController.searchBoolean.value = true;
                  },
                  child: Image(
                    image: const AssetImage(ImageConfig.search),
                    width: SizeConfig.width20,
                    height: SizeConfig.height20,
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                ),
                const SizedBox(
                  width: SizeConfig.width18,
                ),
                Image(
                  image: const AssetImage(ImageConfig.cart),
                  width: SizeConfig.width20,
                  height: SizeConfig.height20,
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.primaryColor
                      : ColorsConfig.secondaryColor,
                ),
              ],
            ) : GestureDetector(
              onTap: () {
                wishlistController.searchBoolean.value = false;
              },
              child: Icon(
                Icons.clear_rounded,
                size: SizeConfig.width25,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.primaryColor
                    : ColorsConfig.secondaryColor,
              ),
            ),
          )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: SizeConfig.padding20,
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
        ),
        child: Obx(() {
          return buttonController.showFirstContent.value
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Container(
                    width: SizeConfig.width70,
                    height: SizeConfig.height70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                    ),
                    child: Center(
                      child: Image(
                        image: const AssetImage(ImageConfig.heartFill),
                        width: SizeConfig.width30,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    ),
                  )),
              const SizedBox(
                height: SizeConfig.height20,
              ),
              Text(
                TextString.wishListIsEmpty,
                style: TextStyle(
                  fontFamily: FontFamily.lexendRegular,
                  fontSize: FontSize.heading5,
                  fontWeight: FontWeight.w400,
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.primaryColor
                      : ColorsConfig.secondaryColor,
                ),
              ),
              const SizedBox(
                height: SizeConfig.height08,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: SizeConfig.padding20,
                  right: SizeConfig.padding20,
                ),
                child: Text(
                  TextString.wishListDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontFamily.lexendLight,
                    fontSize: FontSize.body3,
                    fontWeight: FontWeight.w300,
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.textColor
                        : ColorsConfig.modeInactiveColor,
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height32,
              ),
              GestureDetector(
                onTap: () {
                  Get.offAllNamed(AppRoutes.bottomView);
                },
                child: Container(
                  height: SizeConfig.height52,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        SizeConfig.borderRadius14),
                    border: Border.all(
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      TextString.textButtonContinueShopping,
                      style: TextStyle(
                        fontSize: FontSize.body1,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.lexendRegular,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ) : SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                mainAxisExtent: SizeConfig.height262,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  width: SizeConfig.width159,
                  padding: const EdgeInsets.all(SizeConfig.padding11),
                  decoration: BoxDecoration(
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    borderRadius: BorderRadius.circular(
                        SizeConfig.borderRadius14),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage(
                            wishlistController.wishListProducts[index],
                          ),
                          width: SizeConfig.width111,
                          height: SizeConfig.height120,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            wishlistController
                                .wishListProductsName[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendMedium,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height02,
                          ),
                          Text(
                            wishlistController
                                .wishListProductsDescription[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: FontSize.body3,
                              fontFamily: FontFamily.lexendLight,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height10,
                          ),
                          Text(
                            wishlistController
                                .wishlistProductsPrice[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendMedium,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height10,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  removeWishlistBottomSheet(context);
                                },
                                child: Container(
                                  height: SizeConfig.height32,
                                  width: SizeConfig.width32,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: darkModeController.isLightTheme.value
                                          ? ColorsConfig.primaryColor
                                          : ColorsConfig.secondaryColor,
                                      width: SizeConfig.width01,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      SizeConfig.borderRadius08,
                                    ),
                                  ),
                                  child: Center(
                                    child: Image(
                                      image:
                                      const AssetImage(ImageConfig.delete),
                                      width: SizeConfig.width18,
                                      color: darkModeController.isLightTheme.value
                                          ? ColorsConfig.primaryColor
                                          : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: SizeConfig.width08,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    wishlistController.toggleContent();
                                    Fluttertoast.showToast(
                                      msg: TextString.addedToBagToast,
                                      gravity: ToastGravity.BOTTOM,
                                      toastLength: Toast.LENGTH_SHORT,
                                      backgroundColor: darkModeController.isLightTheme.value
                                          ? ColorsConfig.buttonColor
                                          : ColorsConfig.secondaryColor,
                                      textColor: darkModeController.isLightTheme.value
                                          ? ColorsConfig.secondaryColor
                                          : ColorsConfig.buttonColor,
                                    );
                                  },
                                  child: Container(
                                    height: SizeConfig.height32,
                                    decoration: BoxDecoration(
                                      color: darkModeController.isLightTheme.value
                                          ? ColorsConfig.primaryColor
                                          : ColorsConfig.secondaryColor,
                                      borderRadius: BorderRadius.circular(
                                        SizeConfig.borderRadius08,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        TextString.textButtonAddToBag,
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontFamily:
                                          FontFamily.lexendRegular,
                                          fontWeight: FontWeight.w500,
                                          color: darkModeController.isLightTheme.value
                                              ? ColorsConfig.secondaryColor
                                              : ColorsConfig.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }),
      ),
    ));
  }

  Widget _searchTextField() {
    return TextField(
      autofocus: true,
      cursorColor: darkModeController.isLightTheme.value
          ? ColorsConfig.primaryColor
          : ColorsConfig.secondaryColor,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.lexendLight,
        fontSize: FontSize.body1,
        color: darkModeController.isLightTheme.value
            ? ColorsConfig.primaryColor
            : ColorsConfig.secondaryColor,
      ),
      decoration: InputDecoration(
        hintText: TextString.searchHere,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.lexendLight,
          fontSize: FontSize.body1,
          color: darkModeController.isLightTheme.value
              ? ColorsConfig.textColor
              : ColorsConfig.modeInactiveColor,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
