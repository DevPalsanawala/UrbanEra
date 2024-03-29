// ignore_for_file: must_be_immutable, empty_catches

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/add_address_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({Key? key}) : super(key: key);

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  AddAddressController addAddressController = Get.put(AddAddressController());
  DarkModeController darkModeController = Get.put(DarkModeController());

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    addAddressController.focusNode.addListener(() {
      if (!addAddressController.focusNode.hasFocus &&
          addAddressController.nameController.text.isEmpty) {
        addAddressController.resetFocus();
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
                        addAddressController.navigateBackAndReset();
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
                          addAddressController.onTapText();
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
                                  if (addAddressController.isTextTapped.value ||
                                      addAddressController
                                          .nameController.text.isNotEmpty) {
                                    return SizedBox(
                                      height: SizeConfig.height30,
                                      child: TextField(
                                        controller:
                                            addAddressController.nameController,
                                        cursorColor: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                        autofocus: true,
                                        focusNode:
                                            addAddressController.focusNode,
                                        style: TextStyle(
                                          fontSize: FontSize.body1,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontWeight: FontWeight.w400,
                                          color: darkModeController
                                                  .isLightTheme.value
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
                                            addAddressController.focusNode
                                                .unfocus();
                                          }
                                          addAddressController
                                              .checkButtonEnabled();
                                        },
                                        onSubmitted: (value) {
                                          if (value.isEmpty) {
                                            addAddressController.focusNode
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
                          addAddressController.onTapText2();
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
                              Obx(
                                () {
                                  if (addAddressController
                                          .isTextTapped2.value ||
                                      addAddressController
                                          .mobileNumberController
                                          .text
                                          .isNotEmpty) {
                                    return SizedBox(
                                      height: SizeConfig.height30,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(
                                              SizeConfig.lengthSize10),
                                        ],
                                        controller: addAddressController
                                            .mobileNumberController,
                                        cursorColor: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                        autofocus: true,
                                        focusNode:
                                            addAddressController.focusNode2,
                                        style: TextStyle(
                                          fontSize: FontSize.body1,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontWeight: FontWeight.w400,
                                          color: darkModeController
                                                  .isLightTheme.value
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
                                            addAddressController.focusNode2
                                                .unfocus();
                                          }
                                          addAddressController
                                              .checkButtonEnabled();
                                        },
                                        onSubmitted: (value) {
                                          if (value.isEmpty) {
                                            addAddressController.focusNode2
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
                          addAddressController.onTapText3();
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
                                  if (addAddressController
                                          .isTextTapped3.value ||
                                      addAddressController
                                          .pinCodeController.text.isNotEmpty) {
                                    return SizedBox(
                                      height: SizeConfig.height30,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(
                                              SizeConfig.lengthSize06),
                                        ],
                                        controller: addAddressController
                                            .pinCodeController,
                                        cursorColor: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                        autofocus: true,
                                        focusNode:
                                            addAddressController.focusNode3,
                                        style: TextStyle(
                                          fontSize: FontSize.body1,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontWeight: FontWeight.w400,
                                          color: darkModeController
                                                  .isLightTheme.value
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
                                            addAddressController.focusNode3
                                                .unfocus();
                                          }
                                          addAddressController
                                              .checkButtonEnabled();
                                        },
                                        onSubmitted: (value) {
                                          if (value.isEmpty) {
                                            addAddressController.focusNode3
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
                                addAddressController.onTapText4();
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
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                    ),
                                    Obx(
                                      () {
                                        if (addAddressController
                                                .isTextTapped4.value ||
                                            addAddressController.stateController
                                                .text.isNotEmpty) {
                                          return SizedBox(
                                            height: SizeConfig.height30,
                                            child: TextField(
                                              controller: addAddressController
                                                  .stateController,
                                              cursorColor: darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.primaryColor
                                                  : ColorsConfig.secondaryColor,
                                              autofocus: true,
                                              focusNode: addAddressController
                                                  .focusNode4,
                                              style: TextStyle(
                                                fontSize: FontSize.body1,
                                                fontFamily:
                                                    FontFamily.lexendRegular,
                                                fontWeight: FontWeight.w400,
                                                color: darkModeController
                                                        .isLightTheme.value
                                                    ? ColorsConfig.primaryColor
                                                    : ColorsConfig
                                                        .secondaryColor,
                                              ),
                                              decoration: const InputDecoration(
                                                contentPadding: EdgeInsets.zero,
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                              onChanged: (value) {
                                                if (value.isEmpty) {
                                                  addAddressController
                                                      .focusNode4
                                                      .unfocus();
                                                }
                                                addAddressController
                                                    .checkButtonEnabled();
                                              },
                                              onSubmitted: (value) {
                                                if (value.isEmpty) {
                                                  addAddressController
                                                      .focusNode4
                                                      .unfocus();
                                                }
                                              },
                                              onTapOutside: (event) {
                                                FocusManager
                                                    .instance.primaryFocus
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
                                addAddressController.onTapText5();
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
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                    ),
                                    Obx(
                                      () {
                                        if (addAddressController
                                                .isTextTapped5.value ||
                                            addAddressController.cityController
                                                .text.isNotEmpty) {
                                          return SizedBox(
                                            height: SizeConfig.height30,
                                            child: TextField(
                                              controller: addAddressController
                                                  .cityController,
                                              cursorColor: darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.primaryColor
                                                  : ColorsConfig.secondaryColor,
                                              autofocus: true,
                                              focusNode: addAddressController
                                                  .focusNode5,
                                              style: TextStyle(
                                                fontSize: FontSize.body1,
                                                fontFamily:
                                                    FontFamily.lexendRegular,
                                                fontWeight: FontWeight.w400,
                                                color: darkModeController
                                                        .isLightTheme.value
                                                    ? ColorsConfig.primaryColor
                                                    : ColorsConfig
                                                        .secondaryColor,
                                              ),
                                              decoration: const InputDecoration(
                                                contentPadding: EdgeInsets.zero,
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                              onChanged: (value) {
                                                if (value.isEmpty) {
                                                  addAddressController
                                                      .focusNode5
                                                      .unfocus();
                                                }
                                                addAddressController
                                                    .checkButtonEnabled();
                                              },
                                              onSubmitted: (value) {
                                                if (value.isEmpty) {
                                                  addAddressController
                                                      .focusNode5
                                                      .unfocus();
                                                }
                                              },
                                              onTapOutside: (event) {
                                                FocusManager
                                                    .instance.primaryFocus
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
                          addAddressController.onTapText6();
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
                                  if (addAddressController
                                          .isTextTapped6.value ||
                                      addAddressController
                                          .houseController.text.isNotEmpty) {
                                    return SizedBox(
                                      height: SizeConfig.height30,
                                      child: TextField(
                                        controller: addAddressController
                                            .houseController,
                                        cursorColor: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                        autofocus: true,
                                        focusNode:
                                            addAddressController.focusNode6,
                                        style: TextStyle(
                                          fontSize: FontSize.body1,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontWeight: FontWeight.w400,
                                          color: darkModeController
                                                  .isLightTheme.value
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
                                            addAddressController.focusNode6
                                                .unfocus();
                                          }
                                          addAddressController
                                              .checkButtonEnabled();
                                        },
                                        onSubmitted: (value) {
                                          if (value.isEmpty) {
                                            addAddressController.focusNode6
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
                          addAddressController.onTapText7();
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
                                  if (addAddressController
                                          .isTextTapped7.value ||
                                      addAddressController
                                          .areaController.text.isNotEmpty) {
                                    return SizedBox(
                                      height: SizeConfig.height30,
                                      child: TextField(
                                        controller:
                                            addAddressController.areaController,
                                        cursorColor: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                        autofocus: true,
                                        focusNode:
                                            addAddressController.focusNode7,
                                        style: TextStyle(
                                          fontSize: FontSize.body1,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontWeight: FontWeight.w400,
                                          color: darkModeController
                                                  .isLightTheme.value
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
                                            addAddressController.focusNode7
                                                .unfocus();
                                          }
                                          addAddressController
                                              .checkButtonEnabled();
                                        },
                                        onSubmitted: (value) {
                                          if (value.isEmpty) {
                                            addAddressController.focusNode7
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
                          addAddressController.onTapText8();
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
                                  if (addAddressController
                                          .isTextTapped8.value ||
                                      addAddressController
                                          .landMarkController.text.isNotEmpty) {
                                    return SizedBox(
                                      height: SizeConfig.height30,
                                      child: TextField(
                                        controller: addAddressController
                                            .landMarkController,
                                        cursorColor: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                        autofocus: true,
                                        focusNode:
                                            addAddressController.focusNode8,
                                        style: TextStyle(
                                          fontSize: FontSize.body1,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontWeight: FontWeight.w400,
                                          color: darkModeController
                                                  .isLightTheme.value
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
                                            addAddressController.focusNode8
                                                .unfocus();
                                          }
                                        },
                                        onSubmitted: (value) {
                                          if (value.isEmpty) {
                                            addAddressController.focusNode8
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
                          itemCount: addAddressController.addressTypes.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    addAddressController.selectContainer(index);
                                  },
                                  child: Obx(
                                    () => Image(
                                      image: AssetImage(
                                        addAddressController
                                            .getContainerImage(index),
                                      ),
                                      width: SizeConfig.width16,
                                      height: SizeConfig.height16,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: SizeConfig.width10,
                                ),
                                Text(
                                  addAddressController.addressTypes[index],
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
                          if (addAddressController.isButtonEnabled.value) {
                            Get.back();
                          } else {}
                        },
                        child: Obx(
                          () => Container(
                            height: SizeConfig.height52,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: addAddressController.isButtonEnabled.value
                                  ? (darkModeController.isLightTheme.value
                                      ? ColorsConfig.buttonColor
                                      : ColorsConfig.secondaryColor)
                                  : ColorsConfig.buttonDisableColor,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadius14),
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
      addAddressController.currentPosition =
          await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      _getAddressFromLatLng();
    } catch (e) {}
  }

  Future<void> _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        addAddressController.currentPosition!.latitude,
        addAddressController.currentPosition!.longitude,
      );

      setState(() {
        if (placemarks.isNotEmpty) {
          final first = placemarks[0];
          addAddressController.cityController.text = first.locality ?? "";
          addAddressController.stateController.text =
              first.administrativeArea ?? "";
          addAddressController.areaController.text = first.subLocality ?? "";
          addAddressController.houseController.text =
              first.subThoroughfare ?? "";
        }
      });
    } catch (e) {}
  }
}
