// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/bag_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/button_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/home_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/wishlist_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/routes/app_routes.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/bag/widget/remove_bag_bottom_sheet.dart';
import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';

class BagView extends StatelessWidget {
  BagView({Key? key}) : super(key: key);

  WishlistController wishlistController = Get.put(WishlistController());
  BagController bagController = Get.put(BagController());
  HomeController homeController = Get.put(HomeController());
  DarkModeController darkModeController = Get.put(DarkModeController());
  ButtonController buttonController = Get.put(ButtonController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return wishlistController.showFirstContent.value
            ? Scaffold(
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
                    child: Text(
                      TextString.bag,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamily.lexendMedium,
                        fontSize: FontSize.heading4,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(
                        // top: SizeConfig.padding05,
                        right: SizeConfig.padding24,
                      ),
                      child: Image(
                        image: const AssetImage(ImageConfig.search),
                        width: SizeConfig.width20,
                        height: SizeConfig.height20,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.only(
                    top: SizeConfig.padding20,
                    left: SizeConfig.padding24,
                    right: SizeConfig.padding24,
                  ),
                  child: Column(
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
                            image: const AssetImage(ImageConfig.cartFill),
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
                        TextString.bagIsEmpty,
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
                          TextString.bagIsEmptyDescription,
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
                  ),
                ),
              )
            : Scaffold(
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
                    child: !bagController.searchBoolean.value
                        ? Row(
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
                              TextString.bag,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamily.lexendMedium,
                                fontSize: FontSize.heading4,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                          ],
                        )
                        : _searchTextField(),
                  ),
                  actions: [
                    Obx(() => Padding(
                      padding: const EdgeInsets.only(
                        right: SizeConfig.padding24,
                      ),
                      child: !bagController.searchBoolean.value
                          ? GestureDetector(
                        onTap: () {
                          bagController.searchBoolean.value = true;
                        },
                        child: Image(
                          image: const AssetImage(ImageConfig.search),
                          width: SizeConfig.width20,
                          height: SizeConfig.height20,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      )
                          : GestureDetector(
                        onTap: () {
                          bagController.searchBoolean.value = false;
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
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: SizeConfig.padding20,
                          left: SizeConfig.padding24,
                          right: SizeConfig.padding24,
                        ),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: SizeConfig.padding20,
                              ),
                              child: Container(
                                height: SizeConfig.height140,
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    const EdgeInsets.all(SizeConfig.padding12),
                                decoration: BoxDecoration(
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.secondaryColor
                                      : ColorsConfig.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadius14,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  Image(
                                                    image: AssetImage(
                                                      bagController.bagProducts[index],
                                                    ),
                                                    width: SizeConfig.width65,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: SizeConfig.padding10,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          bagController.bagProductsTitle[index],
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: FontFamily
                                                                .lexendMedium,
                                                            fontSize:
                                                                FontSize.body2,
                                                            color: darkModeController.isLightTheme.value
                                                                ? ColorsConfig.primaryColor
                                                                : ColorsConfig.secondaryColor,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height:
                                                              SizeConfig.height06,
                                                        ),
                                                        Text(
                                                          bagController.bagProductsSubtitle[index],
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontFamily: FontFamily
                                                                .lexendLight,
                                                            fontSize:
                                                                FontSize.body3,
                                                            color: darkModeController.isLightTheme.value
                                                                ? ColorsConfig.textColor
                                                                : ColorsConfig.modeInactiveColor,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height:
                                                              SizeConfig.height12,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              bagController.bagProductsPrice[index],
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily: FontFamily
                                                                    .lexendRegular,
                                                                fontSize: FontSize
                                                                    .body2,
                                                                color: darkModeController.isLightTheme.value
                                                                    ? ColorsConfig.primaryColor
                                                                    : ColorsConfig.secondaryColor,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Obx(
                                                () => Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        bagController
                                                            .decrementCounter(
                                                                index);
                                                      },
                                                      child: Image(
                                                        image: AssetImage(
                                                          darkModeController.isLightTheme.value
                                                            ? ImageConfig.minus
                                                            : ImageConfig.minusDark,
                                                        ),
                                                        width: SizeConfig.width22,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: SizeConfig.width08,
                                                    ),
                                                    SizedBox(
                                                      width: SizeConfig.width15,
                                                      child: Text(
                                                        bagController
                                                            .itemQuantities[index]
                                                            .toString(),
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: FontFamily
                                                              .lexendMedium,
                                                          fontSize: FontSize.body3,
                                                          color: darkModeController.isLightTheme.value
                                                              ? ColorsConfig.primaryColor
                                                              : ColorsConfig.secondaryColor,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: SizeConfig.width08,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        bagController
                                                            .incrementCounter(
                                                                index);
                                                      },
                                                      child: Image(
                                                        image: AssetImage(
                                                          darkModeController.isLightTheme.value
                                                              ? ImageConfig.plus
                                                              : ImageConfig.plusDark,
                                                        ),
                                                        width: SizeConfig.width22,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: SizeConfig.height12,
                                          ),
                                          Divider(
                                            color: darkModeController.isLightTheme.value
                                                ? ColorsConfig.lineColor
                                                : ColorsConfig.lineDarkColor,
                                            height: 0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.height25,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              removeBagBottomSheet(context);
                                            },
                                            child: Text(
                                              TextString.remove,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontFamily: FontFamily.lexendLight,
                                                fontSize: FontSize.body3,
                                                color: darkModeController.isLightTheme.value
                                                    ? ColorsConfig.primaryColor
                                                    : ColorsConfig.secondaryColor,
                                              ),
                                            ),
                                          ),
                                          VerticalDivider(
                                            color: darkModeController.isLightTheme.value
                                                ? ColorsConfig.lineColor
                                                : ColorsConfig.lineDarkColor,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Fluttertoast.showToast(
                                                msg: TextString.saved,
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
                                            child: Text(
                                              TextString.saveForLater,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontFamily: FontFamily.lexendLight,
                                                fontSize: FontSize.body3,
                                                color: darkModeController.isLightTheme.value
                                                    ? ColorsConfig.primaryColor
                                                    : ColorsConfig.secondaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: SizeConfig.height198,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(
                          left: SizeConfig.padding24,
                          top: SizeConfig.padding12,
                          bottom: SizeConfig.padding12,
                          right: SizeConfig.padding24,
                        ),
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.secondaryColor
                            : ColorsConfig.primaryColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  TextString.total,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontFamily.lexendMedium,
                                    fontSize: FontSize.body1,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: SizeConfig.height24,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      TextString.price2Items,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: FontFamily.lexendLight,
                                        fontSize: FontSize.body2,
                                        color: darkModeController.isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                      ),
                                    ),
                                    Text(
                                      TextString.dollar720,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: FontFamily.lexendRegular,
                                        fontSize: FontSize.body2,
                                        color: darkModeController.isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: SizeConfig.height12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      TextString.discount,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: FontFamily.lexendLight,
                                        fontSize: FontSize.body2,
                                        color: darkModeController.isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                      ),
                                    ),
                                    Text(
                                      TextString.dollar20,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: FontFamily.lexendRegular,
                                        fontSize: FontSize.body2,
                                        color: darkModeController.isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: SizeConfig.height12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      TextString.deliveryCharges,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: FontFamily.lexendLight,
                                        fontSize: FontSize.body2,
                                        color: darkModeController.isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                      ),
                                    ),
                                    Text(
                                      TextString.freeDelivery,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: FontFamily.lexendRegular,
                                        fontSize: FontSize.body2,
                                        color: darkModeController.isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.lineColor
                                  : ColorsConfig.lineDarkColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  TextString.totalAmount,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontSize: FontSize.body1,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                                Text(
                                  TextString.dollar700,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontFamily.lexendMedium,
                                    fontSize: FontSize.body2,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: SizeConfig.padding24,
                          right: SizeConfig.padding24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TextString.recommendedProducts,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: FontSize.heading4,
                                fontFamily: FontFamily.lexendMedium,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            Text(
                              TextString.seeMore,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: FontSize.body3,
                                fontFamily: FontFamily.lexendRegular,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.textColor
                                    : ColorsConfig.modeInactiveColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height24,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: SizeConfig.padding24,
                          right: SizeConfig.padding24,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                              const EdgeInsets.only(bottom: SizeConfig.padding12),
                              child: Container(
                                height: SizeConfig.height80,
                                width: double.infinity,
                                padding: const EdgeInsets.all(SizeConfig.padding11),
                                decoration: BoxDecoration(
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.secondaryColor
                                      : ColorsConfig.primaryColor,
                                  borderRadius:
                                  BorderRadius.circular(SizeConfig.borderRadius14),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              homeController.mostPopularImage[index]),
                                          height: SizeConfig.height56,
                                          width: SizeConfig.width64,
                                        ),
                                        const SizedBox(
                                          width: SizeConfig.width12,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              homeController.mostPopularTitle[index],
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
                                              homeController.mostPopularSubtitle[index],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: FontSize.body3,
                                                fontFamily: FontFamily.lexendLight,
                                                color: darkModeController.isLightTheme.value
                                                    ? ColorsConfig.textColor
                                                    : ColorsConfig.modeInactiveColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      homeController.mostPopularPrice[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: FontSize.body2,
                                        fontFamily: FontFamily.lexendMedium,
                                        color: darkModeController.isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: SizeConfig.padding24,
                          right: SizeConfig.padding24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TextString.exploreNewProducts,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: FontSize.heading4,
                                fontFamily: FontFamily.lexendMedium,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            Text(
                              TextString.seeMore,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: FontSize.body3,
                                fontFamily: FontFamily.lexendRegular,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.textColor
                                    : ColorsConfig.modeInactiveColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height24,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: SizeConfig.padding24,
                          right: SizeConfig.padding24,
                        ),
                        child: SizedBox(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: SizeConfig.padding24,
                              crossAxisSpacing: SizeConfig.padding24,
                              mainAxisExtent: SizeConfig.height224,
                            ),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              final imageNewIndex = index;
                              return Container(
                                width: SizeConfig.width159,
                                padding: const EdgeInsets.all(SizeConfig.padding11),
                                decoration: BoxDecoration(
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.secondaryColor
                                      : ColorsConfig.primaryColor,
                                  borderRadius:
                                  BorderRadius.circular(SizeConfig.borderRadius14),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(
                                      child: Image(
                                        image: AssetImage(
                                          homeController.newArrivedImage[index],
                                        ),
                                        width: SizeConfig.width111,
                                        height: SizeConfig.height120,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          homeController.newArrivedTitle[index],
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
                                          homeController.newArrivedSubtitle[index],
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
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              homeController.newArrivedPrice[index],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: FontSize.body2,
                                                fontFamily: FontFamily.lexendMedium,
                                                color: darkModeController.isLightTheme.value
                                                    ? ColorsConfig.primaryColor
                                                    : ColorsConfig.secondaryColor,
                                              ),
                                            ),
                                            Obx(
                                                  () => GestureDetector(
                                                onTap: () {
                                                  bagController.toggleArrivalFavorite(
                                                      imageNewIndex);
                                                },
                                                child: Image(
                                                  image: AssetImage(
                                                    bagController
                                                        .isFavouriteArrivalList[
                                                    imageNewIndex]
                                                        .value
                                                        ? ImageConfig.favourite
                                                        : ImageConfig.likeFill,
                                                  ),
                                                  width: SizeConfig.width18,
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
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height20,
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: Container(
                  height: SizeConfig.height94,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.backgroundColor
                        : ColorsConfig.primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: .1,
                        blurRadius: SizeConfig.height15,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: SizeConfig.padding24,
                      right: SizeConfig.padding24,
                      top: SizeConfig.padding18,
                      bottom: SizeConfig.padding24,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.height52,
                          width: SizeConfig.width116,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              SizeConfig.borderRadius14,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                TextString.dollar720,
                                style: TextStyle(
                                  fontSize: FontSize.body3,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: FontFamily.lexendLight,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.textColor
                                      : ColorsConfig.modeInactiveColor,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Text(
                                TextString.dollar700,
                                style: TextStyle(
                                  fontSize: FontSize.heading5,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: FontFamily.lexendMedium,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: SizeConfig.width14,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.orderSummaryView);
                            },
                            child: Container(
                              height: SizeConfig.height52,
                              width: SizeConfig.width212,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadius14),
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  TextString.textButtonPlaceOrder,
                                  style: TextStyle(
                                    fontSize: FontSize.body1,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontFamily.lexendMedium,
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
                  ),
                ),
              );
      },
    );
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
