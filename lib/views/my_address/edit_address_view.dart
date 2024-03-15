// ignore_for_file: must_be_immutable, empty_catches

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/edit_address_controller.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';

class EditAddressView extends StatefulWidget {
  const EditAddressView({Key? key}) : super(key: key);

  @override
  State<EditAddressView> createState() => _EditAddressViewState();
}

class _EditAddressViewState extends State<EditAddressView> {
  EditAddressController editAddressController = Get.put(EditAddressController());
  DarkModeController darkModeController = Get.put(DarkModeController());

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    editAddressController.focusNode.addListener(() {
      if (!editAddressController.focusNode.hasFocus &&
          editAddressController.nameController.text.isEmpty) {
        editAddressController.resetFocus();
      }
    });
    return Obx(() => Scaffold(
      backgroundColor: darkModeController.isLightTheme.value
          ? ColorsConfig.backgroundColor
          : ColorsConfig.buttonColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(SizeConfig.height75),
        child: AppBar(
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
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    editAddressController.navigateBackAndReset();
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
                  TextString.addAddress,
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
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: _getCurrentLocation,
              child: Container(
                height: SizeConfig.height48,
                width: MediaQuery.of(context).size.width,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.primaryColor
                    : ColorsConfig.secondaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: const AssetImage(ImageConfig.gps),
                      width: SizeConfig.width20,
                      height: SizeConfig.height20,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                    ),
                    const SizedBox(
                      width: SizeConfig.width08,
                    ),
                    Text(
                      TextString.useMyLocation,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.lexendRegular,
                        fontSize: FontSize.body2,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.secondaryColor
                            : ColorsConfig.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: SizeConfig.padding24,
                left: SizeConfig.padding24,
                right: SizeConfig.padding24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      editAddressController.onTapText();
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextString.name,
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendRegular,
                              fontWeight: FontWeight.w400,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                          Obx(
                                () {
                              if (editAddressController.isTextTapped.value ||
                                  editAddressController
                                      .nameController.text.isNotEmpty) {
                                return SizedBox(
                                  height: SizeConfig.height30,
                                  child: TextField(
                                    controller:
                                    editAddressController.nameController,
                                    cursorColor: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                    autofocus: true,
                                    focusNode: editAddressController.focusNode,
                                    style: TextStyle(
                                      fontSize: FontSize.body1,
                                      fontFamily: FontFamily.lexendRegular,
                                      fontWeight: FontWeight.w400,
                                      color: darkModeController.isLightTheme.value
                                          ? ColorsConfig.primaryColor
                                          : ColorsConfig.secondaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        editAddressController.focusNode
                                            .unfocus();
                                      }
                                      editAddressController.checkButtonEnabled();
                                    },
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        editAddressController.focusNode
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
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  GestureDetector(
                    onTap: () {
                      editAddressController.onTapText2();
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
                          Obx(
                                () {
                              if (editAddressController.isTextTapped2.value ||
                                  editAddressController
                                      .mobileNumberController.text.isNotEmpty) {
                                return SizedBox(
                                  height: SizeConfig.height30,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(SizeConfig.lengthSize10),
                                    ],
                                    controller: editAddressController
                                        .mobileNumberController,
                                    cursorColor: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                    autofocus: true,
                                    focusNode: editAddressController.focusNode2,
                                    style: TextStyle(
                                      fontSize: FontSize.body1,
                                      fontFamily: FontFamily.lexendRegular,
                                      fontWeight: FontWeight.w400,
                                      color: darkModeController.isLightTheme.value
                                          ? ColorsConfig.primaryColor
                                          : ColorsConfig.secondaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        editAddressController.focusNode2
                                            .unfocus();
                                      }
                                      editAddressController.checkButtonEnabled();
                                    },
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        editAddressController.focusNode2
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
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  GestureDetector(
                    onTap: () {
                      editAddressController.onTapText3();
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextString.pinCode,
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendRegular,
                              fontWeight: FontWeight.w400,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                          Obx(
                                () {
                              if (editAddressController.isTextTapped3.value ||
                                  editAddressController
                                      .pinCodeController.text.isNotEmpty) {
                                return SizedBox(
                                  height: SizeConfig.height30,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(SizeConfig.lengthSize06),
                                    ],
                                    controller:
                                    editAddressController.pinCodeController,
                                    cursorColor: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                    autofocus: true,
                                    focusNode: editAddressController.focusNode3,
                                    style: TextStyle(
                                      fontSize: FontSize.body1,
                                      fontFamily: FontFamily.lexendRegular,
                                      fontWeight: FontWeight.w400,
                                      color: darkModeController.isLightTheme.value
                                          ? ColorsConfig.primaryColor
                                          : ColorsConfig.secondaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        editAddressController.focusNode3
                                            .unfocus();
                                      }
                                      editAddressController.checkButtonEnabled();
                                    },
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        editAddressController.focusNode3
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
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            editAddressController.onTapText4();
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
                                  TextString.state,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontWeight: FontWeight.w400,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                  ),
                                ),
                                Obx(
                                      () {
                                    if (editAddressController
                                        .isTextTapped4.value ||
                                        editAddressController
                                            .stateController.text.isNotEmpty) {
                                      return SizedBox(
                                        height: SizeConfig.height30,
                                        child: TextField(
                                          controller: editAddressController
                                              .stateController,
                                          cursorColor: darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                          autofocus: true,
                                          focusNode:
                                          editAddressController.focusNode4,
                                          style: TextStyle(
                                            fontSize: FontSize.body1,
                                            fontFamily:
                                            FontFamily.lexendRegular,
                                            fontWeight: FontWeight.w400,
                                            color: darkModeController.isLightTheme.value
                                                ? ColorsConfig.primaryColor
                                                : ColorsConfig.secondaryColor,
                                          ),
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            if (value.isEmpty) {
                                              editAddressController.focusNode4
                                                  .unfocus();
                                            }
                                            editAddressController.checkButtonEnabled();
                                          },
                                          onSubmitted: (value) {
                                            if (value.isEmpty) {
                                              editAddressController.focusNode4
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
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: SizeConfig.height16,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            editAddressController.onTapText5();
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
                                  TextString.city,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontWeight: FontWeight.w400,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                  ),
                                ),
                                Obx(
                                      () {
                                    if (editAddressController
                                        .isTextTapped5.value ||
                                        editAddressController
                                            .cityController.text.isNotEmpty) {
                                      return SizedBox(
                                        height: SizeConfig.height30,
                                        child: TextField(
                                          controller: editAddressController
                                              .cityController,
                                          cursorColor: darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                          autofocus: true,
                                          focusNode:
                                          editAddressController.focusNode5,
                                          style: TextStyle(
                                            fontSize: FontSize.body1,
                                            fontFamily:
                                            FontFamily.lexendRegular,
                                            fontWeight: FontWeight.w400,
                                            color: darkModeController.isLightTheme.value
                                                ? ColorsConfig.primaryColor
                                                : ColorsConfig.secondaryColor,
                                          ),
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            if (value.isEmpty) {
                                              editAddressController.focusNode5
                                                  .unfocus();
                                            }
                                            editAddressController.checkButtonEnabled();
                                          },
                                          onSubmitted: (value) {
                                            if (value.isEmpty) {
                                              editAddressController.focusNode5
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
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  GestureDetector(
                    onTap: () {
                      editAddressController.onTapText6();
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextString.houseNo,
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendRegular,
                              fontWeight: FontWeight.w400,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                          Obx(
                                () {
                              if (editAddressController.isTextTapped6.value ||
                                  editAddressController
                                      .houseController.text.isNotEmpty) {
                                return SizedBox(
                                  height: SizeConfig.height30,
                                  child: TextField(
                                    controller:
                                    editAddressController.houseController,
                                    cursorColor: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                    autofocus: true,
                                    focusNode: editAddressController.focusNode6,
                                    style: TextStyle(
                                      fontSize: FontSize.body1,
                                      fontFamily: FontFamily.lexendRegular,
                                      fontWeight: FontWeight.w400,
                                      color: darkModeController.isLightTheme.value
                                          ? ColorsConfig.primaryColor
                                          : ColorsConfig.secondaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        editAddressController.focusNode6
                                            .unfocus();
                                      }
                                      editAddressController.checkButtonEnabled();
                                    },
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        editAddressController.focusNode6
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
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  GestureDetector(
                    onTap: () {
                      editAddressController.onTapText7();
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextString.roadName,
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendRegular,
                              fontWeight: FontWeight.w400,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                          Obx(
                                () {
                              if (editAddressController.isTextTapped7.value ||
                                  editAddressController
                                      .areaController.text.isNotEmpty) {
                                return SizedBox(
                                  height: SizeConfig.height30,
                                  child: TextField(
                                    controller:
                                    editAddressController.areaController,
                                    cursorColor: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                    autofocus: true,
                                    focusNode: editAddressController.focusNode7,
                                    style: TextStyle(
                                      fontSize: FontSize.body1,
                                      fontFamily: FontFamily.lexendRegular,
                                      fontWeight: FontWeight.w400,
                                      color: darkModeController.isLightTheme.value
                                          ? ColorsConfig.primaryColor
                                          : ColorsConfig.secondaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        editAddressController.focusNode7
                                            .unfocus();
                                      }
                                      editAddressController.checkButtonEnabled();
                                    },
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        editAddressController.focusNode7
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
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  GestureDetector(
                    onTap: () {
                      editAddressController.onTapText8();
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextString.landMark,
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendRegular,
                              fontWeight: FontWeight.w400,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                          Obx(
                                () {
                              if (editAddressController.isTextTapped8.value ||
                                  editAddressController
                                      .landMarkController.text.isNotEmpty) {
                                return SizedBox(
                                  height: SizeConfig.height30,
                                  child: TextField(
                                    controller:
                                    editAddressController.landMarkController,
                                    cursorColor: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                    autofocus: true,
                                    focusNode: editAddressController.focusNode8,
                                    style: TextStyle(
                                      fontSize: FontSize.body1,
                                      fontFamily: FontFamily.lexendRegular,
                                      fontWeight: FontWeight.w400,
                                      color: darkModeController.isLightTheme.value
                                          ? ColorsConfig.primaryColor
                                          : ColorsConfig.secondaryColor,
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        editAddressController.focusNode8
                                            .unfocus();
                                      }
                                    },
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        editAddressController.focusNode8
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
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  Text(
                    TextString.typesOfAddress,
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
                      itemCount: editAddressController.addressTypes.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                editAddressController.selectContainer(index);
                              },
                              child: Obx(
                                    () => Image(
                                  image: AssetImage(
                                    editAddressController
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
                              editAddressController.addressTypes[index],
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
                              width: SizeConfig.width24,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height40,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (editAddressController.isButtonEnabled.value) {
                        Get.back();
                      } else {
                      }
                    },
                    child: Obx(
                          () => Container(
                        height: SizeConfig.height52,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: editAddressController.isButtonEnabled.value
                              ? (darkModeController.isLightTheme.value
                              ? ColorsConfig.buttonColor
                              : ColorsConfig.secondaryColor)
                              : ColorsConfig.buttonDisableColor,
                          borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                        ),
                        child: Center(
                          child: Text(
                            TextString.textButtonSaveAddress,
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
                  const SizedBox(
                    height: SizeConfig.height24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> _getCurrentLocation() async {
    try {
      editAddressController.currentPosition =
      await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      _getAddressFromLatLng();
    } catch (e) {}
  }

  Future<void> _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        editAddressController.currentPosition!.latitude,
        editAddressController.currentPosition!.longitude,
      );

      setState(() {
        if (placemarks.isNotEmpty) {
          final first = placemarks[0];
          editAddressController.cityController.text = first.locality ?? "";
          editAddressController.stateController.text =
              first.administrativeArea ?? "";
          editAddressController.areaController.text = first.subLocality ?? "";
        }
      });
    } catch (e) {}
  }
}
