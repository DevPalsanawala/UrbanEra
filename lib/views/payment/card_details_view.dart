// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/controller/card_details_controller.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/views/payment/payment_successful_view.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';

class CardDetailsView extends StatelessWidget {
  CardDetailsView({Key? key}) : super(key: key);

  CardDetailsController cardDetailsController =
      Get.put(CardDetailsController());
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
                  cardDetailsController.navigateBackAndReset();
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
                TextString.creditDebitCard,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      cardDetailsController.onTapText();
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
                            TextString.nameOnTheCard,
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
                              if (cardDetailsController.isTextTapped.value ||
                                  cardDetailsController
                                      .nameController.text.isNotEmpty) {
                                return SizedBox(
                                  height: SizeConfig.height30,
                                  child: TextField(
                                    controller:
                                    cardDetailsController.nameController,
                                    cursorColor: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                    autofocus: true,
                                    focusNode: cardDetailsController.focusNode,
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
                                        cardDetailsController.focusNode
                                            .unfocus();
                                      }
                                      cardDetailsController
                                          .checkButtonEnabled();
                                    },
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        cardDetailsController.focusNode
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
                      cardDetailsController.onTapText2();
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
                            TextString.cardNumber,
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
                              if (cardDetailsController.isTextTapped2.value ||
                                  cardDetailsController
                                      .cardNumberController.text.isNotEmpty) {
                                return SizedBox(
                                  height: SizeConfig.height30,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(SizeConfig.lengthSize16),
                                    ],
                                    controller: cardDetailsController
                                        .cardNumberController,
                                    cursorColor: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                    autofocus: true,
                                    focusNode: cardDetailsController.focusNode2,
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
                                        cardDetailsController.focusNode2
                                            .unfocus();
                                      }
                                      cardDetailsController
                                          .checkButtonEnabled();
                                    },
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        cardDetailsController.focusNode2
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
                            cardDetailsController.onTapText3();
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
                                  TextString.expiryDate,
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
                                    if (cardDetailsController
                                        .isTextTapped3.value ||
                                        cardDetailsController
                                            .expiryController.text.isNotEmpty) {
                                      return SizedBox(
                                        height: SizeConfig.height30,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          controller: cardDetailsController
                                              .expiryController,
                                          cursorColor: darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                          autofocus: true,
                                          focusNode:
                                          cardDetailsController.focusNode3,
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
                                              cardDetailsController.focusNode3
                                                  .unfocus();
                                            }
                                            cardDetailsController
                                                .checkButtonEnabled();
                                          },
                                          onSubmitted: (value) {
                                            if (value.isEmpty) {
                                              cardDetailsController.focusNode3
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
                            cardDetailsController.onTapText4();
                          },
                          child: Stack(
                            children: [
                              Container(
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
                                      TextString.cvv,
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
                                        if (cardDetailsController
                                            .isTextTapped4.value ||
                                            cardDetailsController.cvvController
                                                .text.isNotEmpty) {
                                          return SizedBox(
                                            height: SizeConfig.height30,
                                            child: TextField(
                                              keyboardType: TextInputType.number,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(SizeConfig.lengthSize03),
                                              ],
                                              controller: cardDetailsController
                                                  .cvvController,
                                              cursorColor: darkModeController.isLightTheme.value
                                                  ? ColorsConfig.primaryColor
                                                  : ColorsConfig.secondaryColor,
                                              autofocus: true,
                                              focusNode: cardDetailsController
                                                  .focusNode4,
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
                                                  cardDetailsController
                                                      .focusNode4
                                                      .unfocus();
                                                }
                                                cardDetailsController
                                                    .checkButtonEnabled();
                                              },
                                              onSubmitted: (value) {
                                                if (value.isEmpty) {
                                                  cardDetailsController
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
                              Positioned(
                                top: SizeConfig.padding08,
                                right: SizeConfig.padding08,
                                child: Image(
                                  image: const AssetImage(ImageConfig.information),
                                  width: SizeConfig.width14,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.textColor
                                      : ColorsConfig.modeInactiveColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SizeConfig.height24,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          cardDetailsController.toggleImage();
                        },
                        child: Obx(() => Image(
                          image: AssetImage(
                            cardDetailsController.isImageToggled.value
                                ? darkModeController.isLightTheme.value
                                ? ImageConfig.checkboxFill
                                : ImageConfig.checkBoxFillDark
                                : darkModeController.isLightTheme.value
                                ? ImageConfig.checkbox
                                : ImageConfig.checkBoxDark,
                          ),
                          width: SizeConfig.width18,
                        ),
                        ),
                      ),
                      const SizedBox(
                        width: SizeConfig.width08,
                      ),
                      Text(
                        TextString.saveThisCard,
                        style: TextStyle(
                          fontSize: FontSize.body2,
                          fontWeight: FontWeight.w300,
                          fontFamily: FontFamily.lexendLight,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.textColor
                              : ColorsConfig.modeInactiveColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
          top: SizeConfig.padding18,
          bottom: SizeConfig.padding24,
        ),
        child: GestureDetector(
          onTap: () {
            if (cardDetailsController.isButtonEnabled.value) {
              showDialog(
                context: context,
                builder: (context) {
                  return PaymentSuccessfulView();
                },
              );
            } else {}
          },
          child: Obx(
                () => Container(
              height: SizeConfig.height52,
              width: double.infinity,
              decoration: BoxDecoration(
                color: cardDetailsController.isButtonEnabled.value
                    ? darkModeController.isLightTheme.value
                    ? ColorsConfig.buttonColor
                    : ColorsConfig.secondaryColor
                    : darkModeController.isLightTheme.value
                    ? ColorsConfig.buttonDisableColor
                    : ColorsConfig.modeInactiveColor,
                borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
              ),
              child: Center(
                child: Text(
                  TextString.textButtonPayButton,
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
      ),
    ));
  }
}
