import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/controller/category_controller.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import '../../../config/colors.dart';
import '../../../config/font_family.dart';
import '../../../config/font_size.dart';
import '../../../config/image.dart';
import '../../../config/size.dart';
import '../../../config/text_string.dart';

DarkModeController darkModeController = Get.put(DarkModeController());

selectMenCategoriesBottomSheet(BuildContext context) {
  CategoryController categoryController = Get.put(CategoryController());
  return showModalBottomSheet(
    isScrollControlled: true,
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
        height: SizeConfig.height709,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.back();
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
              height: SizeConfig.height667,
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
                      bottom: SizeConfig.padding60,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextString.categories,
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
                            height: SizeConfig.height24,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Image(
                                  image: const AssetImage(
                                    ImageConfig.previousArrow,
                                  ),
                                  width: SizeConfig.width18,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                              const SizedBox(
                                width: SizeConfig.width08,
                              ),
                              Text(
                                TextString.men,
                                style: TextStyle(
                                  fontSize: FontSize.body1,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: FontFamily.lexendMedium,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: SizeConfig.height24,
                          ),
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Text(
                                TextString.topCategories,
                                style: TextStyle(
                                  fontSize: FontSize.body2,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: FontFamily.lexendMedium,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                              const SizedBox(
                                height: SizeConfig.height13,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: categoryController.topCategoriesList.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Obx(
                                                () => GestureDetector(
                                              onTap: () {
                                                categoryController.toggleTopCheckbox(index);
                                              },
                                              child: Image(
                                                image: AssetImage(
                                                  categoryController.isCheckedTopList[index]
                                                      ? darkModeController.isLightTheme.value
                                                      ? ImageConfig.checkboxFill
                                                      : ImageConfig.checkBoxFillDark
                                                      : darkModeController.isLightTheme.value
                                                      ? ImageConfig.checkbox
                                                      : ImageConfig.checkBoxDark,
                                                ),
                                                width: SizeConfig.width18,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: SizeConfig.width10,
                                          ),
                                          Text(
                                            categoryController.topCategoriesList[index],
                                            style: TextStyle(
                                              fontSize: FontSize.body1,
                                              fontWeight: FontWeight.w300,
                                              fontFamily: FontFamily.lexendLight,
                                              color: darkModeController.isLightTheme.value
                                                  ? ColorsConfig.textColor
                                                  : ColorsConfig.modeInactiveColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: SizeConfig.height13,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(
                                height: SizeConfig.height15,
                              ),
                              Text(
                                TextString.allCategories,
                                style: TextStyle(
                                  fontSize: FontSize.body2,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: FontFamily.lexendMedium,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                              const SizedBox(
                                height: SizeConfig.height13,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: categoryController.topAllCategoriesList.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Obx(
                                                () => GestureDetector(
                                              onTap: () {
                                                categoryController.toggleTopAllCheckbox(index);
                                              },
                                              child: Image(
                                                image: AssetImage(
                                                  categoryController.isCheckedTopAllList[index]
                                                      ? darkModeController.isLightTheme.value
                                                      ? ImageConfig.checkboxFill
                                                      : ImageConfig.checkBoxFillDark
                                                      : darkModeController.isLightTheme.value
                                                      ? ImageConfig.checkbox
                                                      : ImageConfig.checkBoxDark,
                                                ),
                                                width: SizeConfig.width18,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: SizeConfig.width10,
                                          ),
                                          Text(
                                            categoryController.topAllCategoriesList[index],
                                            style: TextStyle(
                                              fontSize: FontSize.body1,
                                              fontWeight: FontWeight.w300,
                                              fontFamily: FontFamily.lexendLight,
                                              color: darkModeController.isLightTheme.value
                                                  ? ColorsConfig.textColor
                                                  : ColorsConfig.modeInactiveColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: SizeConfig.height13,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(
                                height: SizeConfig.height20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: SizeConfig.height20,
                          ),
                        ],
                      ),
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
                                categoryController.resetTopFilters();
                                categoryController.resetTopAllFilters();
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
                                    TextString.textButtonReset,
                                    style: TextStyle(
                                      fontSize: FontSize.body1,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: FontFamily.lexendRegular,
                                      color: darkModeController.isLightTheme.value
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
                                  Get.back();
                                  Get.back();
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
                                      TextString.textButtonApply,
                                      style: TextStyle(
                                        fontSize: FontSize.body1,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: FontFamily.lexendRegular,
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
