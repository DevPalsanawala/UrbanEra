// ignore_for_file: must_be_immutable

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/bag_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/button_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/fashion_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/home_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/wishlist_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/bag_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/currentuser_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/routes/app_routes.dart';
import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';

class BagView extends StatelessWidget {
  BagView({Key? key}) : super(key: key);

  WishlistController wishlistController = Get.put(WishlistController());
  BagController bagController = Get.put(BagController());
  HomeController homeController = Get.put(HomeController());
  DarkModeController darkModeController = Get.put(DarkModeController());
  ButtonController buttonController = Get.put(ButtonController());
  Bagcontroller bagcontroller = Get.put(Bagcontroller());
  FashionController fashionController = Get.put(FashionController());

  double getTotalPrice(List<Map<String, dynamic>> items) {
    double totalPrice = 0.0;
    for (var item in items) {
      totalPrice += double.parse(item['price']) * item['qty'];
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var qty = 0;
        final selectedSize = fashionController.selectedSize.value;

        final UserController userController = Get.find();
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
              child: !bagController.searchBoolean.value
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
                          TextString.bag,
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
                    )
                  : _searchTextField(),
            ),
            // actions: [
            //   Obx(() => Padding(
            //         padding: const EdgeInsets.only(
            //           right: SizeConfig.padding24,
            //         ),
            //         child: !bagController.searchBoolean.value
            //             ? GestureDetector(
            //                 onTap: () {
            //                   bagController.searchBoolean.value = true;
            //                 },
            //                 child: Image(
            //                   image: const AssetImage(ImageConfig.search),
            //                   width: SizeConfig.width20,
            //                   height: SizeConfig.height20,
            //                   color: darkModeController.isLightTheme.value
            //                       ? ColorsConfig.primaryColor
            //                       : ColorsConfig.secondaryColor,
            //                 ),
            //               )
            //             : GestureDetector(
            //                 onTap: () {
            //                   bagController.searchBoolean.value = false;
            //                 },
            //                 child: Icon(
            //                   Icons.clear_rounded,
            //                   size: SizeConfig.width25,
            //                   color: darkModeController.isLightTheme.value
            //                       ? ColorsConfig.primaryColor
            //                       : ColorsConfig.secondaryColor,
            //                 ),
            //               ),
            //       )),
            // ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: SizeConfig.padding20,
              left: SizeConfig.padding24,
              right: SizeConfig.padding24,
            ),
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: bagcontroller.bagStream(user!.uid),
              builder: (context, snapshot) {
                //   if (controller.isLoading.value) {
                //   return Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Container(
                          width: SizeConfig.width70,
                          height: SizeConfig.height70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.secondaryColor
                                : ColorsConfig.primaryColor,
                          ),
                          child: Center(
                            child: Image(
                              image: const AssetImage(ImageConfig.cartFill),
                              width: SizeConfig.width30,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                        )),
                        const SizedBox(
                          height: SizeConfig.height20,
                        ),
                        Text(
                          TextString.bagIsEmpty,
                          style: TextStyle(
                            fontFamily: FontFamily.lexendRegular,
                            fontSize: FontSize.heading5,
                            fontWeight: FontWeight.w400,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: SizeConfig.height08,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: SizeConfig.padding20,
                            right: SizeConfig.padding20,
                          ),
                          child: Text(
                            TextString.bagIsEmptyDescription,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: FontFamily.lexendLight,
                              fontSize: FontSize.body3,
                              fontWeight: FontWeight.w300,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: SizeConfig.height32,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offAllNamed(AppRoutes.bottomView);
                          },
                          child: Container(
                            height: SizeConfig.height52,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadius14),
                              border: Border.all(
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                TextString.textButtonContinueShopping,
                                style: TextStyle(
                                  fontSize: FontSize.body1,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.lexendRegular,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  final price = getTotalPrice(snapshot.data!);
                  final discount = getTotalPrice(snapshot.data!) * 5 / 100;
                  bagcontroller.payamount.value =
                      (getTotalPrice(snapshot.data!) - discount) as double;
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> item = snapshot.data![index];

                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: SizeConfig.padding20,
                              ),
                              child: Container(
                                height: 155,
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    const EdgeInsets.all(SizeConfig.padding12),
                                decoration: BoxDecoration(
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.secondaryColor
                                      : ColorsConfig.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadius14,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  Image(
                                                    image: AssetImage(
                                                      'assets/admin_site_images/all final images with background removed/${item['img']}',
                                                    ),
                                                    width: SizeConfig.width65,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left:
                                                          SizeConfig.padding10,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 150,
                                                          child: Text(
                                                            item['title'],
                                                            // maxLines: 2,
                                                            style: TextStyle(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily: FontFamily
                                                                  .lexendMedium,
                                                              fontSize: FontSize
                                                                  .body2,
                                                              color: darkModeController
                                                                      .isLightTheme
                                                                      .value
                                                                  ? ColorsConfig
                                                                      .primaryColor
                                                                  : ColorsConfig
                                                                      .secondaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: SizeConfig
                                                              .height06,
                                                        ),
                                                        Text(
                                                          item['subtitle'],
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontFamily:
                                                                FontFamily
                                                                    .lexendLight,
                                                            fontSize:
                                                                FontSize.body3,
                                                            color: darkModeController
                                                                    .isLightTheme
                                                                    .value
                                                                ? ColorsConfig
                                                                    .textColor
                                                                : ColorsConfig
                                                                    .modeInactiveColor,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: SizeConfig
                                                              .height12,
                                                        ),
                                                        Text(
                                                          ('\u{20B9} ${item['price']}'),
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily: FontFamily
                                                                .lexendRegular,
                                                            fontSize:
                                                                FontSize.body2,
                                                            color: darkModeController
                                                                    .isLightTheme
                                                                    .value
                                                                ? ColorsConfig
                                                                    .primaryColor
                                                                : ColorsConfig
                                                                    .secondaryColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (item["sub_category"] == "Tshirt" ||
                                                      item["sub_category"] ==
                                                          "Shirt" ||
                                                      item["sub_category"] ==
                                                          "Pants" ||
                                                      item["sub_category"] ==
                                                          "Shoes" ||
                                                      item["sub_category"] ==
                                                          "Shorts" ||
                                                      item["sub_category"] ==
                                                          "Dress")
                                                    Text(
                                                      'Size: ${item['size']}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: FontFamily
                                                            .lexendRegular,
                                                        fontSize:
                                                            FontSize.body2,
                                                        color: darkModeController
                                                                .isLightTheme
                                                                .value
                                                            ? ColorsConfig
                                                                .primaryColor
                                                            : ColorsConfig
                                                                .secondaryColor,
                                                      ),
                                                    ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Quntity: ${item['qty'].toString().substring(0, 1)}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: FontFamily
                                                          .lexendRegular,
                                                      fontSize: FontSize.body2,
                                                      color: darkModeController
                                                              .isLightTheme
                                                              .value
                                                          ? ColorsConfig
                                                              .primaryColor
                                                          : ColorsConfig
                                                              .secondaryColor,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              // Obx(
                                              //   () => Row(
                                              //     children: [
                                              //       GestureDetector(
                                              //         onTap: () {
                                              //           bagController
                                              //               .decrementCounter(
                                              //                   index);
                                              //         },
                                              //         child: Image(
                                              //           image: AssetImage(
                                              //             darkModeController
                                              //                     .isLightTheme
                                              //                     .value
                                              //                 ? ImageConfig
                                              //                     .minus
                                              //                 : ImageConfig
                                              //                     .minusDark,
                                              //           ),
                                              //           width:
                                              //               SizeConfig.width22,
                                              //         ),
                                              //       ),
                                              //       const SizedBox(
                                              //         width: SizeConfig.width08,
                                              //       ),
                                              //       SizedBox(
                                              //         width: SizeConfig.width15,
                                              //         child: Text(
                                              //           bagController
                                              //               .itemQuantities[
                                              //                   index]
                                              //               .toString(),
                                              //           textAlign:
                                              //               TextAlign.center,
                                              //           style: TextStyle(
                                              //             fontWeight:
                                              //                 FontWeight.w500,
                                              //             fontFamily: FontFamily
                                              //                 .lexendMedium,
                                              //             fontSize:
                                              //                 FontSize.body3,
                                              //             color: darkModeController
                                              //                     .isLightTheme
                                              //                     .value
                                              //                 ? ColorsConfig
                                              //                     .primaryColor
                                              //                 : ColorsConfig
                                              //                     .secondaryColor,
                                              //           ),
                                              //         ),
                                              //       ),
                                              //       const SizedBox(
                                              //         width: SizeConfig.width08,
                                              //       ),
                                              //       GestureDetector(
                                              //         onTap: () {
                                              //           bagController
                                              //               .incrementCounter(
                                              //                   index);
                                              //         },
                                              //         child: Image(
                                              //           image: AssetImage(
                                              //             darkModeController
                                              //                     .isLightTheme
                                              //                     .value
                                              //                 ? ImageConfig.plus
                                              //                 : ImageConfig
                                              //                     .plusDark,
                                              //           ),
                                              //           width:
                                              //               SizeConfig.width22,
                                              //         ),
                                              //       ),
                                              //     ],
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: SizeConfig.height12,
                                          ),
                                          Divider(
                                            color: darkModeController
                                                    .isLightTheme.value
                                                ? ColorsConfig.lineColor
                                                : ColorsConfig.lineDarkColor,
                                            height: 0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.height25,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              bagcontroller.toggleaddToBag(
                                                  user!.uid,
                                                  item,
                                                  qty,
                                                  selectedSize);
                                            },
                                            child: Text(
                                              TextString.remove,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontFamily:
                                                    FontFamily.lexendLight,
                                                fontSize: FontSize.body3,
                                                color: darkModeController
                                                        .isLightTheme.value
                                                    ? ColorsConfig.primaryColor
                                                    : ColorsConfig
                                                        .secondaryColor,
                                              ),
                                            ),
                                          ),
                                          VerticalDivider(
                                            color: darkModeController
                                                    .isLightTheme.value
                                                ? ColorsConfig.lineColor
                                                : ColorsConfig.lineDarkColor,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Fluttertoast.showToast(
                                                msg: TextString.saved,
                                                gravity: ToastGravity.BOTTOM,
                                                toastLength: Toast.LENGTH_SHORT,
                                                backgroundColor:
                                                    darkModeController
                                                            .isLightTheme.value
                                                        ? ColorsConfig
                                                            .buttonColor
                                                        : ColorsConfig
                                                            .secondaryColor,
                                                textColor: darkModeController
                                                        .isLightTheme.value
                                                    ? ColorsConfig
                                                        .secondaryColor
                                                    : ColorsConfig.buttonColor,
                                              );
                                            },
                                            child: Text(
                                              TextString.saveForLater,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontFamily:
                                                    FontFamily.lexendLight,
                                                fontSize: FontSize.body3,
                                                color: darkModeController
                                                        .isLightTheme.value
                                                    ? ColorsConfig.primaryColor
                                                    : ColorsConfig
                                                        .secondaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                          height: SizeConfig.height198,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                            left: SizeConfig.padding24,
                            top: SizeConfig.padding12,
                            bottom: SizeConfig.padding12,
                            right: SizeConfig.padding24,
                          ),
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.secondaryColor
                              : ColorsConfig.primaryColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    TextString.total,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: FontFamily.lexendMedium,
                                      fontSize: FontSize.body1,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: SizeConfig.height24,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Price (${snapshot.data!.length.toString()} items)",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontFamily: FontFamily.lexendLight,
                                          fontSize: FontSize.body2,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                      Text(
                                        '\u{20B9} ${price}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontSize: FontSize.body2,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: SizeConfig.height12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${TextString.discount} (5%)",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontFamily: FontFamily.lexendLight,
                                          fontSize: FontSize.body2,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                      Text(
                                        '\u{20B9} ${discount}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontSize: FontSize.body2,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: SizeConfig.height12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        TextString.deliveryCharges,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontFamily: FontFamily.lexendLight,
                                          fontSize: FontSize.body2,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                      Text(
                                        TextString.freeDelivery,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontSize: FontSize.body2,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.lineColor
                                    : ColorsConfig.lineDarkColor,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    TextString.totalAmount,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: FontFamily.lexendRegular,
                                      fontSize: FontSize.body1,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                  Text(
                                    '\u{20B9} ${bagcontroller.payamount.value}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: FontFamily.lexendMedium,
                                      fontSize: FontSize.body2,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: SizeConfig.height94,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.backgroundColor
                                : ColorsConfig.primaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: .1,
                                blurRadius: SizeConfig.height15,
                                offset: const Offset(0, -4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: SizeConfig.padding24,
                              right: SizeConfig.padding24,
                              top: SizeConfig.padding18,
                              bottom: SizeConfig.padding24,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: SizeConfig.height52,
                                  width: SizeConfig.width116,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      SizeConfig.borderRadius14,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '\u{20B9} ${price}',
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: FontFamily.lexendLight,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      Text(
                                        '\u{20B9} ${bagcontroller.payamount.value}',
                                        style: TextStyle(
                                          fontSize: FontSize.heading5,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: FontFamily.lexendMedium,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: SizeConfig.width14,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.myAddressView);
                                    },
                                    child: Container(
                                      height: SizeConfig.height52,
                                      width: SizeConfig.width212,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            SizeConfig.borderRadius14),
                                        color: darkModeController
                                                .isLightTheme.value
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
                                            color: darkModeController
                                                    .isLightTheme.value
                                                ? ColorsConfig.secondaryColor
                                                : ColorsConfig.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
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
