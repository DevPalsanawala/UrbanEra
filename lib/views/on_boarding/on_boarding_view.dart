// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/font_size.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/image.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/size.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../controller/on_boarding_controller.dart';
import '../../model/on_boarding_model.dart';
import '../../routes/app_routes.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({Key? key}) : super(key: key);

  OnBoardingController onBoardingController = Get.put(OnBoardingController());
  PageController pageController = Get.put(PageController(initialPage: 0));
  DarkModeController darkModeController = Get.put(DarkModeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkModeController.isLightTheme.value
          ? ColorsConfig.backgroundColor
          : ColorsConfig.buttonColor,
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(
              left: SizeConfig.padding24,
              right: SizeConfig.padding24,
              bottom: SizeConfig.padding30,
              top: SizeConfig.padding59),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                          darkModeController.isLightTheme.value
                              ? 'assets/images/titlewhite.png'
                              : 'assets/images/titleblack.png',
                        ),
                        width: 130,
                        height: 30,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: Visibility(
                      visible: onBoardingController.pageViewIndex.value != 2,
                      child: GestureDetector(
                        onTap: () {
                          if (onBoardingController.pageViewIndex.value == 0 ||
                              onBoardingController.pageViewIndex.value == 1) {
                            pageController
                                .jumpToPage(onBoardingModelList.length - 1);
                            Get.toNamed(AppRoutes.phoneview);
                          }
                        },
                        child: Text(
                          TextString.textButtonSkip,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: FontSize.body3,
                            fontFamily: FontFamily.lexendLight,
                            fontWeight: FontWeight.w300,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.textColor
                                : ColorsConfig.modeInactiveColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: onBoardingModelList.length,
                  controller: pageController,
                  onPageChanged: (value) {
                    onBoardingController.pageViewIndex.value = value;
                  },
                  itemBuilder: (context, index) {
                    index = onBoardingController.pageViewIndex.value;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image(
                                image: AssetImage(
                                    onBoardingModelList[index].image ?? ""),
                                width: getWidthForIndex(index),
                                height: getHeightForIndex(index),
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: SizeConfig.height50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onBoardingModelList.length,
                            (int index) => buildDot(index: index),
                          ),
                        ),
                        const SizedBox(
                          height: SizeConfig.height40,
                        ),
                        Text(
                          onBoardingModelList[index].title ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: FontSize.heading1,
                            fontFamily: FontFamily.lexendMedium,
                            fontWeight: FontWeight.w500,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: SizeConfig.height10,
                        ),
                        Text(
                          onBoardingModelList[index].description ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: FontSize.body2,
                            fontFamily: FontFamily.lexendLight,
                            fontWeight: FontWeight.w300,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.textColor
                                : ColorsConfig.modeInactiveColor,
                          ),
                        ),
                        const SizedBox(
                          height: SizeConfig.height20,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: SizeConfig.height75,
        child: Obx(
          () => Column(
            children: [
              if (onBoardingController.pageViewIndex.value <
                  onBoardingModelList.length - 1)
                GestureDetector(
                  onTap: () {
                    if (onBoardingController.pageViewIndex.value <
                        onBoardingModelList.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Image(
                    image: AssetImage(
                      darkModeController.isLightTheme.value
                          ? ImageConfig.onBoardGo
                          : ImageConfig.onBoardGoDark,
                    ),
                    width: SizeConfig.width52,
                  ),
                ),
              if (onBoardingController.pageViewIndex.value ==
                  onBoardingModelList.length - 1)
                Padding(
                  padding: const EdgeInsets.only(
                    left: SizeConfig.padding24,
                    right: SizeConfig.padding24,
                  ),
                  child: SizedBox(
                    height: SizeConfig.height52,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed(AppRoutes.welcomeView);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: darkModeController.isLightTheme.value
                            ? ColorsConfig.buttonColor
                            : ColorsConfig.secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(SizeConfig.borderRadius14),
                        ),
                      ),
                      child: Text(
                        TextString.buttonContinue,
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
            ],
          ),
        ),
      ),
    );
  }

  buildDot({required int index}) {
    return Container(
      margin: const EdgeInsets.only(right: SizeConfig.margin5),
      height: onBoardingController.pageViewIndex.value == index
          ? SizeConfig.height04
          : SizeConfig.height04,
      width: onBoardingController.pageViewIndex.value == index
          ? SizeConfig.width18
          : SizeConfig.width18,
      decoration: BoxDecoration(
        color: onBoardingController.pageViewIndex.value == index
            ? darkModeController.isLightTheme.value
                ? ColorsConfig.primaryColor
                : ColorsConfig.secondaryColor
            : darkModeController.isLightTheme.value
                ? ColorsConfig.dotIndicatorColor
                : ColorsConfig.unRatedColor,
        borderRadius: BorderRadius.circular(SizeConfig.borderRadius39),
      ),
    );
  }

  double getWidthForIndex(int index) {
    List<double> widths = [
      SizeConfig.width298,
      SizeConfig.width298,
      SizeConfig.width298
    ];
    if (index >= 0 && index < widths.length) {
      return widths[index];
    }
    return SizeConfig.width298;
  }

  double getHeightForIndex(int index) {
    List<double> heights = [
      SizeConfig.height303,
      SizeConfig.height272,
      SizeConfig.height282
    ];
    if (index >= 0 && index < heights.length) {
      return heights[index];
    }
    return SizeConfig.height313;
  }

  double getHeightForImageIndex(int index) {
    List<double> heights = [
      SizeConfig.height30,
      SizeConfig.height78,
      SizeConfig.height73
    ];
    if (index >= 0 && index < heights.length) {
      return heights[index];
    }
    return SizeConfig.height30;
  }

  double getHeightForSizeIndex(int index) {
    List<double> heights = [
      SizeConfig.height77,
      SizeConfig.height105,
      SizeConfig.height99
    ];
    if (index >= 0 && index < heights.length) {
      return heights[index];
    }
    return SizeConfig.height77;
  }
}
