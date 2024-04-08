// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/image.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/controller/edit_profile_controller.dart';
import 'package:UrbanEraFashion/controllermy/currentuser_controller.dart';
import 'package:UrbanEraFashion/routes/app_routes.dart';
import 'package:UrbanEraFashion/views/profile/widget/logout_bottom_sheet.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  DarkModeController darkModeController = Get.put(DarkModeController());
  EditProfileController editProfileController =
      Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return Obx(() {
      User? user = userController.currentUser.value;
      Map<String, dynamic> userData = userController.userData.value;
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
          title: Padding(
            padding: const EdgeInsets.only(
              top: SizeConfig.padding10,
              left: SizeConfig.padding10,
            ),
            child: Text(
              TextString.profile,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.lexendMedium,
                fontSize: FontSize.heading4,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.primaryColor
                    : ColorsConfig.secondaryColor,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: SizeConfig.padding24,
            right: SizeConfig.padding24,
            top: SizeConfig.padding24,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.editProfileView);
                  },
                  child: Container(
                    height: SizeConfig.height88,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                      left: SizeConfig.padding12,
                      bottom: SizeConfig.padding12,
                      top: SizeConfig.padding12,
                      right: SizeConfig.padding16,
                    ),
                    decoration: BoxDecoration(
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: SizeConfig.height64,
                              width: SizeConfig.width64,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                              // child: Center(
                              //   child: Text(
                              //     "${userData['name'].toString().substring(0, 1).toUpperCase()}",
                              //     style: TextStyle(
                              //       fontWeight: FontWeight.w400,
                              //       fontFamily: FontFamily.lexendRegular,
                              //       fontSize: FontSize.fontSize30,
                              //       color: darkModeController.isLightTheme.value
                              //           ? ColorsConfig.secondaryColor
                              //           : ColorsConfig.buttonColor,
                              //     ),
                              //   ),
                              // ),
                              child: Obx(
                                () => editProfileController
                                        .pickedImagePath.value.isEmpty
                                    ? Center(
                                        child: Text(
                                          "${userData['name'].toString().substring(0, 1).toUpperCase()}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily:
                                                FontFamily.lexendRegular,
                                            fontSize: FontSize.fontSize30,
                                            color: darkModeController
                                                    .isLightTheme.value
                                                ? ColorsConfig.secondaryColor
                                                : ColorsConfig.buttonColor,
                                          ),
                                        ),
                                      )
                                    : ClipOval(
                                        child: Image.file(
                                          File(editProfileController
                                              .pickedImagePath.value),
                                          width: SizeConfig.width100,
                                          height: SizeConfig.width100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                            ),
                            const SizedBox(
                              width: SizeConfig.width12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ' ${userData['name']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontFamily.lexendMedium,
                                    fontSize: FontSize.body1,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: SizeConfig.height06,
                                ),
                                Text(
                                  '+91 ${userData['phone']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: FontFamily.lexendLight,
                                    fontSize: FontSize.body3,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Image(
                          image: const AssetImage(ImageConfig.nextArrow),
                          width: SizeConfig.width20,
                          height: SizeConfig.height20,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height16,
                ),
                Container(
                  height: SizeConfig.height134,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                    bottom: SizeConfig.padding14,
                    top: SizeConfig.padding14,
                    right: SizeConfig.padding16,
                    left: SizeConfig.padding16,
                  ),
                  decoration: BoxDecoration(
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadius14),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.myOrdersView);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TextString.myOrders,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: FontFamily.lexendLight,
                                fontSize: FontSize.body2,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            Image(
                              image: const AssetImage(ImageConfig.nextArrow),
                              width: SizeConfig.width18,
                              height: SizeConfig.height18,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                      ),
                      // GestureDetector(
                      //   // onTap: () {
                      //   //   Get.toNamed(AppRoutes.myReviewsView);
                      //   // },
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         TextString.myReviews,
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.w300,
                      //           fontFamily: FontFamily.lexendLight,
                      //           fontSize: FontSize.body2,
                      //           color: darkModeController.isLightTheme.value
                      //               ? ColorsConfig.primaryColor
                      //               : ColorsConfig.secondaryColor,
                      //         ),
                      //       ),
                      //       Image(
                      //         image: const AssetImage(ImageConfig.nextArrow),
                      //         width: SizeConfig.width18,
                      //         height: SizeConfig.height18,
                      //         color: darkModeController.isLightTheme.value
                      //             ? ColorsConfig.primaryColor
                      //             : ColorsConfig.secondaryColor,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Divider(
                      //   color: darkModeController.isLightTheme.value
                      //       ? ColorsConfig.lineColor
                      //       : ColorsConfig.lineDarkColor,
                      // ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.myAddressView,
                              arguments: 'profile');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TextString.myAddress,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: FontFamily.lexendLight,
                                fontSize: FontSize.body2,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            Image(
                              image: const AssetImage(ImageConfig.nextArrow),
                              width: SizeConfig.width18,
                              height: SizeConfig.height18,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.notificationsView);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TextString.notifications,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: FontFamily.lexendLight,
                                fontSize: FontSize.body2,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            Image(
                              image: const AssetImage(ImageConfig.nextArrow),
                              width: SizeConfig.width18,
                              height: SizeConfig.height18,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ],
                        ),
                      ),
                      // GestureDetector(
                      //   // onTap: () {
                      //   //   Get.toNamed(AppRoutes.saveForLaterView);
                      //   // },
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         TextString.saveForLater,
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.w300,
                      //           fontFamily: FontFamily.lexendLight,
                      //           fontSize: FontSize.body2,
                      //           color: darkModeController.isLightTheme.value
                      //               ? ColorsConfig.primaryColor
                      //               : ColorsConfig.secondaryColor,
                      //         ),
                      //       ),
                      //       Image(
                      //         image: const AssetImage(ImageConfig.nextArrow),
                      //         width: SizeConfig.width18,
                      //         height: SizeConfig.height18,
                      //         color: darkModeController.isLightTheme.value
                      //             ? ColorsConfig.primaryColor
                      //             : ColorsConfig.secondaryColor,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: SizeConfig.height16,
                // ),
                // Container(
                //   height: SizeConfig.height88,
                //   width: MediaQuery.of(context).size.width,
                //   padding: const EdgeInsets.only(
                //     bottom: SizeConfig.padding14,
                //     top: SizeConfig.padding14,
                //     right: SizeConfig.padding16,
                //     left: SizeConfig.padding16,
                //   ),
                //   decoration: BoxDecoration(
                //     color: darkModeController.isLightTheme.value
                //         ? ColorsConfig.secondaryColor
                //         : ColorsConfig.primaryColor,
                //     borderRadius:
                //         BorderRadius.circular(SizeConfig.borderRadius14),
                //   ),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Divider(
                //         color: darkModeController.isLightTheme.value
                //             ? ColorsConfig.lineColor
                //             : ColorsConfig.lineDarkColor,
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           Get.toNamed(AppRoutes.languagesView);
                //         },
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               TextString.languages,
                //               style: TextStyle(
                //                 fontWeight: FontWeight.w300,
                //                 fontFamily: FontFamily.lexendLight,
                //                 fontSize: FontSize.body2,
                //                 color: darkModeController.isLightTheme.value
                //                     ? ColorsConfig.primaryColor
                //                     : ColorsConfig.secondaryColor,
                //               ),
                //             ),
                //             Image(
                //               image: const AssetImage(ImageConfig.nextArrow),
                //               width: SizeConfig.width18,
                //               height: SizeConfig.height18,
                //               color: darkModeController.isLightTheme.value
                //                   ? ColorsConfig.primaryColor
                //                   : ColorsConfig.secondaryColor,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: SizeConfig.height16,
                ),
                Container(
                  height: SizeConfig.height50,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                    bottom: SizeConfig.padding14,
                    top: SizeConfig.padding14,
                    right: SizeConfig.padding16,
                    left: SizeConfig.padding16,
                  ),
                  decoration: BoxDecoration(
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadius14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        TextString.darkMode,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: FontFamily.lexendLight,
                          fontSize: FontSize.body2,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ),
                      ObxValue(
                        (data) => FlutterSwitch(
                          width: SizeConfig.width42,
                          height: SizeConfig.height20,
                          inactiveColor: ColorsConfig.modeInactiveColor,
                          toggleSize: SizeConfig.width16,
                          padding: SizeConfig.padding02,
                          value: editProfileController.switchValue.value,
                          activeColor: ColorsConfig.buttonColor,
                          borderRadius: 40,
                          onToggle: (value) {
                            editProfileController.switchValue.value = value;
                            darkModeController.isLightTheme.value = !value;
                            Get.changeThemeMode(
                              darkModeController.isLightTheme.value
                                  ? ThemeMode.light
                                  : ThemeMode.dark,
                            );
                            darkModeController.saveThemeStatus();
                          },
                        ),
                        false.obs,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height16,
                ),
                Container(
                  height: SizeConfig.height134,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                    bottom: SizeConfig.padding14,
                    top: SizeConfig.padding14,
                    right: SizeConfig.padding16,
                    left: SizeConfig.padding16,
                  ),
                  decoration: BoxDecoration(
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadius14),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.customerCareView);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TextString.customerCare,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: FontFamily.lexendLight,
                                fontSize: FontSize.body2,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            Image(
                              image: const AssetImage(ImageConfig.nextArrow),
                              width: SizeConfig.width18,
                              height: SizeConfig.height18,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.termsAndConditionsView);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TextString.termsAndConditions,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: FontFamily.lexendLight,
                                fontSize: FontSize.body2,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            Image(
                              image: const AssetImage(ImageConfig.nextArrow),
                              width: SizeConfig.width18,
                              height: SizeConfig.height18,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.returnsPolicyView);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TextString.returnsPolicy,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: FontFamily.lexendLight,
                                fontSize: FontSize.body2,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            Image(
                              image: const AssetImage(ImageConfig.nextArrow),
                              width: SizeConfig.width18,
                              height: SizeConfig.height18,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height16,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.whoWeAreView);
                  },
                  child: Container(
                    height: SizeConfig.height50,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                      bottom: SizeConfig.padding14,
                      top: SizeConfig.padding14,
                      right: SizeConfig.padding16,
                      left: SizeConfig.padding16,
                    ),
                    decoration: BoxDecoration(
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TextString.whoWeAre,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: FontFamily.lexendLight,
                            fontSize: FontSize.body2,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ),
                        Image(
                          image: const AssetImage(ImageConfig.nextArrow),
                          width: SizeConfig.width18,
                          height: SizeConfig.height18,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height24,
                ),
                GestureDetector(
                  onTap: () {
                    logoutBottomSheet(context);
                  },
                  child: Container(
                    height: SizeConfig.height52,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.buttonColor
                            : ColorsConfig.secondaryColor,
                      ),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    child: Center(
                      child: Text(
                        TextString.textButtonLogout,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: FontFamily.lexendMedium,
                          fontSize: FontSize.body1,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height40,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  String firstName =
      TextString.rajanSharma.isNotEmpty ? TextString.rajanSharma[0] : "";
  String lastName = TextString.rajanSharma.isNotEmpty
      ? TextString.rajanSharma.split(" ")[1][0]
      : "";
}
