// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/terms_and_conditions_controller.dart';

import '../../../config/colors.dart';
import '../../../config/font_family.dart';
import '../../../config/font_size.dart';
import '../../../config/image.dart';
import '../../../config/size.dart';
import '../../../config/text_string.dart';
import '../../../controller/dark_mode_controller.dart';

class TermsAndConditionsView extends StatelessWidget {
  TermsAndConditionsView({Key? key}) : super(key: key);

  TermsAndConditionsController termsAndConditionsController = Get.put(TermsAndConditionsController());
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
                TextString.termsAndConditions,
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
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
        ),
        child: ListView.builder(
          itemCount: termsAndConditionsController.termsStringList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(
                  height: SizeConfig.height10,
                ),
                Text(
                  termsAndConditionsController.termsStringList[index],
                  style: TextStyle(
                    fontFamily: FontFamily.lexendLight,
                    fontSize: FontSize.body2,
                    fontWeight: FontWeight.w300,
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.textColor
                        : ColorsConfig.modeInactiveColor,
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height16,
                ),
              ],
            );
          },
        ),
      ),
    ));
  }
}
