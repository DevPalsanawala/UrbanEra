// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/Login/Login.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/Login/gogle_sign_in_provider.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/colors.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/font_family.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/font_size.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/image.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/size.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/fashion_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/home_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/wishlist_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/currentuser_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/product_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/whishlist_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/routes/app_routes.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/category/fashion_details_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/home/widget/crouesl_slider.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/home/widget/filter_bottom_sheet.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/home/widget/search_with_image_bottom_sheet.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());
  DarkModeController darkModeController = Get.put(DarkModeController());
  Productcontroller productcontroller = Get.put(Productcontroller());
  FashionController fashionController = Get.put(FashionController());

  WishlistController1 wishlistController1 = Get.put(WishlistController1());

  @override
  Widget build(BuildContext context) {
    User? usergoogle = FirebaseAuth
        .instance.currentUser; //for user authentication data by google id
    // int randomNumber = Random().nextInt(178 - 7);
    final UserController userController = Get.find();
    return Obx(() {
      User? user = userController.currentUser.value;
      Map<String, dynamic> userData = userController.userData.value;
      return Scaffold(
        backgroundColor: darkModeController.isLightTheme.value
            ? ColorsConfig.backgroundColor
            : ColorsConfig.buttonColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: AppBar(
            backgroundColor: darkModeController.isLightTheme.value
                ? ColorsConfig.backgroundColor
                : ColorsConfig.buttonColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.only(
                left: SizeConfig.padding08,
                right: SizeConfig.padding08,
                top: SizeConfig.padding70,
                bottom: SizeConfig.padding08,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userData != null && userData['name'] != null
                                ? 'Hi ${userData['name']}'
                                : usergoogle!.displayName!,
                            style: TextStyle(
                              fontSize: FontSize.heading4,
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamily.lexendMedium,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                          //signout code google

                          Text(
                            TextString.offerSomethingSpecial,
                            style: TextStyle(
                              fontSize: FontSize.body3,
                              fontWeight: FontWeight.w300,
                              fontFamily: FontFamily.lexendLight,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textLightColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.notificationView);
                        },
                        child: Image(
                          image: const AssetImage(ImageConfig.notification),
                          width: SizeConfig.width20,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.height45,
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(SizeConfig.height35),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 18,
                  bottom: 20,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: SizeConfig.height48,
                        child: TextFormField(
                          onTap: () {
                            Get.toNamed(AppRoutes.searchView);
                          },
                          readOnly: true,
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
                                  ? ColorsConfig.textLightColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                            filled: true,
                            fillColor: darkModeController.isLightTheme.value
                                ? ColorsConfig.secondaryColor
                                : ColorsConfig.primaryColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadius14),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadius14),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadius14),
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
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                top: SizeConfig.padding14,
                                bottom: SizeConfig.padding14,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  searchWithImageBottomSheet(context);
                                },
                                child: Image(
                                  image: const AssetImage(ImageConfig.camera),
                                  width: SizeConfig.width18,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.textColor
                                      : ColorsConfig.modeInactiveColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: SizeConfig.width10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 15,
            right: 24,
            bottom: 12,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                Crousel(),
                Divider(
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.lineColor
                      : ColorsConfig.lineDarkColor,
                  height: SizeConfig.height32,
                  thickness: SizeConfig.lineThickness01,
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: SizeConfig.padding05),
                  child: MasonryGridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    semanticChildCount: null,
                    crossAxisCount: 2,
                    mainAxisSpacing: 23,
                    crossAxisSpacing: 23,
                    itemCount: productcontroller.produts.length - 177,
                    itemBuilder: (context, index) {
                      print(productcontroller.produts.length);
                      if (index == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Trending',
                              style: TextStyle(
                                fontSize: FontSize.heading2,
                                fontWeight: FontWeight.w300,
                                fontFamily: FontFamily.lexendLight,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                            Text(
                              "Products",
                              style: TextStyle(
                                fontSize: FontSize.heading2,
                                fontWeight: FontWeight.w600,
                                fontFamily: FontFamily.lexendSemiBold,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                          ],
                        );
                      } else {
                        final List<Map<String, dynamic>> trending =
                            productcontroller.produts
                                .where((product) =>
                                    product['sub_category'] == 'Tshirt')
                                .toList()
                                .sublist(
                                  41,
                                );
                        if (productcontroller.isLoading.value) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.secondaryColor
                                  : ColorsConfig.primaryColor,
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => FashionDetailsView(
                                    product: trending[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 159,
                              padding: const EdgeInsets.only(
                                top: 0,
                                bottom: 14,
                                left: 15,
                                right: 15,
                              ),
                              decoration: BoxDecoration(
                                // color: Colors.grey.shade500,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.secondaryColor
                                    : ColorsConfig.primaryColor,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image(
                                      image: AssetImage(
                                          'assets/admin_site_images/all final images with background removed/${trending[index]['img']}'),
                                      height: 190,
                                      width: 190,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // maxLines: 2,
                                        // softWrap: true,
                                        // overflow: TextOverflow
                                        //     .ellipsis,
                                        trending[index]['title'],
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          fontFamily: FontFamily.lexendMedium,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 02,
                                      ),
                                      Text(
                                        // maxLines: 1,
                                        // softWrap: true,
                                        // overflow: TextOverflow
                                        //     .ellipsis,
                                        trending[index]['subtitle'],
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          fontFamily: FontFamily.lexendLight,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            ('\u{20B9} ${trending[index]['price']}'),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              fontFamily:
                                                  FontFamily.lexendMedium,
                                              color: darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.primaryColor
                                                  : ColorsConfig.secondaryColor,
                                            ),
                                          ),
                                          Obx(() {
                                            final isInWishlist =
                                                wishlistController1.isAddedMap[
                                                        trending[index]
                                                            ['id']] ??
                                                    false;
                                            return GestureDetector(
                                              onTap: () {
                                                wishlistController1
                                                    .toggleWishlistItem(
                                                        user!.uid,
                                                        trending[index]);
                                              },
                                              child: Image(
                                                image: AssetImage(
                                                  !isInWishlist
                                                      ? darkModeController
                                                              .isLightTheme
                                                              .value
                                                          ? ImageConfig
                                                              .favourite
                                                          : ImageConfig
                                                              .favouriteUnfill
                                                      : darkModeController
                                                              .isLightTheme
                                                              .value
                                                          ? ImageConfig.likeFill
                                                          : ImageConfig
                                                              .favouriteFill,
                                                ),
                                                width: SizeConfig.width18,
                                              ),
                                            );
                                          }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: SizeConfig.height25,
                ),
                Divider(
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.lineColor
                      : ColorsConfig.lineDarkColor,
                  height: SizeConfig.height32,
                  thickness: SizeConfig.lineThickness01,
                ),
                const SizedBox(
                  height: SizeConfig.height20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TextString.mostPopular,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: FontSize.heading4,
                        fontFamily: FontFamily.lexendMedium,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    ),
                    Text(
                      TextString.seeMore,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: FontSize.body3,
                        fontFamily: FontFamily.lexendRegular,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.textColor
                            : ColorsConfig.modeInactiveColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: SizeConfig.height25,
                ),
                Obx(() {
                  final List<Map<String, dynamic>> mostpopular =
                      productcontroller.produts
                          .where(
                              (product) => product['sub_category'] == 'Shoes')
                          .toList()
                          .sublist(
                            16,
                          );
                  return ListView.builder(
                    shrinkWrap: true,
                    semanticChildCount: null,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: SizeConfig.padding12,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => FashionDetailsView(
                                  product: mostpopular[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 85,
                            width: double.infinity,
                            padding: const EdgeInsets.only(left: 10, right: 20),
                            decoration: BoxDecoration(
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.secondaryColor
                                  : ColorsConfig.primaryColor,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadius14),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/admin_site_images/all final images with background removed/${mostpopular[index]['img']}'),
                                      height: 80,
                                      width: 70,
                                    ),
                                    const SizedBox(
                                      width: SizeConfig.width12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 175,
                                          child: Text(
                                            mostpopular[index]['title'],
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w500,
                                              fontSize: FontSize.body1,
                                              fontFamily:
                                                  FontFamily.lexendMedium,
                                              color: darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.primaryColor
                                                  : ColorsConfig.secondaryColor,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: SizeConfig.height02,
                                        ),
                                        Text(
                                          mostpopular[index]['subtitle'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: FontSize.body2,
                                            fontFamily: FontFamily.lexendLight,
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
                                Text(
                                  ('\u{20B9} ${mostpopular[index]['price']}'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: FontSize.body1,
                                    fontFamily: FontFamily.lexendMedium,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
                const SizedBox(
                  height: SizeConfig.height25,
                ),
                Divider(
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.lineColor
                      : ColorsConfig.lineDarkColor,
                  height: SizeConfig.height32,
                  thickness: SizeConfig.lineThickness01,
                ),
                const SizedBox(
                  height: SizeConfig.height20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TextString.newArrived,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: FontSize.heading4,
                        fontFamily: FontFamily.lexendMedium,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    ),
                    Text(
                      TextString.seeMore,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: FontSize.body3,
                        fontFamily: FontFamily.lexendRegular,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.textColor
                            : ColorsConfig.modeInactiveColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: SizeConfig.height25,
                ),
                Obx(() {
                  final List<Map<String, dynamic>> newarrived =
                      productcontroller.produts
                          .where((product) => product['sub_category'] == 'none')
                          .toList()
                          .sublist(
                            6,
                          );
                  return SizedBox(
                    child: GridView.builder(
                      semanticChildCount: null,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: SizeConfig.padding24,
                        crossAxisSpacing: SizeConfig.padding24,
                        mainAxisExtent: 280,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        final imageNewIndex = index;
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => FashionDetailsView(
                                  product: newarrived[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 159,
                            padding: const EdgeInsets.only(
                              top: 0,
                              bottom: 14,
                              left: 15,
                              right: 15,
                            ),
                            decoration: BoxDecoration(
                              // color: Colors.grey.shade500,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.secondaryColor
                                  : ColorsConfig.primaryColor,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                        'assets/admin_site_images/all final images with background removed/${newarrived[index]['img']}'),
                                    height: 190,
                                    width: 190,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // maxLines: 2,
                                      // softWrap: true,
                                      // overflow: TextOverflow
                                      //     .ellipsis,
                                      newarrived[index]['title'],
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        fontFamily: FontFamily.lexendMedium,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 02,
                                    ),
                                    Text(
                                      // maxLines: 1,
                                      // softWrap: true,
                                      // overflow: TextOverflow
                                      //     .ellipsis,
                                      newarrived[index]['subtitle'],
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        fontFamily: FontFamily.lexendLight,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          ('\u{20B9} ${newarrived[index]['price']}'),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            fontFamily: FontFamily.lexendMedium,
                                            color: darkModeController
                                                    .isLightTheme.value
                                                ? ColorsConfig.primaryColor
                                                : ColorsConfig.secondaryColor,
                                          ),
                                        ),
                                        Obx(() {
                                          final isInWishlist =
                                              wishlistController1.isAddedMap[
                                                      newarrived[index]
                                                          ['id']] ??
                                                  false;
                                          return GestureDetector(
                                            onTap: () {
                                              wishlistController1
                                                  .toggleWishlistItem(user!.uid,
                                                      newarrived[index]);
                                            },
                                            child: Image(
                                              image: AssetImage(
                                                !isInWishlist
                                                    ? darkModeController
                                                            .isLightTheme.value
                                                        ? ImageConfig.favourite
                                                        : ImageConfig
                                                            .favouriteUnfill
                                                    : darkModeController
                                                            .isLightTheme.value
                                                        ? ImageConfig.likeFill
                                                        : ImageConfig
                                                            .favouriteFill,
                                              ),
                                              width: SizeConfig.width18,
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
                const SizedBox(
                  height: SizeConfig.height04,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
