import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/routes/app_routes.dart';
import '../../../config/colors.dart';
import '../../../config/font_family.dart';
import '../../../config/font_size.dart';
import '../../../config/image.dart';
import '../../../config/size.dart';
import '../../../config/text_string.dart';

DarkModeController darkModeController = Get.put(DarkModeController());

logoutBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    shape: const OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(SizeConfig.borderRadius24),
        topRight: Radius.circular(SizeConfig.borderRadius24),
      ),
      borderSide: BorderSide.none,
    ),
    context: context,
    builder: (context) {
      return SizedBox(
        height: SizeConfig.height253,
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
            const SizedBox(
              height: SizeConfig.height18,
            ),
            Container(
              height: SizeConfig.height211,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(SizeConfig.borderRadius24),
                  topLeft: Radius.circular(SizeConfig.borderRadius24),
                ),
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.backgroundColor
                    : ColorsConfig.buttonColor,
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: SizeConfig.padding24,
                      right: SizeConfig.padding24,
                      top: SizeConfig.padding32,
                      bottom: SizeConfig.padding24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TextString.textButtonLogout,
                          style: TextStyle(
                            fontSize: FontSize.heading4,
                            fontWeight: FontWeight.w500,
                            fontFamily: FontFamily.lexendMedium,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: SizeConfig.height16,
                        ),
                        Text(
                          TextString.logoutString,
                          style: TextStyle(
                            fontSize: FontSize.body1,
                            fontWeight: FontWeight.w300,
                            fontFamily: FontFamily.lexendLight,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
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
                            blurRadius: 15,
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
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: SizeConfig.height52,
                                width: SizeConfig.width116,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.borderRadius14),
                                  border: Border.all(
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    TextString.textButtonCancel,
                                    style: TextStyle(
                                      fontSize: FontSize.body1,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: FontFamily.lexendRegular,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: SizeConfig.width14,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.offAllNamed(AppRoutes.phoneview);
                                },
                                child: Container(
                                  height: SizeConfig.height52,
                                  width: SizeConfig.width212,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.borderRadius14),
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      TextString.textButtonLogout,
                                      style: TextStyle(
                                        fontSize: FontSize.body1,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: FontFamily.lexendMedium,
                                        color: darkModeController
                                                .isLightTheme.value
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
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
