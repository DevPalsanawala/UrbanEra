// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';

import '../../../../config/colors.dart';
import '../../../../config/font_family.dart';
import '../../../../config/font_size.dart';
import '../../../../config/image.dart';
import '../../../../config/size.dart';
import '../../../../config/text_string.dart';

class OrderStatusView extends StatelessWidget {
  OrderStatusView({Key? key}) : super(key: key);

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
                TextString.orderStatus,
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
          top: SizeConfig.padding24,
        ),
        child: Stack(
          children: [
            Container(
              height: SizeConfig.height446,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                left: SizeConfig.padding12,
                top: SizeConfig.padding16,
                right: SizeConfig.padding12,
                bottom: SizeConfig.padding12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.secondaryColor
                    : ColorsConfig.primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: SizeConfig.width28,
                        height: SizeConfig.height28,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsConfig.buttonColor,
                        ),
                        child: const Center(
                          child: Image(
                            image: AssetImage(ImageConfig.bagCheck),
                            width: SizeConfig.width16,
                            height: SizeConfig.height16,
                            color: ColorsConfig.secondaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height01,
                      ),
                      Container(
                        width: SizeConfig.width01,
                        height: SizeConfig.height155,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.lineDarkColor,
                      ),
                      const SizedBox(
                        height: SizeConfig.height01,
                      ),
                      Container(
                        width: SizeConfig.width28,
                        height: SizeConfig.height28,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsConfig.buttonColor,
                        ),
                        child: const Center(
                          child: Image(
                            image: AssetImage(ImageConfig.scooter),
                            width: SizeConfig.width16,
                            height: SizeConfig.height16,
                            color: ColorsConfig.secondaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height01,
                      ),
                      Container(
                        width: SizeConfig.width01,
                        height: SizeConfig.height71,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.lineDarkColor,
                      ),
                      const SizedBox(
                        height: SizeConfig.height01,
                      ),
                      Container(
                        width: SizeConfig.width28,
                        height: SizeConfig.height28,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsConfig.buttonColor,
                        ),
                        child: const Center(
                          child: Image(
                            image: AssetImage(ImageConfig.scooter),
                            width: SizeConfig.width16,
                            height: SizeConfig.height16,
                            color: ColorsConfig.secondaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height01,
                      ),
                      Container(
                        width: SizeConfig.width01,
                        height: SizeConfig.height28,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.lineDarkColor,
                      ),
                      const SizedBox(
                        height: SizeConfig.height01,
                      ),
                      Container(
                        width: SizeConfig.width28,
                        height: SizeConfig.height28,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsConfig.buttonColor,
                        ),
                        child: const Center(
                          child: Image(
                            image: AssetImage(ImageConfig.done),
                            width: SizeConfig.width16,
                            height: SizeConfig.height16,
                            color: ColorsConfig.secondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 12,
              left: 53,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    TextString.orderConfirmedStatus,
                    style: TextStyle(
                      fontSize: FontSize.body2,
                      fontFamily: FontFamily.lexendRegular,
                      fontWeight: FontWeight.w400,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height02,
                  ),
                  Text(
                    TextString.wed08October,
                    style: TextStyle(
                      fontSize: FontSize.body3,
                      fontFamily: FontFamily.lexendLight,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.textColor
                          : ColorsConfig.modeInactiveColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height10,
                  ),
                  Text(
                    TextString.yourOrderHasBeenPlaced,
                    style: TextStyle(
                      fontSize: FontSize.body3,
                      fontFamily: FontFamily.lexendLight,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height02,
                  ),
                  Text(
                    TextString.wed10October,
                    style: TextStyle(
                      fontSize: FontSize.body3,
                      fontFamily: FontFamily.lexendLight,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.textColor
                          : ColorsConfig.modeInactiveColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height10,
                  ),
                  Text(
                    TextString.sellerHasProcessedYourOrder,
                    style: TextStyle(
                      fontSize: FontSize.body3,
                      fontFamily: FontFamily.lexendLight,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height02,
                  ),
                  Text(
                    TextString.thu11October,
                    style: TextStyle(
                      fontSize: FontSize.body3,
                      fontFamily: FontFamily.lexendLight,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.textColor
                          : ColorsConfig.modeInactiveColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height10,
                  ),
                  Text(
                    TextString.yourItemHasBeenPicked,
                    style: TextStyle(
                      fontSize: FontSize.body3,
                      fontFamily: FontFamily.lexendLight,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height02,
                  ),
                  Text(
                    TextString.thu11October4PM,
                    style: TextStyle(
                      fontSize: FontSize.body3,
                      fontFamily: FontFamily.lexendLight,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.textColor
                          : ColorsConfig.modeInactiveColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height23,
                  ),
                  Text(
                    TextString.shipped,
                    style: TextStyle(
                      fontSize: FontSize.body2,
                      fontFamily: FontFamily.lexendRegular,
                      fontWeight: FontWeight.w400,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height02,
                  ),
                  Text(
                    TextString.thu11October2018,
                    style: TextStyle(
                      fontSize: FontSize.body3,
                      fontFamily: FontFamily.lexendLight,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.textColor
                          : ColorsConfig.modeInactiveColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height10,
                  ),
                  Text(
                    TextString.yourItemHasBeenShipped,
                    style: TextStyle(
                      fontSize: FontSize.body3,
                      fontFamily: FontFamily.lexendLight,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height02,
                  ),
                  Text(
                    TextString.thu11October6PM,
                    style: TextStyle(
                      fontSize: FontSize.body3,
                      fontFamily: FontFamily.lexendLight,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.textColor
                          : ColorsConfig.modeInactiveColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height24,
                  ),
                  Text(
                    TextString.outOfDelivery,
                    style: TextStyle(
                      fontSize: FontSize.body2,
                      fontFamily: FontFamily.lexendRegular,
                      fontWeight: FontWeight.w400,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height02,
                  ),
                  Text(
                    TextString.thu13October,
                    style: TextStyle(
                      fontSize: FontSize.body3,
                      fontFamily: FontFamily.lexendLight,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.textColor
                          : ColorsConfig.modeInactiveColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height24,
                  ),
                  Text(
                    TextString.delivered,
                    style: TextStyle(
                      fontSize: FontSize.body2,
                      fontFamily: FontFamily.lexendRegular,
                      fontWeight: FontWeight.w400,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height02,
                  ),
                  Text(
                    TextString.sat13October,
                    style: TextStyle(
                      fontSize: FontSize.body3,
                      fontFamily: FontFamily.lexendLight,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.textColor
                          : ColorsConfig.modeInactiveColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height10,
                  ),
                  Text(
                    TextString.yourItemHasBeenDelivered,
                    style: TextStyle(
                      fontSize: FontSize.body3,
                      fontFamily: FontFamily.lexendLight,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height02,
                  ),
                  Text(
                    TextString.mon13October,
                    style: TextStyle(
                      fontSize: FontSize.body3,
                      fontFamily: FontFamily.lexendLight,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.textColor
                          : ColorsConfig.modeInactiveColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
