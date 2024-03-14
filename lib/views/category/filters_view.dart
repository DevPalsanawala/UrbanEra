// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/fliters_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/category/widget/colors_filters_view.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';

class FiltersView extends StatefulWidget {
  const FiltersView({Key? key}) : super(key: key);

  @override
  State<FiltersView> createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  FiltersController filtersController = Get.put(FiltersController());
  DarkModeController darkModeController = Get.put(DarkModeController());

  void selectItem(int index) {
    if (filtersController.selectedIdx == index) {
      return;
    }
    filtersController.selectedIdx = index;
    setState(() {});
  }

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
        elevation: 5,
        shadowColor: Colors.black.withOpacity(.3),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(
            left: SizeConfig.padding07,
            top: SizeConfig.padding15,
            bottom: SizeConfig.padding15,
            right: SizeConfig.padding05,
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
                TextString.filters,
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
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              width: SizeConfig.width130,
              decoration: BoxDecoration(
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.containerColor
                    : ColorsConfig.containerDarkColor,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: SizeConfig.height10,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: filtersController.filtersList.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 1),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          selectItem(index);
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: SizeConfig.padding10,
                            bottom: SizeConfig.padding10,
                          ),
                          height: SizeConfig.height45,
                          decoration: BoxDecoration(
                            color: filtersController.selectedIdx == index
                                ? darkModeController.isLightTheme.value
                                ? ColorsConfig.backgroundColor
                                : ColorsConfig.buttonColor
                                : null,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (filtersController.selectedIdx == index)
                                Container(
                                  width: SizeConfig.width04,
                                  height: SizeConfig.height28,
                                  decoration: BoxDecoration(
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(
                                          SizeConfig.borderRadius36),
                                      bottomRight: Radius.circular(
                                          SizeConfig.borderRadius36),
                                    ),
                                  ),
                                ),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: SizeConfig.padding24,
                                ),
                                child: Text(
                                  filtersController.filtersList[index],
                                  style: TextStyle(
                                    fontWeight:
                                    filtersController.selectedIdx == index
                                        ? FontWeight.w500
                                        : FontWeight.w300,
                                    fontFamily:
                                    filtersController.selectedIdx == index
                                        ? FontFamily.lexendMedium
                                        : FontFamily.lexendLight,
                                    fontSize: FontSize.body2,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )),
          Expanded(
            child: Container(
              child: (filtersController.selectedIdx == 2)
                  ? ColorsFiltersView()
                  : Container(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
                  filtersController.resetFilters();
                },
                child: Container(
                  height: SizeConfig.height52,
                  width: SizeConfig.width116,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(SizeConfig.borderRadius14),
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
                  },
                  child: Container(
                    height: SizeConfig.height52,
                    width: SizeConfig.width212,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(SizeConfig.borderRadius14),
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TextString.textButtonApplyFilter,
                          style: TextStyle(
                            fontSize: FontSize.body1,
                            fontWeight: FontWeight.w500,
                            fontFamily: FontFamily.lexendRegular,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.secondaryColor
                                : ColorsConfig.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          width: SizeConfig.width06,
                        ),
                        Container(
                          width: SizeConfig.width20,
                          height: SizeConfig.height20,
                          decoration: const BoxDecoration(
                            color: ColorsConfig.textLightColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Obx(
                                  () => Text(
                                filtersController.selectedColorIndices.length.toString(),
                                style: const TextStyle(
                                  fontSize: FontSize.body3,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: FontFamily.lexendSemiBold,
                                  color: ColorsConfig.secondaryColor,
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
      ),
    ));
  }
}
