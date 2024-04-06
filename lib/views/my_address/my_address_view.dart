// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/add_address_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/my_address_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/payment_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/routes/app_routes.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';
import '../../controller/dark_mode_controller.dart';

class MyAddressView extends StatelessWidget {
  MyAddressView({Key? key}) : super(key: key);

  MyAddressController myAddressController = Get.put(MyAddressController());
  DarkModeController darkModeController = Get.put(DarkModeController());
  AddAddressController addAddressController = Get.put(AddAddressController());
  PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    final sourcePage = Get.arguments as String?;
    final showButton = sourcePage != 'profile';
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
                  TextString.myAddress,
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                top: SizeConfig.padding12,
                right: SizeConfig.padding24,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.addAddressView);
                },
                child: Row(
                  children: [
                    Image(
                      image: const AssetImage(ImageConfig.add),
                      width: SizeConfig.width16,
                      height: SizeConfig.height16,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                    const SizedBox(
                      width: SizeConfig.width06,
                    ),
                    Text(
                      TextString.addAddress,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.lexendRegular,
                        fontSize: FontSize.body3,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Obx(() {
          if (addAddressController.addresses.isEmpty) {
            return Center(
              child: Text(
                "No address yet",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.lexendRegular,
                  fontSize: FontSize.body3,
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.primaryColor
                      : ColorsConfig.secondaryColor,
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(
              top: SizeConfig.padding10,
              left: SizeConfig.padding24,
              right: SizeConfig.padding24,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: addAddressController.addresses.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> address =
                    addAddressController.addresses[index];

                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: SizeConfig.padding20,
                  ),
                  child: Container(
                    height: SizeConfig.height110,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(SizeConfig.padding12),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: SizeConfig.padding02,
                              ),
                              child: Visibility(
                                visible: showButton,
                                child: GestureDetector(
                                  onTap: () {
                                    myAddressController
                                        .selectContainer(address['id']);
                                  },
                                  child: Obx(
                                    () => Image(
                                      image: AssetImage(
                                        myAddressController
                                                    .selectedContainerIndex
                                                    .value ==
                                                address['id']
                                            ? darkModeController
                                                    .isLightTheme.value
                                                ? ImageConfig.fillRound
                                                : ImageConfig.fillRoundDark
                                            : darkModeController
                                                    .isLightTheme.value
                                                ? ImageConfig.emptyRound
                                                : ImageConfig.emptyRoundDark,
                                      ),
                                      width: SizeConfig.width16,
                                    ),
                                  ),
                                ),
                              ),
                              // child: GestureDetector(
                              //   onTap: () {
                              //     myAddressController.selectContainer(index);
                              //   },
                              //   child: Obx(
                              //     () => Image(
                              //       image: AssetImage(
                              //         myAddressController
                              //             .getContainerImage(index),
                              //       ),
                              //       width: SizeConfig.width14,
                              //       height: SizeConfig.height14,
                              //       color:
                              //           darkModeController.isLightTheme.value
                              //               ? ColorsConfig.textColor
                              //               : ColorsConfig.secondaryColor,
                              //     ),
                              //   ),
                              // ),
                            ),
                            const SizedBox(
                              width: SizeConfig.width10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  address['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontFamily.lexendMedium,
                                    fontSize: FontSize.body2,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: SizeConfig.height08,
                                ),
                                Flexible(
                                  child: SizedBox(
                                    width: SizeConfig.width200,
                                    child: Text(
                                      '${address['house']}, ${address['area']}, ${address['city']}, ${address['state']},${address['pinCode']}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: FontFamily.lexendLight,
                                        fontSize: FontSize.body3,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                      maxLines: null,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: SizeConfig.height08,
                                ),
                                Text(
                                  address['mobileNumber'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: FontFamily.lexendLight,
                                    fontSize: FontSize.body3,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.modeInactiveColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            addAddressController.clearAddresses(address['id']);
                          },
                          child: Text(
                            "Delete",
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
                );
              },
            ),
          );
        }),
        bottomNavigationBar: Obx(
          () => Visibility(
            visible: myAddressController.selectedContainerIndex.value != -1,
            child: Padding(
              padding: const EdgeInsets.only(
                left: SizeConfig.padding24,
                right: SizeConfig.padding24,
                bottom: SizeConfig.padding24,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.paymentView);
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
                      TextString.textButtonContinue,
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
        )));
  }
}
