// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/colors.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/font_family.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/font_size.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/category_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/category_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/model/category_model.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/category/top_fashion_view.dart';

import '../../config/image.dart';
import '../../config/size.dart';

class CategoryView extends StatelessWidget {
  CategoryView({Key? key}) : super(key: key);

  CategoryController categoryController = Get.put(CategoryController());
  DarkModeController darkModeController = Get.put(DarkModeController());
  final Categorycontroller categorycontroller = Get.put(Categorycontroller());

  void detailscreen(BuildContext context, Map<String, dynamic> category) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TopFashionView(category: category),
        ));
    // Get.to(CategoryItems(category: category));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: darkModeController.isLightTheme.value
            ? ColorsConfig.backgroundColor
            : ColorsConfig.buttonColor,
        appBar: AppBar(
          backgroundColor: darkModeController.isLightTheme.value
              ? ColorsConfig.backgroundColor
              : ColorsConfig.buttonColor,
          elevation: categoryController.showElevation.value ? 0 : 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(
              top: SizeConfig.padding10,
              left: SizeConfig.padding10,
            ),
            child: !categoryController.searchBoolean.value
                ? Text(
                    TextString.categories,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.lexendMedium,
                      fontSize: FontSize.heading4,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                  )
                : _searchTextField(),
          ),
          actions: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(
                  top: SizeConfig.padding10,
                  right: SizeConfig.padding24,
                ),
                child: !categoryController.searchBoolean.value
                    ? GestureDetector(
                        onTap: () {
                          categoryController.searchBoolean.value = true;
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
                          categoryController.searchBoolean.value = false;
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
            ),
          ],
        ),
        body: Obx(() {
          return Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 15),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: categorycontroller.categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: GestureDetector(
                      onTap: () {
                        detailscreen(
                          context,
                          categorycontroller.categories[index],
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 104,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.transparent,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (index % 2 == 0)
                                  Container(
                                    alignment: Alignment.centerRight,
                                    width: double.infinity,
                                    height: 96,
                                    padding: const EdgeInsets.only(
                                      left: 100,
                                      right: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      // color: Colors.black45,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.secondaryColor
                                              : ColorsConfig.primaryColor,
                                    ),
                                    child: Container(
                                      width: 205,
                                      margin: const EdgeInsets.only(
                                        left: 18,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            categorycontroller.categories[index]
                                                ['title'],
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily:
                                                  FontFamily.lexendMedium,
                                              // fontSize: FontSize.heading4,
                                              // fontFamily: FontFamily.lexendMedium,
                                              fontWeight: FontWeight.w500,
                                              color: darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.primaryColor
                                                  : ColorsConfig.secondaryColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                            // height: SizeConfig.height04,
                                          ),
                                          Text(
                                            categorycontroller.categories[index]
                                                ['subtitle'],
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily:
                                                  FontFamily.lexendLight,
                                              fontWeight: FontWeight.w300,
                                              color: darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.textColor
                                                  : ColorsConfig
                                                      .modeInactiveColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (index % 2 != 0)
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: double.infinity,
                                    height: 96,
                                    padding: const EdgeInsets.only(
                                      left: 12,
                                      right: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      // color: Colors.black45,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.secondaryColor
                                              : ColorsConfig.primaryColor,
                                    ),
                                    child: Container(
                                      width: 187,
                                      margin: const EdgeInsets.only(
                                        right: 18,
                                        left: 18,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            categorycontroller.categories[index]
                                                ['title'],
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily:
                                                  FontFamily.lexendMedium,
                                              // fontSize: FontSize.heading4,
                                              // fontFamily: FontFamily.lexendMedium,
                                              fontWeight: FontWeight.w500,
                                              color: darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.primaryColor
                                                  : ColorsConfig.secondaryColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                            // height: SizeConfig.height04,
                                          ),
                                          Text(
                                            categorycontroller.categories[index]
                                                ['subtitle'],
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily:
                                                  FontFamily.lexendLight,
                                              fontWeight: FontWeight.w300,
                                              color: darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.textColor
                                                  : ColorsConfig
                                                      .modeInactiveColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          if (index % 2 == 0)
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Image(
                                  image:
                                      AssetImage("assets/images/a${index}.png"),
                                  height: 104,
                                  width: 98,
                                ),
                              ),
                            ),
                          if (index % 2 != 0)
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 12,
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Image(
                                  image:
                                      AssetImage("assets/images/a${index}.png"),
                                  height: 104,
                                  width: 98,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        }),
      ),
    );
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
      ),
    );
  }
}
