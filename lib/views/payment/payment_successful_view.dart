// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/colors.dart';
import 'package:UrbanEraFashion/config/size.dart';
import 'package:UrbanEraFashion/controller/bottom_navigation_controller.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/controller/my_orders_controller.dart';

import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/text_string.dart';
import '../../routes/app_routes.dart';

class PaymentSuccessfulView extends StatelessWidget {
  PaymentSuccessfulView({Key? key}) : super(key: key);

  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  MyOrdersController myOrdersController = Get.put(MyOrdersController());
  DarkModeController darkModeController = Get.put(DarkModeController());

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.only(
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
          bottom: SizeConfig.padding24,
          top: SizeConfig.padding24,
        ),
        child: Center(
          child: Container(
            width: SizeConfig.width342,
            height: SizeConfig.height570,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Image(
                      image: AssetImage(ImageConfig.close),
                      width: SizeConfig.width24,
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: SizeConfig.width342,
                      height: SizeConfig.height535,
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding24,
                        top: SizeConfig.padding36,
                        bottom: SizeConfig.padding32,
                        right: SizeConfig.padding24,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.secondaryColor
                            : ColorsConfig.buttonColor,
                        borderRadius:
                            BorderRadius.circular(SizeConfig.borderRadius14),
                      ),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                              darkModeController.isLightTheme.value
                                  ? ImageConfig.paymentSuccess
                                  : ImageConfig.paymentSuccessDark,
                            ),
                            width: SizeConfig.width194,
                            height: SizeConfig.height153,
                          ),
                          const SizedBox(
                            height: SizeConfig.height40,
                          ),
                          Text(
                            TextString.paymentSuccess,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamily.lexendMedium,
                              fontSize: FontSize.heading4,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height14,
                          ),
                          Text(
                            TextString.thanksForYourOrder,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontFamily: FontFamily.lexendLight,
                              fontSize: FontSize.body2,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height06,
                          ),
                          Text(
                            TextString.orderID,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontFamily: FontFamily.lexendLight,
                              fontSize: FontSize.body3,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: SizeConfig.padding24,
                            right: SizeConfig.padding24,
                            bottom: SizeConfig.padding18,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              myOrdersController.contentChanged.value = true;
                              Get.offNamed(AppRoutes.myOrdersView);
                            },
                            child: Container(
                              height: SizeConfig.height52,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.buttonColor
                                      : ColorsConfig.secondaryColor,
                                ),
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadius14),
                              ),
                              child: Center(
                                child: Text(
                                  TextString.textButtonViewOrder,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: FontFamily.lexendMedium,
                                    fontSize: FontSize.body1,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: SizeConfig.padding24,
                            right: SizeConfig.padding24,
                            bottom: SizeConfig.padding32,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              myOrdersController.toggleContent();
                              // goToTab(0);
                              Get.offAllNamed(AppRoutes.bottomView);
                            },
                            child: Container(
                              height: SizeConfig.height52,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.buttonColor
                                    : ColorsConfig.secondaryColor,
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadius14),
                              ),
                              child: Center(
                                child: Text(
                                  TextString.textButtonContinue,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: FontFamily.lexendMedium,
                                    fontSize: FontSize.body1,
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
          ),
        ),
      ),
    );
  }

  void goToTab(int tabIndex) {
    bottomNavigationController.changePage(tabIndex);
    bottomNavigationController.showBottomBar = true;
    Get.toNamed(AppRoutes.bottomView);
  }
}
