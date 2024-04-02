// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/bottom_navigation_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/my_orders_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/wishlist_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/bag_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/currentuser_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/routes/app_routes.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/profile_tabs/my_order/order_details_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/widget/orders_filter_bottom_sheet.dart';

import '../../../../config/colors.dart';
import '../../../../config/font_family.dart';
import '../../../../config/font_size.dart';
import '../../../../config/image.dart';
import '../../../../config/size.dart';
import '../../../../config/text_string.dart';
import '../../../../controller/dark_mode_controller.dart';

class MyOrdersView extends StatelessWidget {
  MyOrdersView({Key? key}) : super(key: key);

  MyOrdersController myOrdersController = Get.put(MyOrdersController());
  DarkModeController darkModeController = Get.put(DarkModeController());
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  WishlistController wishlistController = Get.put(WishlistController());
  Bagcontroller bagcontroller = Get.put(Bagcontroller());

  void goToTab(int tabIndex) {
    bottomNavigationController.changePage(tabIndex);
    Get.toNamed(AppRoutes.bottomView);
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    User? user = userController.currentUser.value;
    Map<String, dynamic> userData = userController.userData.value;
    DateTime now = DateTime.now();
    DateTime futureDate = now.add(Duration(days: 4));
    String formattedDate = DateFormat('d MMM yyyy').format(now);
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
                    TextString.myOrders,
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
                  right: SizeConfig.padding24,
                  top: SizeConfig.padding24,
                  bottom: SizeConfig.padding10,
                ),
                child: GestureDetector(
                  onTap: () {
                    if (bottomNavigationController.selectedIndex == 4 &&
                        wishlistController.showFirstContent.value) {
                      bottomNavigationController.showBottomBar = false;
                    }
                    wishlistController.toggleContent();
                    goToTab(4);
                  },
                  child: Image(
                    image: const AssetImage(ImageConfig.cart),
                    width: SizeConfig.width20,
                    height: SizeConfig.height20,
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
              top: SizeConfig.padding24,
              left: SizeConfig.padding24,
              right: SizeConfig.padding24,
            ),
            child: StreamBuilder<List<Map<String, dynamic>>>(
                stream: bagcontroller.orderStream(user!.uid),
                builder: (context, snapshot) {
                  if (bagcontroller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    );
                  }

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
                                image: const AssetImage(ImageConfig.bag),
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
                            "You have nothing ordered",
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
                              "Oops! It seems like you have nothing ordered. Time to place it with your favorite goodies!",
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
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> item = snapshot.data![index];
                        String dateString = item['date'];
                        DateFormat format = DateFormat('d MMM yyyy');
                        DateTime date = format.parse(dateString);
                        DateTime Fdate = date.add(Duration(days: 4));
                        String formattedDate = format.format(Fdate);

                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: SizeConfig.padding16,
                          ),
                          child: GestureDetector(
                            // onTap: () {
                            //   // Get.toNamed(AppRoutes.orderDetailsView);
                            //   Navigator.of(context).push(MaterialPageRoute(
                            //       builder: (context) => OrderDetailsView()));
                            // },
                            child: Container(
                              height: SizeConfig.height110,
                              width: MediaQuery.of(context).size.width,
                              padding:
                                  const EdgeInsets.all(SizeConfig.padding20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadius14),
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.secondaryColor
                                    : ColorsConfig.primaryColor,
                              ),
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            'assets/admin_site_images/all final images with background removed/${item['img']}'),
                                        // width: SizeConfig.width65,
                                        height: 100,
                                        fit: BoxFit.fill,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 180,
                                            child: Text(
                                              item['title'],
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w500,
                                                fontFamily:
                                                    FontFamily.lexendMedium,
                                                fontSize: FontSize.body2,
                                                color: darkModeController
                                                        .isLightTheme.value
                                                    ? ColorsConfig.primaryColor
                                                    : ColorsConfig
                                                        .secondaryColor,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: SizeConfig.height04,
                                          ),
                                          Text(
                                            item['subtitle'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontFamily:
                                                  FontFamily.lexendLight,
                                              fontSize: FontSize.body3,
                                              color: darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.textColor
                                                  : ColorsConfig
                                                      .modeInactiveColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: SizeConfig.height08,
                                          ),
                                          Text(
                                            'Delivered on ${formattedDate}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontFamily:
                                                  FontFamily.lexendLight,
                                              fontSize: FontSize.body3,
                                              color: darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.textColor
                                                  : ColorsConfig
                                                      .modeInactiveColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (item['sub_category'] != "none")
                                        Text(
                                          'Szie: ${item['size'].toString()}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontFamily: FontFamily.lexendLight,
                                            fontSize: FontSize.body3,
                                            color: darkModeController
                                                    .isLightTheme.value
                                                ? ColorsConfig.textColor
                                                : ColorsConfig
                                                    .modeInactiveColor,
                                          ),
                                        ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Quntity: ${item['qty'].toString()}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontFamily: FontFamily.lexendLight,
                                          fontSize: FontSize.body3,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                      ),
                                    ],
                                  )
                                  // Image(
                                  //   image:
                                  //       const AssetImage(ImageConfig.nextArrow),
                                  //   width: SizeConfig.width18,
                                  //   height: SizeConfig.height18,
                                  //   color: darkModeController.isLightTheme.value
                                  //       ? ColorsConfig.primaryColor
                                  //       : ColorsConfig.secondaryColor,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
          ),
        ));
  }
}
