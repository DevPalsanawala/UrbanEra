// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/controller/bottom_navigation_controller.dart';
import 'package:UrbanEraFashion/controller/save_for_later_controller.dart';
import 'package:UrbanEraFashion/views/profile/widget/remove_save_later_bottom_sheet.dart';
import '../../../config/colors.dart';
import '../../../config/font_family.dart';
import '../../../config/font_size.dart';
import '../../../config/image.dart';
import '../../../config/size.dart';
import '../../../config/text_string.dart';
import '../../../controller/dark_mode_controller.dart';
import '../../../routes/app_routes.dart';

class SaveForLaterView extends StatelessWidget {
  SaveForLaterView({Key? key}) : super(key: key);

  SaveForLaterController saveForLaterController = Get.put(SaveForLaterController());
  DarkModeController darkModeController = Get.put(DarkModeController());
  BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());

  void goToTab(int tabIndex) {
    bottomNavigationController.changePage(tabIndex);
    Get.toNamed(AppRoutes.bottomView);
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
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(
            top: SizeConfig.padding10,
            left: SizeConfig.padding10,
          ),
          child: !saveForLaterController.searchBoolean.value
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
                    TextString.saveForLaterTitle,
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
              )
              : _searchTextField(),
        ),
        actions: [
          Obx(() => Padding(
            padding: const EdgeInsets.only(
              right: SizeConfig.padding24,
              top: SizeConfig.padding24,
              bottom: SizeConfig.padding10,
            ),
            child: !saveForLaterController.searchBoolean.value
                ? Row(
              children: [
                GestureDetector(
                  onTap: () {
                    saveForLaterController.searchBoolean.value = true;
                  },
                  child: Image(
                    image: const AssetImage(ImageConfig.search),
                    width: SizeConfig.width20,
                    height: SizeConfig.height20,
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                ),
                const SizedBox(
                  width: SizeConfig.width18,
                ),
                GestureDetector(
                  onTap: () {
                    goToTab(4);
                  },
                  child: Image(
                    image: const AssetImage(ImageConfig.cart),
                    width: SizeConfig.width20,
                    height: SizeConfig.height20,
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                ),
              ],
            ) : GestureDetector(
              onTap: () {
                saveForLaterController.searchBoolean.value = false;
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
          top: SizeConfig.padding20,
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: saveForLaterController.bagProducts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: SizeConfig.padding20,
              ),
              child: Container(
                height: SizeConfig.height140,
                width: MediaQuery.of(context).size.width,
                padding:
                const EdgeInsets.all(SizeConfig.padding12),
                decoration: BoxDecoration(
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.secondaryColor
                      : ColorsConfig.primaryColor,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.borderRadius14,
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:
                            CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                      saveForLaterController.bagProducts[index],
                                    ),
                                    width: SizeConfig.width65,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: SizeConfig.padding10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          saveForLaterController.bagProductsTitle[index],
                                          style: TextStyle(
                                            fontWeight:
                                            FontWeight.w500,
                                            fontFamily: FontFamily
                                                .lexendMedium,
                                            fontSize:
                                            FontSize.body2,
                                            color: darkModeController.isLightTheme.value
                                                ? ColorsConfig.primaryColor
                                                : ColorsConfig.secondaryColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height:
                                          SizeConfig.height06,
                                        ),
                                        Text(
                                          saveForLaterController.bagProductsSubtitle[index],
                                          style: TextStyle(
                                            fontWeight:
                                            FontWeight.w300,
                                            fontFamily: FontFamily
                                                .lexendLight,
                                            fontSize:
                                            FontSize.body3,
                                            color: darkModeController.isLightTheme.value
                                                ? ColorsConfig.textColor
                                                : ColorsConfig.modeInactiveColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height:
                                          SizeConfig.height12,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              saveForLaterController.bagProductsPrice[index],
                                              style: TextStyle(
                                                fontWeight:
                                                FontWeight
                                                    .w400,
                                                fontFamily: FontFamily
                                                    .lexendRegular,
                                                fontSize: FontSize
                                                    .body2,
                                                color: darkModeController.isLightTheme.value
                                                    ? ColorsConfig.primaryColor
                                                    : ColorsConfig.secondaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Obx(
                                    () => Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        saveForLaterController
                                            .decrementCounter(
                                            index);
                                      },
                                      child: Image(
                                        image: AssetImage(
                                          darkModeController.isLightTheme.value
                                              ? ImageConfig.minus
                                              : ImageConfig.minusDark,
                                        ),
                                        width: SizeConfig.width22,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: SizeConfig.width08,
                                    ),
                                    Text(
                                      saveForLaterController
                                          .itemQuantities[index]
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight:
                                        FontWeight.w500,
                                        fontFamily: FontFamily
                                            .lexendMedium,
                                        fontSize: FontSize.body3,
                                        color: darkModeController.isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: SizeConfig.width08,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        saveForLaterController
                                            .incrementCounter(
                                            index);
                                      },
                                      child: Image(
                                        image: AssetImage(
                                          darkModeController.isLightTheme.value
                                              ? ImageConfig.plus
                                              : ImageConfig.plusDark,
                                        ),
                                        width: SizeConfig.width22,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: SizeConfig.height12,
                          ),
                          Divider(
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.lineColor
                                : ColorsConfig.lineDarkColor,
                            height: 0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              removeSaveForLaterBottomSheet(context);
                            },
                            child: Text(
                              TextString.remove,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: FontFamily.lexendLight,
                                fontSize: FontSize.body3,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.lineColor
                                : ColorsConfig.lineDarkColor,
                          ),
                          GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                msg: TextString.addedToBagToast,
                                gravity: ToastGravity.BOTTOM,
                                toastLength: Toast.LENGTH_SHORT,
                                backgroundColor: darkModeController.isLightTheme.value
                                      ? ColorsConfig.buttonColor
                                      : ColorsConfig.secondaryColor,
                                textColor: darkModeController.isLightTheme.value
                                    ? ColorsConfig.secondaryColor
                                    : ColorsConfig.buttonColor,
                              );
                            },
                            child: Text(
                              TextString.addToBag,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: FontFamily.lexendLight,
                                fontSize: FontSize.body3,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
