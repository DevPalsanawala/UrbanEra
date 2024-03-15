// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/order_summary_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/routes/app_routes.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';

class OrderSummaryView extends StatelessWidget {
  OrderSummaryView({Key? key}) : super(key: key);

  OrderSummaryController orderSummaryController =
      Get.put(OrderSummaryController());
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
                    TextString.orderSummary,
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
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: SizeConfig.padding24,
              right: SizeConfig.padding24,
              top: SizeConfig.padding20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: SizeConfig.width122,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(SizeConfig.padding12),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TextString.deliveryView,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: FontFamily.lexendRegular,
                                fontSize: FontSize.body2,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.myAddressView);
                              },
                              child: Text(
                                TextString.change,
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
                        Divider(
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.lineColor
                              : ColorsConfig.lineDarkColor,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              TextString.janeCooper,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamily.lexendMedium,
                                fontSize: FontSize.body3,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: SizeConfig.height06,
                            ),
                            Text(
                              TextString.address1,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: FontFamily.lexendLight,
                                fontSize: FontSize.body3,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: SizeConfig.height06,
                            ),
                            Text(
                              TextString.addressMobile1,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: FontFamily.lexendLight,
                                fontSize: FontSize.body3,
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
                    height: SizeConfig.height16,
                  ),
                  Container(
                    height: SizeConfig.height140,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(SizeConfig.padding12),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                          ImageConfig.trendingP2,
                                        ),
                                        width: SizeConfig.width65,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: SizeConfig.padding10,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              TextString.mintJeansShirt,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily:
                                                    FontFamily.lexendMedium,
                                                fontSize: FontSize.body2,
                                                color: darkModeController
                                                        .isLightTheme.value
                                                    ? ColorsConfig.primaryColor
                                                    : ColorsConfig
                                                        .secondaryColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: SizeConfig.height06,
                                            ),
                                            Text(
                                              TextString.mintShiner,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontFamily:
                                                    FontFamily.lexendLight,
                                                fontSize: FontSize.body3,
                                                color: darkModeController
                                                        .isLightTheme.value
                                                    ? ColorsConfig.textColor
                                                    : ColorsConfig
                                                        .modeInactiveColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: SizeConfig.height12,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  TextString.dollar260,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: FontFamily
                                                        .lexendRegular,
                                                    fontSize: FontSize.body2,
                                                    color: darkModeController
                                                            .isLightTheme.value
                                                        ? ColorsConfig
                                                            .primaryColor
                                                        : ColorsConfig
                                                            .secondaryColor,
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
                                            orderSummaryController
                                                .decrementQuantity();
                                          },
                                          child: Image(
                                            image: AssetImage(
                                              darkModeController
                                                      .isLightTheme.value
                                                  ? ImageConfig.minus
                                                  : ImageConfig.minusDarkMode,
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
                                            orderSummaryController.itemQuantity
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontFamily:
                                                  FontFamily.lexendMedium,
                                              fontSize: FontSize.body3,
                                              color: darkModeController
                                                      .isLightTheme.value
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
                                            orderSummaryController
                                                .incrementQuantity();
                                          },
                                          child: Image(
                                            image: AssetImage(
                                              darkModeController
                                                      .isLightTheme.value
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  TextString.deliveryDate,
                                  style: TextStyle(
                                    fontSize: FontSize.body3,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontWeight: FontWeight.w400,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                                Text(
                                  TextString.freeDelivery,
                                  style: TextStyle(
                                    fontSize: FontSize.body3,
                                    fontFamily: FontFamily.lexendLight,
                                    fontWeight: FontWeight.w300,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.offersAndPromotionsView);
                    },
                    child: Container(
                      height: SizeConfig.height52,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding12,
                        right: SizeConfig.padding12,
                      ),
                      decoration: BoxDecoration(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.secondaryColor
                            : ColorsConfig.primaryColor,
                        borderRadius: BorderRadius.circular(
                          SizeConfig.borderRadius14,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: const AssetImage(ImageConfig.offer),
                                width: SizeConfig.width16,
                                height: SizeConfig.height16,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                              const SizedBox(
                                width: SizeConfig.width08,
                              ),
                              Text(
                                TextString.offersAndPromotions,
                                style: TextStyle(
                                  fontSize: FontSize.body2,
                                  fontFamily: FontFamily.lexendRegular,
                                  fontWeight: FontWeight.w400,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            TextString.textButtonApply,
                            style: TextStyle(
                              fontSize: FontSize.body3,
                              fontFamily: FontFamily.lexendLight,
                              fontWeight: FontWeight.w300,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  Container(
                    height: SizeConfig.height198,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                      left: SizeConfig.padding12,
                      top: SizeConfig.padding12,
                      bottom: SizeConfig.padding12,
                      right: SizeConfig.padding12,
                    ),
                    decoration: BoxDecoration(
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                      borderRadius: BorderRadius.circular(
                        SizeConfig.borderRadius14,
                      ),
                    ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  TextString.price1Items,
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
                                  TextString.dollar260,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  TextString.dollar10,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              TextString.dollar250,
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
                ],
              ),
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
                  blurRadius: SizeConfig.width15,
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
                          TextString.dollar260,
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
                          TextString.dollar250,
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
                        Get.toNamed(AppRoutes.paymentView);
                      },
                      child: Container(
                        height: SizeConfig.height52,
                        width: SizeConfig.width212,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(SizeConfig.borderRadius14),
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
        ));
  }
}
