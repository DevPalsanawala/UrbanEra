// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/colors.dart';
import 'package:UrbanEraFashion/config/font_family.dart';
import 'package:UrbanEraFashion/config/font_size.dart';
import 'package:UrbanEraFashion/config/image.dart';
import 'package:UrbanEraFashion/config/size.dart';
import 'package:UrbanEraFashion/config/text_string.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/controller/notification_controller.dart';

class NotificationView extends StatelessWidget {
  NotificationView({Key? key}) : super(key: key);

  NotificationController notificationController = Get.put(NotificationController());
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
          child: !notificationController.searchBoolean.value
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
                TextString.notifications,
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
              top: SizeConfig.padding20,
              bottom: SizeConfig.padding15,
            ),
            child: !notificationController.searchBoolean.value
                ? GestureDetector(
              onTap: () {
                notificationController.searchBoolean.value = true;
              },
              child: Image(
                image: const AssetImage(ImageConfig.search),
                width: SizeConfig.width20,
                height: SizeConfig.height20,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.primaryColor
                    : ColorsConfig.secondaryColor,
              ),
            ) : GestureDetector(
              onTap: () {
                notificationController.searchBoolean.value = false;
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
          top: SizeConfig.padding10,
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
          bottom: SizeConfig.padding24,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: notificationController.notificationTitle.length,
          itemBuilder: (context, index) {
            final isLastItem = index == notificationController.notificationTitle.length - 1;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notificationController.notificationTitle[index],
                      style: TextStyle(
                        fontFamily: FontFamily.lexendMedium,
                        fontSize: FontSize.body2,
                        fontWeight: FontWeight.w500,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    ),
                    Container(
                      width: SizeConfig.width04,
                      height: SizeConfig.height04,
                      decoration: BoxDecoration(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: SizeConfig.height10,
                ),
                Text(
                  notificationController.notificationSubtitle[index],
                  style: TextStyle(
                    fontFamily: FontFamily.lexendLight,
                    fontSize: FontSize.body3,
                    fontWeight: FontWeight.w400,
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.textColor
                        : ColorsConfig.modeInactiveColor,
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height08,
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(
                        notificationController.notificationDate[index],
                        style: TextStyle(
                          fontFamily: FontFamily.lexendLight,
                          fontSize: FontSize.body3,
                          fontWeight: FontWeight.w300,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.textColor
                              : ColorsConfig.modeInactiveColor,
                        ),
                      ),
                      const VerticalDivider(
                        color: ColorsConfig.textColor,
                        endIndent: 2,
                        indent: 2,
                        width: SizeConfig.width20,
                      ),
                      Text(
                        notificationController.notificationTime[index],
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
                if(!isLastItem)
                  Divider(
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.lineColor
                        : ColorsConfig.lineDarkColor,
                    height: SizeConfig.height30,
                  ),
              ],
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
