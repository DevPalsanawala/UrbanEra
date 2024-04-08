// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/controller/offers_controller.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';

class OffersView extends StatelessWidget {
  OffersView({Key? key}) : super(key: key);

  OffersController offersController = Get.put(OffersController());
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
          child: !offersController.searchBoolean2.value
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
                TextString.offersView,
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
          : _searchTextField(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: SizeConfig.padding24,
              top: SizeConfig.padding20,
              bottom: SizeConfig.padding15,
            ),
            child: !offersController.searchBoolean2.value
            ? GestureDetector(
              onTap: () {
                offersController.searchBoolean2.value = true;
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
                offersController.searchBoolean2.value = false;
              },
              child: Icon(
                Icons.clear_rounded,
                size: SizeConfig.width25,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.primaryColor
                    : ColorsConfig.secondaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: SizeConfig.padding10,
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: offersController.offersPercentage.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: SizeConfig.padding16,
              ),
              child: Container(
                // height: SizeConfig.height88,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(SizeConfig.padding12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.secondaryColor
                      : ColorsConfig.primaryColor,
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              offersController.offersPercentage[index],
                              style: TextStyle(
                                fontFamily: FontFamily.lexendMedium,
                                fontSize: FontSize.heading4,
                                fontWeight: FontWeight.w500,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: SizeConfig.height06,
                            ),
                            Text(
                              offersController.offersDescription[index],
                              style: TextStyle(
                                fontFamily: FontFamily.lexendLight,
                                fontSize: FontSize.body3,
                                fontWeight: FontWeight.w300,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.textColor
                                    : ColorsConfig.modeInactiveColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                        width: SizeConfig.width45,
                      ),
                      Column(
                        children: [
                          Text(
                            offersController.offersCodeMode[index],
                            style: TextStyle(
                              fontFamily: FontFamily.lexendLight,
                              fontSize: FontSize.body3,
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
                            offersController.offersCode[index],
                            style: TextStyle(
                              fontFamily: FontFamily.lexendSemiBold,
                              fontSize: FontSize.body3,
                              fontWeight: FontWeight.w600,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height12,
                          ),
                          Text(
                            TextString.termCondition,
                            style: TextStyle(
                              fontFamily: FontFamily.lexendLight,
                              fontSize: FontSize.body3,
                              fontWeight: FontWeight.w300,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
