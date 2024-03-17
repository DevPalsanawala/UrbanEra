// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/payment_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/payment/payment_successful_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/payment/phonepepayment.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';
import '../../routes/app_routes.dart';

class PaymentView extends StatelessWidget {
  PaymentView({Key? key}) : super(key: key);

  PaymentController paymentController = Get.put(PaymentController());
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
                    TextString.payment,
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
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: SizeConfig.padding24,
                  top: SizeConfig.padding20,
                  bottom: SizeConfig.padding15,
                ),
                child: Text(
                  TextString.dollar200,
                  style: TextStyle(
                    fontFamily: FontFamily.lexendMedium,
                    fontSize: FontSize.body1,
                    fontWeight: FontWeight.w500,
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: SizeConfig.padding24,
              right: SizeConfig.padding24,
              top: SizeConfig.padding15,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhonePepayment()),
                    );
                  },
                  child: Container(
                    height: SizeConfig.height46,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                      left: SizeConfig.padding12,
                      right: SizeConfig.padding12,
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
                          TextString.creditDebitCard,
                          style: TextStyle(
                            fontFamily: FontFamily.lexendRegular,
                            fontSize: FontSize.body2,
                            fontWeight: FontWeight.w400,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ),
                        Image(
                          image: const AssetImage(ImageConfig.add),
                          width: SizeConfig.width16,
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
                  height: SizeConfig.height118,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(SizeConfig.padding12),
                  decoration: BoxDecoration(
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadius14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   TextString.upi,
                      //   style: TextStyle(
                      //     fontFamily: FontFamily.lexendRegular,
                      //     fontSize: FontSize.body2,
                      //     fontWeight: FontWeight.w400,
                      //     color: darkModeController.isLightTheme.value
                      //         ? ColorsConfig.primaryColor
                      //         : ColorsConfig.secondaryColor,
                      //   ),
                      // ),
                      // Divider(
                      //   color: darkModeController.isLightTheme.value
                      //       ? ColorsConfig.lineColor
                      //       : ColorsConfig.lineDarkColor,
                      //   height: SizeConfig.height24,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: SizeConfig.padding10,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: SizeConfig.height48,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Image(
                                    image: AssetImage(ImageConfig.googlePay),
                                    width: SizeConfig.width29,
                                    height: SizeConfig.height26,
                                  ),
                                  Text(
                                    TextString.gPay,
                                    style: TextStyle(
                                      fontFamily: FontFamily.lexendLight,
                                      fontSize: FontSize.body3,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: SizeConfig.width32,
                            ),
                            SizedBox(
                              height: SizeConfig.height48,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: SizeConfig.padding05,
                                    ),
                                    child: Image(
                                      image: AssetImage(ImageConfig.paytm),
                                      width: SizeConfig.width42,
                                      height: SizeConfig.height13,
                                    ),
                                  ),
                                  Text(
                                    TextString.paytm,
                                    style: TextStyle(
                                      fontFamily: FontFamily.lexendLight,
                                      fontSize: FontSize.body3,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: SizeConfig.width32,
                            ),
                            SizedBox(
                              height: SizeConfig.height48,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Image(
                                    image: AssetImage(ImageConfig.phonePe),
                                    width: SizeConfig.width22,
                                    height: SizeConfig.height22,
                                  ),
                                  Text(
                                    TextString.phonePe,
                                    style: TextStyle(
                                      fontFamily: FontFamily.lexendLight,
                                      fontSize: FontSize.body3,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
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
                Container(
                  height: SizeConfig.height118,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(SizeConfig.padding12),
                  decoration: BoxDecoration(
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadius14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            TextString.netBanking,
                            style: TextStyle(
                              fontFamily: FontFamily.lexendRegular,
                              fontSize: FontSize.body2,
                              fontWeight: FontWeight.w400,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                          Image(
                            image: const AssetImage(ImageConfig.add),
                            width: SizeConfig.width16,
                            height: SizeConfig.height16,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ],
                      ),
                      Divider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                        height: SizeConfig.height24,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: SizeConfig.padding10,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: SizeConfig.height48,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Image(
                                    image: AssetImage(ImageConfig.hdfc),
                                    width: SizeConfig.width28,
                                    height: SizeConfig.height28,
                                  ),
                                  Text(
                                    TextString.hdfc,
                                    style: TextStyle(
                                      fontFamily: FontFamily.lexendLight,
                                      fontSize: FontSize.body3,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: SizeConfig.width32,
                            ),
                            SizedBox(
                              height: SizeConfig.height48,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Image(
                                    image: AssetImage(ImageConfig.icic),
                                    width: SizeConfig.width20,
                                    height: SizeConfig.height22,
                                  ),
                                  Text(
                                    TextString.icic,
                                    style: TextStyle(
                                      fontFamily: FontFamily.lexendLight,
                                      fontSize: FontSize.body3,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: SizeConfig.width32,
                            ),
                            SizedBox(
                              height: SizeConfig.height48,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Image(
                                    image: AssetImage(ImageConfig.axis),
                                    width: SizeConfig.width26,
                                    height: SizeConfig.height22,
                                  ),
                                  Text(
                                    TextString.axis,
                                    style: TextStyle(
                                      fontFamily: FontFamily.lexendLight,
                                      fontSize: FontSize.body3,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
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
                Container(
                  height: SizeConfig.height118,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(SizeConfig.padding12),
                  decoration: BoxDecoration(
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadius14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TextString.wallet,
                        style: TextStyle(
                          fontFamily: FontFamily.lexendRegular,
                          fontSize: FontSize.body2,
                          fontWeight: FontWeight.w400,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ),
                      Divider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                        height: SizeConfig.height24,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: SizeConfig.padding10,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: SizeConfig.height48,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: SizeConfig.padding05,
                                    ),
                                    child: Image(
                                      image: AssetImage(ImageConfig.paytm),
                                      width: SizeConfig.width42,
                                      height: SizeConfig.height13,
                                    ),
                                  ),
                                  Text(
                                    TextString.paytm,
                                    style: TextStyle(
                                      fontFamily: FontFamily.lexendLight,
                                      fontSize: FontSize.body3,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: SizeConfig.width32,
                            ),
                            SizedBox(
                              height: SizeConfig.height48,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Image(
                                    image: AssetImage(ImageConfig.mobikwik),
                                    width: SizeConfig.width26,
                                    height: SizeConfig.height22,
                                  ),
                                  Text(
                                    TextString.mobikwik,
                                    style: TextStyle(
                                      fontFamily: FontFamily.lexendLight,
                                      fontSize: FontSize.body3,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
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
                Container(
                  height: SizeConfig.height46,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                    left: SizeConfig.padding12,
                    right: SizeConfig.padding12,
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
                        TextString.cashOnDelivery,
                        style: TextStyle(
                          fontFamily: FontFamily.lexendRegular,
                          fontSize: FontSize.body2,
                          fontWeight: FontWeight.w400,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          paymentController.toggleImage();
                        },
                        child: Obx(
                          () => Image(
                            image: AssetImage(
                              paymentController.isImageToggled.value
                                  ? darkModeController.isLightTheme.value
                                      ? ImageConfig.fillRound
                                      : ImageConfig.fillRoundDark
                                  : darkModeController.isLightTheme.value
                                      ? ImageConfig.emptyRound
                                      : ImageConfig.emptyRoundDark,
                            ),
                            width: SizeConfig.width16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Obx(
            () => Visibility(
              visible: paymentController.isImageToggled.value,
              child: SizedBox(
                height: SizeConfig.height94,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: SizeConfig.padding24,
                    right: SizeConfig.padding24,
                    top: SizeConfig.padding18,
                    bottom: SizeConfig.padding24,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return PaymentSuccessfulView();
                        },
                      );
                    },
                    child: Container(
                      height: SizeConfig.height52,
                      width: SizeConfig.width212,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.borderRadius14,
                        ),
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                      child: Center(
                        child: Text(
                          TextString.textButtonPlaceOrder,
                          style: TextStyle(
                            fontSize: FontSize.body1,
                            fontWeight: FontWeight.w500,
                            fontFamily: FontFamily.lexendMedium,
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
            ),
          ),
        ));
  }
}
