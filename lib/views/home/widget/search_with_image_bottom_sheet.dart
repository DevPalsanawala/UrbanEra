import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/colors.dart';
import 'package:UrbanEraFashion/config/image.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/controller/home_controller.dart';

import '../../../config/font_family.dart';
import '../../../config/font_size.dart';
import '../../../config/size.dart';
import '../../../config/text_string.dart';
import '../../../search/searchpage.dart';

DarkModeController darkModeController = Get.put(DarkModeController());

searchWithImageBottomSheet(BuildContext context) {
  HomeController homeController = Get.put(HomeController());
  RxBool _isLoading = false.obs;

  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
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
        height: SizeConfig.height345,
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
              height: SizeConfig.height303,
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: SizeConfig.padding24,
                right: SizeConfig.padding24,
                top: SizeConfig.padding32,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(SizeConfig.borderRadius24),
                  topLeft: Radius.circular(SizeConfig.borderRadius24),
                ),
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.backgroundColor
                    : ColorsConfig.buttonColor,
              ),
              child: Obx(() => _isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TextString.searchWithNewImages,
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
                          height: SizeConfig.height08,
                        ),
                        Text(
                          TextString.searchImagesDescription,
                          style: TextStyle(
                            fontSize: FontSize.body2,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.lexendLight,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.textColor
                                : ColorsConfig.modeInactiveColor,
                          ),
                        ),
                        const SizedBox(
                          height: SizeConfig.height24,
                        ),
                        Text(
                          TextString.howWouldYouLikeToSearch,
                          style: TextStyle(
                            fontSize: FontSize.body1,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.lexendRegular,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: SizeConfig.height16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  _isLoading.value = true;
                                  final imageContent =
                                      await homeController.openGallery();
                                  _isLoading.value = false;

                                  if (imageContent.isEmpty) {
                                    Get.snackbar('Oops!',
                                        'Something went wrong while doing image search');
                                    return;
                                  }

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Searchpage(txt: imageContent);
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  height: SizeConfig.height84,
                                  width: SizeConfig.width164,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.borderRadius14),
                                    border: Border.all(
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image:
                                            const AssetImage(ImageConfig.album),
                                        width: SizeConfig.width24,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                      const SizedBox(
                                        height: SizeConfig.height06,
                                      ),
                                      Text(
                                        TextString.searchByPhoto,
                                        style: TextStyle(
                                          fontSize: FontSize.body2,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontFamily.lexendRegular,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: SizeConfig.width14),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  _isLoading.value = true;
                                  final imageContent =
                                      await homeController.openCamera();
                                  _isLoading.value = false;

                                  if (imageContent.isEmpty) {
                                    Get.snackbar('Oops!',
                                        'Something went wrong while doing image search');
                                    return;
                                  }
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Searchpage(txt: imageContent);
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  height: SizeConfig.height84,
                                  width: SizeConfig.width164,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.borderRadius14),
                                    border: Border.all(
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            ImageConfig.camera2),
                                        width: SizeConfig.width24,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                      const SizedBox(
                                        height: SizeConfig.height06,
                                      ),
                                      Text(
                                        TextString.searchByCamera,
                                        style: TextStyle(
                                          fontSize: FontSize.body2,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontFamily.lexendRegular,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
            ),
          ],
        ),
      );
    },
  );
}
