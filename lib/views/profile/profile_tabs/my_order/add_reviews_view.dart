// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/controller/add_reviews_controller.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/routes/app_routes.dart';

import '../../../../config/colors.dart';
import '../../../../config/font_family.dart';
import '../../../../config/font_size.dart';
import '../../../../config/image.dart';
import '../../../../config/size.dart';
import '../../../../config/text_string.dart';

class AddReviewsView extends StatelessWidget {
  AddReviewsView({Key? key}) : super(key: key);

  AddReviewsController addReviewsController = Get.put(AddReviewsController());
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
                TextString.addReviews,
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
        child: Column(
          children: [
            Container(
              height: SizeConfig.height76,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                left: SizeConfig.padding16,
                right: SizeConfig.padding12,
                top: SizeConfig.padding12,
                bottom: SizeConfig.padding12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.secondaryColor
                    : ColorsConfig.primaryColor,
              ),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage(ImageConfig.trendingP2),
                  ),
                  const SizedBox(
                    width: SizeConfig.width14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        TextString.mintJeansShirt,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamily.lexendMedium,
                          fontSize: FontSize.body2,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: SizeConfig.height06,
                      ),
                      Text(
                        TextString.mintShiner,
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
                ],
              ),
            ),
            const SizedBox(
              height: SizeConfig.height16,
            ),
            GestureDetector(
              onTap: () {
                addReviewsController.pickImages().then((images) {
                  if (images.isNotEmpty) {
                    addReviewsController.setSelectedImages(images);
                    addReviewsController.setImagesAdded(true);
                  }
                });
              },
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(SizeConfig.borderRadius14),
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.textColor
                    : ColorsConfig.modeInactiveColor,
                dashPattern: const [SizeConfig.dashPattern08, SizeConfig.dashPattern04],
                padding: EdgeInsets.zero,
                strokeWidth: SizeConfig.strokeWidth,
                child: Container(
                  height: SizeConfig.height124,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(SizeConfig.borderRadius14),
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                  ),
                  child: Obx(() {
                    return addReviewsController.imagesAdded.value
                        ? Padding(
                          padding: const EdgeInsets.all(SizeConfig.padding08),
                          child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                      ),
                      itemCount: addReviewsController.selectedImages.length,
                      itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(SizeConfig.borderRadius05),
                            child: Image.file(
                              File(addReviewsController.selectedImages[index].path),
                              fit: BoxFit.cover,
                              width: SizeConfig.width100,
                              height: SizeConfig.height100,
                            ),
                          );
                      },
                    ),
                        ) : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage(ImageConfig.camera3),
                          width: SizeConfig.width18,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.buttonColor
                              : ColorsConfig.secondaryColor,
                        ),
                        const SizedBox(
                          width: SizeConfig.width06,
                        ),
                        Text(
                          TextString.addImages,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: FontFamily.lexendLight,
                            fontSize: FontSize.body2,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.buttonColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: SizeConfig.height16,
            ),
            Container(
              height: SizeConfig.height80,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(SizeConfig.padding12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.secondaryColor
                    : ColorsConfig.primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TextString.rateYourExperience,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: FontFamily.lexendLight,
                      fontSize: FontSize.body2,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.textColor
                          : ColorsConfig.modeInactiveColor,
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: SizeConfig.initialRating,
                    minRating: SizeConfig.minRating,
                    glow: false,
                    itemSize: SizeConfig.width28,
                    unratedColor: darkModeController.isLightTheme.value
                                    ? ColorsConfig.textColor
                                    : ColorsConfig.unRatedColor,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: SizeConfig.itemCount,
                    itemPadding: const EdgeInsets.only(right: SizeConfig.padding10),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                    ),
                    onRatingUpdate: (rating) {

                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: SizeConfig.height16,
            ),
            Container(
              height: SizeConfig.height120,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(SizeConfig.padding12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.secondaryColor
                    : ColorsConfig.primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TextString.feedback,
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
                  TextFormField(
                    controller: addReviewsController.addReviewsController,
                    cursorColor: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                    maxLines: 4,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: FontSize.body2,
                      fontFamily: FontFamily.lexendRegular,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: TextString.enterYourFeedback,
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: FontSize.body2,
                        fontFamily: FontFamily.lexendLight,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.textColor
                            : ColorsConfig.modeInactiveColor,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
          bottom: SizeConfig.padding24,
        ),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.myOrdersView);
          },
          child: Container(
            height: SizeConfig.height52,
            width: double.infinity,
            decoration: BoxDecoration(
              color: darkModeController.isLightTheme.value
                  ? ColorsConfig.buttonColor
                  : ColorsConfig.secondaryColor,
              borderRadius:
              BorderRadius.circular(SizeConfig.borderRadius14),
            ),
            child: Center(
              child: Text(
                TextString.textButtonSubmit,
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
    ));
  }
}
