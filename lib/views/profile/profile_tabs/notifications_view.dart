// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/notifications_controller.dart';

import '../../../config/colors.dart';
import '../../../config/font_family.dart';
import '../../../config/font_size.dart';
import '../../../config/image.dart';
import '../../../config/size.dart';
import '../../../config/text_string.dart';
import '../../../controller/dark_mode_controller.dart';

class NotificationsView extends StatelessWidget {
  NotificationsView({Key? key}) : super(key: key);

  NotificationsController notificationsController = Get.put(NotificationsController());
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
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: SizeConfig.padding24,
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TextString.emailNotification,
                  style: TextStyle(
                    fontFamily: FontFamily.lexendLight,
                    fontSize: FontSize.body2,
                    fontWeight: FontWeight.w300,
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                ),
                Obx(() => FlutterSwitch(
                  width: SizeConfig.width42,
                  height: SizeConfig.height20,
                  inactiveColor: ColorsConfig.modeInactiveColor,
                  toggleSize: SizeConfig.width16,
                  padding: SizeConfig.padding02,
                  value: notificationsController.switchValue.value,
                  activeColor: ColorsConfig.primaryColor,
                  activeToggleColor: ColorsConfig.secondaryColor,
                  borderRadius: 40,
                  onToggle: (value) {
                    notificationsController.switchValue.value = value;
                  },
                ),
                ),
              ],
            ),
            const SizedBox(
              height: SizeConfig.height26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TextString.generalNotification,
                  style: TextStyle(
                    fontFamily: FontFamily.lexendLight,
                    fontSize: FontSize.body2,
                    fontWeight: FontWeight.w300,
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                ),
                Obx(() => FlutterSwitch(
                  width: SizeConfig.width42,
                  height: SizeConfig.height20,
                  inactiveColor: ColorsConfig.modeInactiveColor,
                  toggleSize: SizeConfig.width16,
                  padding: SizeConfig.padding02,
                  value: notificationsController.switchValue2.value,
                  activeColor: ColorsConfig.primaryColor,
                  activeToggleColor: ColorsConfig.secondaryColor,
                  borderRadius: 40,
                  onToggle: (value) {
                    notificationsController.switchValue2.value = value;
                  },
                ),
                ),
              ],
            ),
            const SizedBox(
              height: SizeConfig.height26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TextString.newAndUpdates,
                  style: TextStyle(
                    fontFamily: FontFamily.lexendLight,
                    fontSize: FontSize.body2,
                    fontWeight: FontWeight.w300,
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                ),
                Obx(() => FlutterSwitch(
                  width: SizeConfig.width42,
                  height: SizeConfig.height20,
                  inactiveColor: ColorsConfig.modeInactiveColor,
                  toggleSize: SizeConfig.width16,
                  padding: SizeConfig.padding02,
                  value: notificationsController.switchValue3.value,
                  activeColor: ColorsConfig.primaryColor,
                  activeToggleColor: ColorsConfig.secondaryColor,
                  borderRadius: 40,
                  onToggle: (value) {
                    notificationsController.switchValue3.value = value;
                  },
                ),
                ),
              ],
            ),
            const SizedBox(
              height: SizeConfig.height26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TextString.specialOffers,
                  style: TextStyle(
                    fontFamily: FontFamily.lexendLight,
                    fontSize: FontSize.body2,
                    fontWeight: FontWeight.w300,
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                ),
                Obx(() => FlutterSwitch(
                  width: SizeConfig.width42,
                  height: SizeConfig.height20,
                  inactiveColor: ColorsConfig.modeInactiveColor,
                  toggleSize: SizeConfig.width16,
                  padding: SizeConfig.padding02,
                  value: notificationsController.switchValue4.value,
                  activeColor: ColorsConfig.primaryColor,
                  activeToggleColor: ColorsConfig.secondaryColor,
                  borderRadius: 40,
                  onToggle: (value) {
                    notificationsController.switchValue4.value = value;
                  },
                ),
                ),
              ],
            ),
            const SizedBox(
              height: SizeConfig.height26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TextString.payments,
                  style: TextStyle(
                    fontFamily: FontFamily.lexendLight,
                    fontSize: FontSize.body2,
                    fontWeight: FontWeight.w300,
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                ),
                Obx(() => FlutterSwitch(
                  width: SizeConfig.width42,
                  height: SizeConfig.height20,
                  inactiveColor: ColorsConfig.modeInactiveColor,
                  toggleSize: SizeConfig.width16,
                  padding: SizeConfig.padding02,
                  value: notificationsController.switchValue5.value,
                  activeColor: ColorsConfig.primaryColor,
                  activeToggleColor: ColorsConfig.secondaryColor,
                  borderRadius: 40,
                  onToggle: (value) {
                    notificationsController.switchValue5.value = value;
                  },
                ),
                ),
              ],
            ),
            const SizedBox(
              height: SizeConfig.height26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TextString.cashBack,
                  style: TextStyle(
                    fontFamily: FontFamily.lexendLight,
                    fontSize: FontSize.body2,
                    fontWeight: FontWeight.w300,
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                ),
                Obx(() => FlutterSwitch(
                  width: SizeConfig.width42,
                  height: SizeConfig.height20,
                  inactiveColor: ColorsConfig.modeInactiveColor,
                  toggleSize: SizeConfig.width16,
                  padding: SizeConfig.padding02,
                  value: notificationsController.switchValue6.value,
                  activeColor: ColorsConfig.primaryColor,
                  activeToggleColor: ColorsConfig.secondaryColor,
                  borderRadius: 40,
                  onToggle: (value) {
                    notificationsController.switchValue6.value = value;
                  },
                ),
                ),
              ],
            ),
            const SizedBox(
              height: SizeConfig.height26,
            ),
          ],
        ),
      ),
    ));
  }
}
