// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/controller/rating_and_review_controller.dart';
import 'package:UrbanEraFashion/views/category/widget/custome_progress_bar.dart';
import 'package:UrbanEraFashion/views/category/widget/rating_bottom_sheet.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';
import '../../routes/app_routes.dart';

class RatingAndReviewsView extends StatelessWidget {
  RatingAndReviewsView({Key? key}) : super(key: key);

  RatingAndReviewController ratingAndReviewController = Get.put(RatingAndReviewController());
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
                TextString.ratingAndReview,
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
        padding: const EdgeInsets.only(
          top: SizeConfig.padding10,
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: SizeConfig.height48,
                      child: TextFormField(
                        onTap: () {
                          Get.toNamed(AppRoutes.searchView);
                        },
                        cursorColor: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                        style: TextStyle(
                          fontFamily: FontFamily.lexendRegular,
                          fontSize: FontSize.body2,
                          fontWeight: FontWeight.w400,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                            left: SizeConfig.padding16,
                            right: SizeConfig.padding16,
                          ),
                          hintText: TextString.searchHere,
                          hintStyle: TextStyle(
                            fontFamily: FontFamily.lexendLight,
                            fontSize: FontSize.body3,
                            fontWeight: FontWeight.w300,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.textLightColor
                                : ColorsConfig.modeInactiveColor,
                          ),
                          filled: true,
                          fillColor: darkModeController.isLightTheme.value
                              ? ColorsConfig.secondaryColor
                              : ColorsConfig.primaryColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius14),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius14),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius14),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              top: SizeConfig.padding15,
                              bottom: SizeConfig.padding15,
                            ),
                            child: Image(
                              image: const AssetImage(ImageConfig.search),
                              width: SizeConfig.width18,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: SizeConfig.width10,
                  ),
                  GestureDetector(
                    onTap: () {
                      selectRatingBottomSheet(context);
                    },
                    child: Container(
                      width: SizeConfig.width48,
                      height: SizeConfig.height48,
                      decoration: BoxDecoration(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.secondaryColor
                            : ColorsConfig.primaryColor,
                        borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadius14),
                      ),
                      child: Center(
                        child: Image(
                          image: const AssetImage(ImageConfig.filterData),
                          width: SizeConfig.width20,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: SizeConfig.height16,
              ),
              Container(
                height: SizeConfig.height137,
                width: double.infinity,
                padding: const EdgeInsets.all(SizeConfig.padding12),
                decoration: BoxDecoration(
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.secondaryColor
                      : ColorsConfig.primaryColor,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.borderRadius14,
                  ),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              TextString.rating4point9,
                              style: TextStyle(
                                fontSize: FontSize.heading2,
                                fontFamily: FontFamily.lexendRegular,
                                fontWeight: FontWeight.w400,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: SizeConfig.height14,
                            ),
                            Image(
                              image: AssetImage(
                                darkModeController.isLightTheme.value
                                    ? ImageConfig.ratings
                                    : ImageConfig.ratingDark,
                              ),
                              width: SizeConfig.width106,
                              height: SizeConfig.height18,
                            ),
                            const SizedBox(
                              height: SizeConfig.height10,
                            ),
                            Text(
                              TextString.reviews4959,
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
                      VerticalDivider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                        thickness: SizeConfig.lineThickness01,
                        width: SizeConfig.width40,
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomProgressBar(
                              text: TextString.reviewStar5,
                              width: MediaQuery.of(context).size.width / SizeConfig.width02point5,
                              value: SizeConfig.progressValue95,
                              totalValue: SizeConfig.totalProgressValue100,
                            ),
                            CustomProgressBar(
                              text: TextString.reviewStar4,
                              width: MediaQuery.of(context).size.width / SizeConfig.width02point5,
                              value: SizeConfig.progressValue80,
                              totalValue: SizeConfig.totalProgressValue100,
                            ),
                            CustomProgressBar(
                              text: TextString.reviewStar3,
                              width: MediaQuery.of(context).size.width / SizeConfig.width02point5,
                              value: SizeConfig.progressValue45,
                              totalValue: SizeConfig.totalProgressValue100,
                            ),
                            CustomProgressBar(
                              text: TextString.reviewStar2,
                              width: MediaQuery.of(context).size.width / SizeConfig.width02point5,
                              value: SizeConfig.progressValue55,
                              totalValue: SizeConfig.totalProgressValue100,
                            ),
                            CustomProgressBar(
                              text: TextString.reviewStar1,
                              width: MediaQuery.of(context).size.width / SizeConfig.width02point5,
                              value: SizeConfig.progressValue10,
                              totalValue: SizeConfig.totalProgressValue100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height16,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ratingAndReviewController.reviewName.length,
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
                                image: AssetImage(ratingAndReviewController.reviewImage[index]),
                                width: SizeConfig.width32,
                              ),
                              const SizedBox(
                                width: SizeConfig.width10,
                              ),
                              Text(
                                ratingAndReviewController.reviewName[index],
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
                            ratingAndReviewController.reviewDay[index],
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
                              ? ImageConfig.ratings
                              : ImageConfig.ratingDark,
                        ),
                        width: SizeConfig.width68,
                        height: SizeConfig.height12,
                      ),
                      const SizedBox(
                        height: SizeConfig.height06,
                      ),
                      Text(
                        ratingAndReviewController.reviewDescription[index],
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
                                TextString.like20,
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
            ],
          ),
        ),
      ),
    ));
  }
}
