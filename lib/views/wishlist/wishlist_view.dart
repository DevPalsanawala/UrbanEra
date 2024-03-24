// ignore_for_file: must_be_immutable

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/button_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/home_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/wishlist_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/currentuser_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/whishlist_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/wishdata_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/category/fashion_details_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/wishlist/widget/remove_wishlist_bottom_sheet.dart';
import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';
import '../../routes/app_routes.dart';

class WishlistView extends StatefulWidget {
  WishlistView({Key? key}) : super(key: key);

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  HomeController homeController = Get.put(HomeController());

  WishlistController wishlistController = Get.put(WishlistController());

  ButtonController buttonController = Get.put(ButtonController());

  DarkModeController darkModeController = Get.put(DarkModeController());

  WishlistController1 wishlistController1 = Get.put(WishlistController1());
  WishlistdataController wishlistdataController =
      Get.put(WishlistdataController());

  final _firestore = FirebaseFirestore.instance;
  Stream<List<Map<String, dynamic>>> wishlistStream(String userId) {
    return _firestore
        .collection('wishlist')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    User? user = userController.currentUser.value;
    Map<String, dynamic> userData = userController.userData.value;

    return Obx(
      () => Scaffold(
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
            child: !wishlistController.searchBoolean.value
                ? Text(
                    TextString.wishList,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.lexendMedium,
                      fontSize: FontSize.heading4,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                  )
                : _searchTextField(),
          ),
          actions: [
            Obx(() => Padding(
                  padding: const EdgeInsets.only(
                    // top: SizeConfig.padding05,
                    right: SizeConfig.padding24,
                  ),
                  child: !wishlistController.searchBoolean.value
                      ? Row(
                          children: [
                            // GestureDetector(
                            //   onTap: () {
                            //     wishlistController.searchBoolean.value = true;
                            //   },
                            //   child: Image(
                            //     image: const AssetImage(ImageConfig.search),
                            //     width: SizeConfig.width20,
                            //     height: SizeConfig.height20,
                            //     color: darkModeController.isLightTheme.value
                            //         ? ColorsConfig.primaryColor
                            //         : ColorsConfig.secondaryColor,
                            //   ),
                            // ),
                            const SizedBox(
                              width: SizeConfig.width18,
                            ),
                            Image(
                              image: const AssetImage(ImageConfig.cart),
                              width: SizeConfig.width20,
                              height: SizeConfig.height20,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ],
                        )
                      : GestureDetector(
                          onTap: () {
                            wishlistController.searchBoolean.value = false;
                          },
                          child: Icon(
                            Icons.clear_rounded,
                            size: SizeConfig.width25,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ),
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: SizeConfig.padding20,
            left: SizeConfig.padding24,
            right: SizeConfig.padding24,
          ),
          child: StreamBuilder<List<Map<String, dynamic>>>(
            stream: wishlistStream(user!.uid),
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
                            image: const AssetImage(ImageConfig.heartFill),
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
                        TextString.wishListIsEmpty,
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
                          TextString.wishListDescription,
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
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: SizedBox(
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
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> item = snapshot.data![index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => FashionDetailsView(
                                  product: item,
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
                                        'assets/admin_site_images/all final images with background removed/${item['img']}'),
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
                                      item['title'],
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
                                      item['subtitle'],
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
                                          ('\u{20B9} ${item['price']}'),
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
                                              wishlistController1
                                                      .isAddedMap[item['id']] ??
                                                  false;
                                          return GestureDetector(
                                            onTap: () {
                                              wishlistController1
                                                  .toggleWishlistItem(
                                                      user!.uid, item);
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
                  ),
                );
              }
            },
          ),
        ),
      ),
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
