// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/my_review_controller.dart';
import '../../../config/colors.dart';
import '../../../config/font_family.dart';
import '../../../config/font_size.dart';
import '../../../config/image.dart';
import '../../../config/size.dart';
import '../../../config/text_string.dart';
import '../../../controller/dark_mode_controller.dart';

class MyReviewView extends StatelessWidget {
  MyReviewView({Key? key}) : super(key: key);

  MyReviewController myReviewController = Get.put(MyReviewController());
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
            left: SizeConfig.padding05,
          ),
          child: !myReviewController.searchBoolean.value
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
                    TextString.myReviews,
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
              )
              :_searchTextField(),
        ),
        actions: [
          Obx(() => Padding(
            padding: const EdgeInsets.only(
              right: SizeConfig.padding24,
              top: SizeConfig.padding10,
              bottom: SizeConfig.padding10,
            ),
            child: !myReviewController.searchBoolean.value
                ? GestureDetector(
              onTap: () {
                myReviewController.searchBoolean.value = true;
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
                myReviewController.searchBoolean.value = false;
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
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
          top: SizeConfig.padding24,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: myReviewController.reviewName.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage(myReviewController.reviewImage[index]),
                          width: SizeConfig.width32,
                        ),
                        const SizedBox(
                          width: SizeConfig.width10,
                        ),
                        Text(
                          myReviewController.reviewName[index],
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
                      myReviewController.reviewDay[index],
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
                const SizedBox(
                  height: SizeConfig.height10,
                ),
                Image(
                  image: AssetImage(
                    darkModeController.isLightTheme.value
                        ? myReviewController.ratingStarImages[index]
                        : myReviewController.ratingStarDarkImages[index]
                  ),
                  width: SizeConfig.width68,
                  height: SizeConfig.height12,
                ),
                const SizedBox(
                  height: SizeConfig.height06,
                ),
                Text(
                  myReviewController.reviewDescription[index],
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
                  height: SizeConfig.height08,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Image(
                          image: const AssetImage(ImageConfig.likeFashion),
                          width: SizeConfig.width14,
                          color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.textColor
                                    : ColorsConfig.modeInactiveColor,
                        ),
                        const SizedBox(
                          width: SizeConfig.width04,
                        ),
                        Text(
                          myReviewController.reviewLikes[index],
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
                    const SizedBox(
                      width: SizeConfig.width16,
                    ),
                    Row(
                      children: [
                        Image(
                          image:
                          const AssetImage(ImageConfig.dislikeFashion),
                          width: SizeConfig.width14,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.textColor
                              : ColorsConfig.modeInactiveColor,
                        ),
                        const SizedBox(
                          width: SizeConfig.width04,
                        ),
                        Text(
                          TextString.dislike12,
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
                  ],
                ),
                Divider(
                  color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                  height: SizeConfig.height40,
                ),
              ],
            );
          },
        ),
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
