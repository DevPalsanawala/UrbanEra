// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/controller/language_controller.dart';

import '../../../config/colors.dart';
import '../../../config/font_family.dart';
import '../../../config/font_size.dart';
import '../../../config/image.dart';
import '../../../config/size.dart';
import '../../../config/text_string.dart';
import '../../../controller/dark_mode_controller.dart';

class LanguagesView extends StatelessWidget {
  LanguagesView({Key? key}) : super(key: key);

  LanguageController languageController = Get.put(LanguageController());
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
          child: !languageController.searchBoolean.value
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
                    TextString.languages,
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
          Obx(() => Padding(
            padding: const EdgeInsets.only(
              right: SizeConfig.padding24,
              top: SizeConfig.padding10,
              bottom: SizeConfig.padding10,
            ),
            child: !languageController.searchBoolean.value
                ? GestureDetector(
              onTap: () {
                languageController.searchBoolean.value = true;
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
                languageController.searchBoolean.value = false;
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
          itemCount: languageController.languagesList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageController.languagesList[index],
                      style: TextStyle(
                        fontFamily: FontFamily.lexendLight,
                        fontSize: FontSize.body2,
                        fontWeight: FontWeight.w300,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        languageController.selectContainer(index);
                      },
                      child: Obx(
                            () => Image(
                          image: AssetImage(
                            languageController
                                .getContainerImage(index),
                          ),
                          width: SizeConfig.width16,
                          height: SizeConfig.height16,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: SizeConfig.height24,
                ),
              ],
            );
          },
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
            Get.back();
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
