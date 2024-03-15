// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/bottom_navigation_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/my_orders_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/wishlist_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/routes/app_routes.dart';
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
  BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());
  WishlistController wishlistController = Get.put(WishlistController());

  void goToTab(int tabIndex) {
    bottomNavigationController.changePage(tabIndex);
    Get.toNamed(AppRoutes.bottomView);
  }

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
                if (bottomNavigationController.selectedIndex == 4 && wishlistController.showFirstContent.value) {
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
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: SizeConfig.height48,
                    child: TextFormField(
                      onTap: () {},
                      cursorColor: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                      style: TextStyle(
                        fontFamily: FontFamily.lexendRegular,
                        fontSize: FontSize.body2,
                        fontWeight: FontWeight.w400,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                          left: SizeConfig.padding16,
                          right: SizeConfig.padding16,
                        ),
                        hintText: TextString.searchHere,
                        hintStyle: TextStyle(
                          fontFamily: FontFamily.lexendLight,
                          fontSize: FontSize.body3,
                          fontWeight: FontWeight.w300,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.modeInactiveColor,
                        ),
                        filled: true,
                        fillColor: darkModeController.isLightTheme.value
                            ? ColorsConfig.secondaryColor
                            : ColorsConfig.primaryColor,
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                            top: SizeConfig.padding15,
                            bottom: SizeConfig.padding15,
                          ),
                          child: Image(
                            image: const AssetImage(ImageConfig.search),
                            width: SizeConfig.width18,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: SizeConfig.width10,
                ),
                GestureDetector(
                  onTap: () {
                    selectOrdersFilterBottomSheet(context);
                  },
                  child: Container(
                    width: SizeConfig.width48,
                    height: SizeConfig.height48,
                    decoration: BoxDecoration(
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                      borderRadius:
                      BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    child: Center(
                      child: Image(
                        image: const AssetImage(ImageConfig.filterData),
                        width: SizeConfig.width20,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: SizeConfig.height16,
            ),
            Obx(() {
              return myOrdersController.contentChanged.value
                  ? Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: myOrdersController.ordersTitle.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: SizeConfig.padding16,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.orderDetailsView);
                        },
                        child: Container(
                          height: SizeConfig.height98,
                          width: MediaQuery.of(context).size.width,
                          padding:
                          const EdgeInsets.all(SizeConfig.padding16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.borderRadius14),
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.secondaryColor
                                : ColorsConfig.primaryColor,
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image: AssetImage(myOrdersController
                                        .ordersImage[index]),
                                    width: SizeConfig.width65,
                                    height: SizeConfig.height70,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(
                                    width: SizeConfig.width20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        myOrdersController
                                            .ordersTitle[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily:
                                          FontFamily.lexendMedium,
                                          fontSize: FontSize.body2,
                                          color: darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: SizeConfig.height04,
                                      ),
                                      Text(
                                        myOrdersController
                                            .ordersSubtitle[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontFamily:
                                          FontFamily.lexendLight,
                                          fontSize: FontSize.body3,
                                          color: darkModeController.isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: SizeConfig.height08,
                                      ),
                                      Text(
                                        TextString.deliveredOnDate,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontFamily:
                                          FontFamily.lexendLight,
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
                    );
                  },
                ),
              )
                  : Expanded(
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
                            width: SizeConfig.width32,
                            color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: SizeConfig.height20,
                    ),
                    Text(
                      TextString.myOrderIsEmpty,
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
                        left: SizeConfig.padding32,
                        right: SizeConfig.padding32,
                      ),
                      child: Text(
                        TextString.myOrderDescription,
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
                        goToTab(0);
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
            },
            ),
          ],
        ),
      ),
    ));
  }
}
