// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/controller/home_controller.dart';
import 'package:UrbanEraFashion/controller/search_controller.dart';
import 'package:UrbanEraFashion/views/home/widget/search_with_image_bottom_sheet.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';

class FashionSearchView extends StatefulWidget {
  const FashionSearchView({Key? key}) : super(key: key);

  @override
  State<FashionSearchView> createState() => _FashionSearchViewState();
}

class _FashionSearchViewState extends State<FashionSearchView> {
  HomeController homeController = Get.put(HomeController());
  SearchProductController searchProductController =
  Get.put(SearchProductController());
  DarkModeController darkModeController = Get.put(DarkModeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkModeController.isLightTheme.value
          ? ColorsConfig.backgroundColor
          : ColorsConfig.buttonColor,
      appBar: AppBar(
        backgroundColor: darkModeController.isLightTheme.value
            ? ColorsConfig.backgroundColor
            : ColorsConfig.buttonColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(SizeConfig.height20),
          child: Padding(
            padding: const EdgeInsets.only(
                left: SizeConfig.padding24, right: SizeConfig.padding24),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    homeController.clearKeyword();
                    homeController.hasKeyword.value = false;
                    homeController.searchController.clear();
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
                Expanded(
                  child: SizedBox(
                    height: SizeConfig.height48,
                    child: TextFormField(
                      controller: homeController.searchController,
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
                          borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(
                            top: SizeConfig.padding14,
                            bottom: SizeConfig.padding14,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (homeController.searchController.text.isNotEmpty) {
                                  homeController.updateKeyword("");
                                  homeController.searchController.clear();
                                } else {
                                  searchWithImageBottomSheet(context);
                                }
                              });
                            },
                            child: Image(
                              image: AssetImage(
                                homeController.searchController.text.isNotEmpty
                                    ? ImageConfig.cancel
                                    :ImageConfig.camera,
                              ),
                              width: SizeConfig.width18,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        homeController.updateKeyword(value);
                        homeController.searchController.text = value;
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
            () {
          return homeController.hasKeyword.value
              ? Column(
            children: [
              Container(
                height: SizeConfig.height10,
                width: double.infinity,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.backgroundColor
                    : ColorsConfig.buttonColor,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: SizeConfig.padding15,
                      bottom: SizeConfig.padding24,
                    ),
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchProductController
                          .searchMainContent.length,
                      itemBuilder: (context, index) {
                        final isLastItem = index == searchProductController.searchMainContent.length - 1;
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: SizeConfig.padding24,
                            right: SizeConfig.padding24,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            ImageConfig.search),
                                        width: SizeConfig.width18,
                                        height: SizeConfig.height18,
                                        color: darkModeController.isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width16,
                                      ),
                                      Text(
                                        searchProductController
                                            .searchMainContent[index],
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontWeight: FontWeight.w400,
                                          fontFamily:
                                          FontFamily.lexendMedium,
                                          color: darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                      Text(
                                        searchProductController
                                            .searchSubContent[index],
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontWeight: FontWeight.w300,
                                          fontFamily:
                                          FontFamily.lexendRegular,
                                          color: darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image(
                                    image: const AssetImage(
                                        ImageConfig.searchUpArrow),
                                    width: SizeConfig.width14,
                                    height: SizeConfig.height14,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                  ),
                                ],
                              ),
                              if(!isLastItem)
                                Divider(
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.lineColor
                                      : ColorsConfig.lineDarkColor,
                                  height: SizeConfig.height30,
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          )
              : Padding(
            padding: const EdgeInsets.only(
              left: SizeConfig.padding24,
              right: SizeConfig.padding24,
              bottom: SizeConfig.padding12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          homeController.openGallery();
                        },
                        child: Container(
                          height: SizeConfig.height84,
                          width: SizeConfig.width164,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius14),
                            border: Border.all(
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: const AssetImage(ImageConfig.album),
                                width: SizeConfig.width24,
                                color: darkModeController.isLightTheme.value
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
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.textColor
                                      : ColorsConfig.modeInactiveColor,
                                ),
                              ),
                            ],
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
                          homeController.openCamera();
                        },
                        child: Container(
                          height: SizeConfig.height84,
                          width: SizeConfig.width164,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius14),
                            border: Border.all(
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: const AssetImage(ImageConfig.camera2),
                                width: SizeConfig.width24,
                                color: darkModeController.isLightTheme.value
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
                                  color: darkModeController.isLightTheme.value
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
            ),
          );
        },
      ),
    );
  }
}
