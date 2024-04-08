// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/controller/edit_profile_controller.dart';
import 'package:UrbanEraFashion/controllermy/currentuser_controller.dart';
import 'package:UrbanEraFashion/views/profile/widget/change_mobile_number_bottom_sheet.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  EditProfileController editProfileController =
      Get.put(EditProfileController());
  DarkModeController darkModeController = Get.put(DarkModeController());

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    User? user = userController.currentUser.value;
    Map<String, dynamic> userData = userController.userData.value;

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
                      editProfileController.navigateBackAndReset();
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
                    TextString.myProfile,
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
              left: SizeConfig.padding24,
              right: SizeConfig.padding24,
              top: SizeConfig.padding40,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      editProfileController.openGallery();
                    },
                    child: Center(
                      child: Obx(
                        () => editProfileController
                                .pickedImagePath.value.isEmpty
                            ? Stack(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${userData['name'].toString().substring(0, 1).toUpperCase()}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontSize: 50,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.secondaryColor
                                              : ColorsConfig.buttonColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 3,
                                      right: 4,
                                      child: CircleAvatar(
                                        radius: 13,
                                        backgroundColor: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.secondaryColor
                                            : ColorsConfig.primaryColor,
                                        child: CircleAvatar(
                                          backgroundColor: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                          radius: 10,
                                          child: Icon(
                                            Icons.edit,
                                            size: 15,
                                            color: darkModeController
                                                    .isLightTheme.value
                                                ? ColorsConfig.secondaryColor
                                                : ColorsConfig.primaryColor,
                                          ),
                                        ),
                                      )),
                                ],
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
                  ),
                  const SizedBox(
                    height: SizeConfig.height32,
                  ),
                  GestureDetector(
                    onTap: () {
                      editProfileController.onTapText();
                    },
                    child: Container(
                      height: SizeConfig.height80,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding20,
                        top: SizeConfig.padding11,
                        bottom: SizeConfig.padding11,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.borderRadius14),
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.secondaryColor
                            : ColorsConfig.primaryColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextString.firstName,
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendRegular,
                              fontWeight: FontWeight.w400,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                          Obx(() {
                            if (editProfileController.isTextTapped.value ||
                                editProfileController
                                    .firstNameController.text.isNotEmpty) {
                              return SizedBox(
                                height: SizeConfig.height30,
                                child: TextField(
                                  controller:
                                      editProfileController.firstNameController,
                                  cursorColor: ColorsConfig.primaryColor,
                                  focusNode: editProfileController.focusNode,
                                  style: TextStyle(
                                    fontSize: FontSize.body1,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontWeight: FontWeight.w400,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    // hintText: TextString.firstName,
                                    hintStyle: TextStyle(
                                      fontSize: FontSize.body2,
                                      fontFamily: FontFamily.lexendRegular,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      editProfileController.focusNode.unfocus();
                                    }
                                  },
                                  onSubmitted: (value) {
                                    if (value.isEmpty) {
                                      editProfileController.focusNode.unfocus();
                                    }
                                  },
                                  onTapOutside: (event) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  GestureDetector(
                    onTap: () {
                      editProfileController.onTapText2();
                    },
                    child: Container(
                      height: SizeConfig.height80,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding20,
                        top: SizeConfig.padding11,
                        bottom: SizeConfig.padding11,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.borderRadius14),
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.secondaryColor
                            : ColorsConfig.primaryColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendRegular,
                              fontWeight: FontWeight.w400,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                          Obx(() {
                            if (editProfileController.isTextTapped2.value ||
                                editProfileController
                                    .lastNameController.text.isNotEmpty) {
                              return SizedBox(
                                height: SizeConfig.height30,
                                child: TextField(
                                  controller:
                                      editProfileController.lastNameController,
                                  cursorColor:
                                      darkModeController.isLightTheme.value
                                          ? ColorsConfig.primaryColor
                                          : ColorsConfig.secondaryColor,
                                  focusNode: editProfileController.focusNode2,
                                  style: TextStyle(
                                    fontSize: FontSize.body1,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontWeight: FontWeight.w400,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    // hintText: TextString.lastName,
                                    hintStyle: TextStyle(
                                      fontSize: FontSize.body2,
                                      fontFamily: FontFamily.lexendRegular,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      editProfileController.focusNode2
                                          .unfocus();
                                    }
                                  },
                                  onSubmitted: (value) {
                                    if (value.isEmpty) {
                                      editProfileController.focusNode2
                                          .unfocus();
                                    }
                                  },
                                  onTapOutside: (event) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  GestureDetector(
                    onTap: () {
                      editProfileController.onTapText3();
                    },
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          height: SizeConfig.height80,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                            left: SizeConfig.padding20,
                            top: SizeConfig.padding11,
                            bottom: SizeConfig.padding11,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius14),
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.secondaryColor
                                : ColorsConfig.primaryColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                TextString.mobileNumber,
                                style: TextStyle(
                                  fontSize: FontSize.body2,
                                  fontFamily: FontFamily.lexendRegular,
                                  fontWeight: FontWeight.w400,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.textColor
                                      : ColorsConfig.modeInactiveColor,
                                ),
                              ),
                              Obx(() {
                                if (editProfileController.isTextTapped3.value ||
                                    editProfileController.mobileNumberController
                                        .text.isNotEmpty) {
                                  return SizedBox(
                                    height: SizeConfig.height30,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(
                                            SizeConfig.lengthSize10),
                                      ],
                                      controller: editProfileController
                                          .mobileNumberController,
                                      cursorColor:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                      focusNode:
                                          editProfileController.focusNode3,
                                      style: TextStyle(
                                        fontSize: FontSize.body1,
                                        fontFamily: FontFamily.lexendRegular,
                                        fontWeight: FontWeight.w400,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.zero,
                                        // hintText: TextString.mobileNumber,
                                        hintStyle: TextStyle(
                                          fontSize: FontSize.body2,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontWeight: FontWeight.w400,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      onChanged: (value) {
                                        if (value.isEmpty) {
                                          editProfileController.focusNode3
                                              .unfocus();
                                        }
                                      },
                                      onSubmitted: (value) {
                                        if (value.isEmpty) {
                                          editProfileController.focusNode3
                                              .unfocus();
                                        }
                                      },
                                      onTapOutside: (event) {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              }),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //     right: SizeConfig.padding20,
                        //   ),
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       changeMobileNumberBottomSheet(context);
                        //     },
                        //     child: Text(
                        //       TextString.change,
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.w300,
                        //         fontSize: FontSize.body3,
                        //         color: darkModeController.isLightTheme.value
                        //             ? ColorsConfig.textColor
                        //             : ColorsConfig.modeInactiveColor,
                        //         fontFamily: FontFamily.lexendLight,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      height: SizeConfig.height70,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding20,
                        top: SizeConfig.padding11,
                        bottom: SizeConfig.padding11,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.borderRadius14),
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.secondaryColor
                            : ColorsConfig.primaryColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            editProfileController.selectedDate != null
                                ? "${editProfileController.selectedDate!.toLocal()}"
                                    .split(' ')[0]
                                : TextString.selectBirthDate,
                            style: TextStyle(
                              fontSize:
                                  editProfileController.selectedDate != null
                                      ? FontSize.body1
                                      : FontSize.body2,
                              fontFamily: FontFamily.lexendRegular,
                              fontWeight: FontWeight.w400,
                              color: editProfileController.selectedDate != null
                                  ? darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor
                                  : ColorsConfig.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  Text(
                    TextString.gender,
                    style: TextStyle(
                      fontSize: FontSize.body2,
                      fontFamily: FontFamily.lexendLight,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.textColor
                          : ColorsConfig.modeInactiveColor,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height12,
                  ),
                  SizedBox(
                    height: SizeConfig.height20,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: editProfileController.genderTypes.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                editProfileController.selectContainer(index);
                              },
                              child: Obx(
                                () => Image(
                                  image: AssetImage(
                                    editProfileController
                                        .getContainerImage(index),
                                  ),
                                  width: SizeConfig.width16,
                                  height: SizeConfig.height16,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: SizeConfig.width10,
                            ),
                            Text(
                              editProfileController.genderTypes[index],
                              style: TextStyle(
                                fontSize: FontSize.body2,
                                fontFamily: FontFamily.lexendRegular,
                                fontWeight: FontWeight.w400,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            const SizedBox(
                              width: SizeConfig.width32,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(
              left: SizeConfig.padding24,
              right: SizeConfig.padding24,
              bottom: SizeConfig.padding24,
            ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: SizeConfig.height52,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.buttonColor
                      : ColorsConfig.secondaryColor,
                  borderRadius:
                      BorderRadius.circular(SizeConfig.borderRadius14),
                ),
                child: Center(
                  child: Text(
                    TextString.textButtonSubmit,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: FontFamily.lexendMedium,
                      fontSize: FontSize.body1,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: editProfileController.selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      keyboardType: TextInputType.datetime,
      builder: (BuildContext context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorsConfig.primaryColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorsConfig.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != editProfileController.selectedDate) {
      setState(() {
        editProfileController.selectedDate = picked;
      });
    }
  }
}
