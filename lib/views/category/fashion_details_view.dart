// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/bottom_navigation_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/button_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/fashion_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/home_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/wishlist_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/bag_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/currentuser_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/product_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/whishlist_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/model/product_model.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/routes/app_routes.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';

class FashionDetailsView extends StatelessWidget {
  FashionDetailsView({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Map<String, dynamic> product;

  FashionController fashionController = Get.put(FashionController());
  HomeController homeController = Get.put(HomeController());
  ButtonController buttonController = Get.put(ButtonController());
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  WishlistController wishlistController = Get.put(WishlistController());
  DarkModeController darkModeController = Get.put(DarkModeController());
  Productcontroller productcontroller = Get.put(Productcontroller());
  WishlistController1 wishlistController1 = Get.put(WishlistController1());
  Bagcontroller bagcontroller = Get.put(Bagcontroller());

  void goToTab(int tabIndex) {
    bottomNavigationController.changePage(tabIndex);
    Get.toNamed(AppRoutes.bottomView);
  }

  @override
  Widget build(BuildContext context) {
    var qty = 1;
    var selectedSize = "";
    final UserController userController = Get.find();
    User? user = userController.currentUser.value;
    Map<String, dynamic> userData = userController.userData.value;
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
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: SizeConfig.padding24,
                  top: SizeConfig.padding15,
                  bottom: SizeConfig.padding15,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        goToTab(3);
                      },
                      child: Image(
                        image: const AssetImage(ImageConfig.favourite),
                        width: SizeConfig.width20,
                        height: SizeConfig.height20,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: SizeConfig.width18,
                    ),
                    Obx(
                      () => Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
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
                          if (buttonController.isCartVisible.value)
                            const Positioned(
                              right: 0,
                              top: 0,
                              child: SizedBox(
                                width: SizeConfig.width06,
                                height: SizeConfig.height06,
                                child: Image(
                                  image: AssetImage(
                                    ImageConfig.dotToCart,
                                  ),
                                ),
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
          body: Obx(
            () => Padding(
              padding: const EdgeInsets.only(
                top: SizeConfig.padding10,
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 400,
                      child: PageView.builder(
                        controller: fashionController.pageFashionController,
                        onPageChanged: (value) {
                          fashionController.currentPage.value = value;
                        },
                        itemCount: SizeConfig.fashionList5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: SizeConfig.padding24,
                              right: SizeConfig.padding24,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: SizeConfig.height303,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadius14),
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.secondaryColor
                                    : ColorsConfig.primaryColor,
                                // color: Colors.amber,
                              ),
                              child: Hero(
                                tag: product['id'],
                                child: Image(
                                  image: AssetImage(
                                    'assets/admin_site_images/all final images with background removed/${product['img']}',
                                  ),
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: SizeConfig.height16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        SizeConfig.fashionList5,
                        (int index) => buildDot(index: index),
                      ),
                    ),
                    const SizedBox(
                      height: SizeConfig.height24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding24,
                        right: SizeConfig.padding24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 270,
                                child: Text(
                                  product['title'],
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: FontSize.heading4,
                                    fontFamily: FontFamily.lexendMedium,
                                    fontWeight: FontWeight.w500,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Share.share(TextString.appName);
                                    },
                                    child: Image(
                                      image:
                                          const AssetImage(ImageConfig.share),
                                      width: SizeConfig.width20,
                                      height: SizeConfig.height20,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: SizeConfig.width12,
                                  ),
                                  Obx(() {
                                    final isInWishlist = wishlistController1
                                            .isAddedMap[product['id']] ??
                                        false;
                                    return GestureDetector(
                                      onTap: () {
                                        wishlistController1.toggleWishlistItem(
                                            user!.uid, product);
                                      },
                                      child: Image(
                                        image: AssetImage(
                                          !isInWishlist
                                              ? darkModeController
                                                      .isLightTheme.value
                                                  ? ImageConfig.favourite
                                                  : ImageConfig.favouriteUnfill
                                              : darkModeController
                                                      .isLightTheme.value
                                                  ? ImageConfig.likeFill
                                                  : ImageConfig.favouriteFill,
                                        ),
                                        width: SizeConfig.width18,
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: SizeConfig.height06,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product['subtitle'],
                                textAlign: TextAlign.center,
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
                                width: SizeConfig.width10,
                              ),

                              // Text(
                              //   TextString.off50,
                              //   textAlign: TextAlign.center,
                              //   style: TextStyle(
                              //     fontSize: FontSize.body2,
                              //     fontFamily: FontFamily.lexendRegular,
                              //     fontWeight: FontWeight.w400,
                              //     color: darkModeController.isLightTheme.value
                              //         ? ColorsConfig.primaryColor
                              //         : ColorsConfig.secondaryColor,
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(
                            height: SizeConfig.height12,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Text(
                                  ('\u{20B9} ${product['price'].toString()}'),
                                  style: TextStyle(
                                    fontSize: FontSize.heading4,
                                    fontFamily: FontFamily.lexendMedium,
                                    fontWeight: FontWeight.w500,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: SizeConfig.width08,
                                ),
                                Text(
                                  ('\u{20B9} ${product['mrp'].toString()}'),
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendLight,
                                    fontWeight: FontWeight.w300,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                VerticalDivider(
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.lineColor
                                      : ColorsConfig.lineDarkColor,
                                  endIndent: SizeConfig.indent7Point,
                                  indent: SizeConfig.indent7Point,
                                  width: SizeConfig.width30,
                                  thickness: 1,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      TextString.rating4point5,
                                      style: TextStyle(
                                        fontSize: FontSize.body3,
                                        fontFamily: FontFamily.lexendRegular,
                                        fontWeight: FontWeight.w400,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: SizeConfig.width03,
                                    ),
                                    Image(
                                      image: const AssetImage(ImageConfig.star),
                                      width: SizeConfig.width12,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                    const SizedBox(
                                      width: SizeConfig.width06,
                                    ),
                                    Text(
                                      TextString.review1227,
                                      style: TextStyle(
                                        fontSize: FontSize.body3,
                                        fontFamily: FontFamily.lexendLight,
                                        fontWeight: FontWeight.w300,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // const SizedBox(
                          //   height: SizeConfig.height24,
                          // ),
                          // Text(
                          //   TextString.selectColor,
                          //   style: TextStyle(
                          //     fontSize: FontSize.body2,
                          //     fontFamily: FontFamily.lexendMedium,
                          //     fontWeight: FontWeight.w500,
                          //     color: darkModeController.isLightTheme.value
                          //         ? ColorsConfig.primaryColor
                          //         : ColorsConfig.secondaryColor,
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: SizeConfig.height10,
                          // ),
                          // GridView.builder(
                          //   padding: EdgeInsets.zero,
                          //   gridDelegate:
                          //       const SliverGridDelegateWithFixedCrossAxisCount(
                          //     crossAxisCount: 7,
                          //     mainAxisExtent: SizeConfig.height35,
                          //   ),
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   shrinkWrap: true,
                          //   itemCount: fashionController.colorsList.length,
                          //   itemBuilder: (context, index) {
                          //     return GestureDetector(
                          //       onTap: () {
                          //         fashionController.selectColor(index);
                          //       },
                          //       child: Obx(
                          //         () {
                          //           final isSelected = fashionController
                          //                   .selectedColorIndex.value ==
                          //               index;
                          //           return Container(
                          //             width: SizeConfig.width45,
                          //             height: SizeConfig.height45,
                          //             decoration: BoxDecoration(
                          //               shape: BoxShape.circle,
                          //               color: isSelected
                          //                   ? darkModeController
                          //                           .isLightTheme.value
                          //                       ? ColorsConfig.secondaryColor
                          //                       : ColorsConfig.primaryColor
                          //                   : darkModeController
                          //                           .isLightTheme.value
                          //                       ? ColorsConfig.secondaryColor
                          //                       : Colors.transparent,
                          //               border: Border.all(
                          //                 color: isSelected
                          //                     ? darkModeController
                          //                             .isLightTheme.value
                          //                         ? ColorsConfig.textLightColor
                          //                         : ColorsConfig.secondaryColor
                          //                     : darkModeController
                          //                             .isLightTheme.value
                          //                         ? Colors.transparent
                          //                         : Colors.transparent,
                          //               ),
                          //             ),
                          //             child: Center(
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(
                          //                   SizeConfig.padding04,
                          //                 ),
                          //                 child: Container(
                          //                   width: SizeConfig.width35,
                          //                   decoration: BoxDecoration(
                          //                     color: fashionController
                          //                         .colorsList[index],
                          //                     shape: BoxShape.circle,
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //           );
                          //         },
                          //       ),
                          //     );
                          //   },
                          // ),
                          const SizedBox(
                            height: SizeConfig.height24,
                          ),
                          Row(
                            children: [
                              Text(
                                "Select Quntity",
                                style: TextStyle(
                                  fontSize: FontSize.body2,
                                  fontFamily: FontFamily.lexendMedium,
                                  fontWeight: FontWeight.w500,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                              const SizedBox(
                                width: SizeConfig.height20,
                              ),
                              InputQty.int(
                                qtyFormProps: QtyFormProps(enableTyping: false),
                                decoration: QtyDecorationProps(
                                  minusBtn: Icon(
                                    Icons.remove_circle,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                  plusBtn: Icon(
                                    Icons.add_circle,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                  qtyStyle: QtyStyle.classic,
                                  orientation: ButtonOrientation.horizontal,
                                  btnColor:
                                      darkModeController.isLightTheme.value
                                          ? ColorsConfig.primaryColor
                                          : ColorsConfig.secondaryColor,
                                  isBordered: false,
                                  iconColor:
                                      darkModeController.isLightTheme.value
                                          ? ColorsConfig.primaryColor
                                          : ColorsConfig.secondaryColor,
                                ),
                                maxVal: 10,
                                initVal: 1,
                                minVal: 1,
                                steps: 1,
                                onQtyChanged: (val) {
                                  if (val == null) {
                                    qty = 1;
                                  } else {
                                    qty = val;
                                  }
                                },
                              ),
                            ],
                          ),

                          if (product["sub_category"] == "Tshirt" ||
                              product["sub_category"] == "Shirt" ||
                              product["sub_category"] == "Pants")
                            Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: SizeConfig.height24,
                                    ),
                                    Obx(
                                      () {
                                        selectedSize = fashionController
                                            .selectedSize.value;

                                        return Text(
                                          "${TextString.selectSize}($selectedSize)",
                                          style: TextStyle(
                                            fontSize: FontSize.body2,
                                            fontFamily: FontFamily.lexendMedium,
                                            fontWeight: FontWeight.w500,
                                            color: darkModeController
                                                    .isLightTheme.value
                                                ? ColorsConfig.primaryColor
                                                : ColorsConfig.secondaryColor,
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: SizeConfig.height10,
                                    ),
                                    GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 7,
                                        mainAxisExtent: SizeConfig.height35,
                                      ),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          fashionController.sizesList.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            fashionController.selectSize(index);
                                          },
                                          child: Obx(
                                            () {
                                              final isSelected =
                                                  fashionController
                                                          .selectedSizeIndex
                                                          .value ==
                                                      index;
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                  right: SizeConfig.padding10,
                                                ),
                                                child: Container(
                                                  width: SizeConfig.width45,
                                                  height: SizeConfig.height45,
                                                  decoration: BoxDecoration(
                                                    color: isSelected
                                                        ? darkModeController
                                                                .isLightTheme
                                                                .value
                                                            ? ColorsConfig
                                                                .primaryColor
                                                            : ColorsConfig
                                                                .secondaryColor
                                                        : darkModeController
                                                                .isLightTheme
                                                                .value
                                                            ? ColorsConfig
                                                                .secondaryColor
                                                            : ColorsConfig
                                                                .primaryColor,
                                                    borderRadius: BorderRadius
                                                        .circular(SizeConfig
                                                            .borderRadius08),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      fashionController
                                                          .sizesList[index],
                                                      style: TextStyle(
                                                        fontSize:
                                                            FontSize.body3,
                                                        fontFamily: isSelected
                                                            ? FontFamily
                                                                .lexendMedium
                                                            : FontFamily
                                                                .lexendLight,
                                                        fontWeight: isSelected
                                                            ? FontWeight.w500
                                                            : FontWeight.w300,
                                                        color: isSelected
                                                            ? darkModeController
                                                                    .isLightTheme
                                                                    .value
                                                                ? ColorsConfig
                                                                    .secondaryColor
                                                                : ColorsConfig
                                                                    .primaryColor
                                                            : darkModeController
                                                                    .isLightTheme
                                                                    .value
                                                                ? ColorsConfig
                                                                    .primaryColor
                                                                : ColorsConfig
                                                                    .secondaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ]),
                            ),
                          if (product["sub_category"] == "Shoes")
                            Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: SizeConfig.height24,
                                    ),
                                    Obx(
                                      () {
                                        selectedSize = fashionController
                                            .selectedSizeshoes.value;

                                        return Text(
                                          "${TextString.selectSize}($selectedSize)",
                                          style: TextStyle(
                                            fontSize: FontSize.body2,
                                            fontFamily: FontFamily.lexendMedium,
                                            fontWeight: FontWeight.w500,
                                            color: darkModeController
                                                    .isLightTheme.value
                                                ? ColorsConfig.primaryColor
                                                : ColorsConfig.secondaryColor,
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: SizeConfig.height10,
                                    ),
                                    GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 7,
                                        mainAxisExtent: SizeConfig.height35,
                                      ),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: fashionController
                                          .sizesListshoes.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            fashionController
                                                .selectSizeshoes(index);
                                          },
                                          child: Obx(
                                            () {
                                              final isSelected =
                                                  fashionController
                                                          .selectedSizeIndexShoes
                                                          .value ==
                                                      index;
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                  right: SizeConfig.padding10,
                                                ),
                                                child: Container(
                                                  width: SizeConfig.width45,
                                                  height: SizeConfig.height45,
                                                  decoration: BoxDecoration(
                                                    color: isSelected
                                                        ? darkModeController
                                                                .isLightTheme
                                                                .value
                                                            ? ColorsConfig
                                                                .primaryColor
                                                            : ColorsConfig
                                                                .secondaryColor
                                                        : darkModeController
                                                                .isLightTheme
                                                                .value
                                                            ? ColorsConfig
                                                                .secondaryColor
                                                            : ColorsConfig
                                                                .primaryColor,
                                                    borderRadius: BorderRadius
                                                        .circular(SizeConfig
                                                            .borderRadius08),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      fashionController
                                                              .sizesListshoes[
                                                          index],
                                                      style: TextStyle(
                                                        fontSize:
                                                            FontSize.body3,
                                                        fontFamily: isSelected
                                                            ? FontFamily
                                                                .lexendMedium
                                                            : FontFamily
                                                                .lexendLight,
                                                        fontWeight: isSelected
                                                            ? FontWeight.w500
                                                            : FontWeight.w300,
                                                        color: isSelected
                                                            ? darkModeController
                                                                    .isLightTheme
                                                                    .value
                                                                ? ColorsConfig
                                                                    .secondaryColor
                                                                : ColorsConfig
                                                                    .primaryColor
                                                            : darkModeController
                                                                    .isLightTheme
                                                                    .value
                                                                ? ColorsConfig
                                                                    .primaryColor
                                                                : ColorsConfig
                                                                    .secondaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ]),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: SizeConfig.height20,
                    ),
                    Container(
                      width: double.infinity,
                      height: SizeConfig.height10,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.lineColor.withOpacity(.4)
                          : ColorsConfig.buttonColor,
                    ),
                    Container(
                      width: double.infinity,
                      height: SizeConfig.height149,
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
                        children: [
                          Text(
                            TextString.description,
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendMedium,
                              fontWeight: FontWeight.w500,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height10,
                          ),
                          Text(
                            TextString.fashionDetailDescription,
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendLight,
                              fontWeight: FontWeight.w300,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: SizeConfig.height10,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.lineColor.withOpacity(.4)
                          : ColorsConfig.buttonColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.offersView);
                      },
                      child: Container(
                        width: double.infinity,
                        height: SizeConfig.height48,
                        padding: const EdgeInsets.only(
                          left: SizeConfig.padding24,
                          top: SizeConfig.padding15,
                          bottom: SizeConfig.padding15,
                          right: SizeConfig.padding24,
                        ),
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.secondaryColor
                            : ColorsConfig.primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image(
                                  image: const AssetImage(ImageConfig.offer),
                                  width: SizeConfig.width18,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                                const SizedBox(
                                  width: SizeConfig.width06,
                                ),
                                Text(
                                  TextString.offers,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendMedium,
                                    fontWeight: FontWeight.w500,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              TextString.offers15More,
                              style: TextStyle(
                                fontSize: FontSize.body3,
                                fontFamily: FontFamily.lexendLight,
                                fontWeight: FontWeight.w300,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: SizeConfig.height10,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.lineColor.withOpacity(.4)
                          : ColorsConfig.buttonColor,
                    ),
                    Container(
                      width: double.infinity,
                      height: SizeConfig.height130,
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
                        children: [
                          Text(
                            TextString.productDetails,
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendMedium,
                              fontWeight: FontWeight.w500,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: SizeConfig.padding17,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: SizeConfig.width05,
                                  height: SizeConfig.height05,
                                  decoration: const BoxDecoration(
                                    color: ColorsConfig.textLightColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Text(
                                  TextString.regularFit,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendLight,
                                    fontWeight: FontWeight.w300,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                  ),
                                ),
                                Text(
                                  TextString.premiumCottonSilk.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontWeight: FontWeight.w400,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height06,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: SizeConfig.padding17,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: SizeConfig.width05,
                                  height: SizeConfig.height05,
                                  decoration: const BoxDecoration(
                                    color: ColorsConfig.textLightColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Text(
                                  TextString.packageContains,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendLight,
                                    fontWeight: FontWeight.w300,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                  ),
                                ),
                                Text(
                                  TextString.shirt1,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontWeight: FontWeight.w400,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height06,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: SizeConfig.padding17,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: SizeConfig.width05,
                                  height: SizeConfig.height05,
                                  decoration: const BoxDecoration(
                                    color: ColorsConfig.textLightColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Text(
                                  TextString.machineWashCold,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendLight,
                                    fontWeight: FontWeight.w300,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding24,
                        right: SizeConfig.padding24,
                        top: SizeConfig.padding24,
                        bottom: SizeConfig.padding50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                TextString.customerReviews,
                                style: TextStyle(
                                  fontSize: FontSize.body2,
                                  fontFamily: FontFamily.lexendMedium,
                                  fontWeight: FontWeight.w500,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.ratingAndReviewsView);
                                },
                                child: Text(
                                  TextString.seeMore,
                                  style: TextStyle(
                                    fontSize: FontSize.body3,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontWeight: FontWeight.w400,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: SizeConfig.height10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: SizeConfig.width44,
                                height: SizeConfig.height22,
                                decoration: BoxDecoration(
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.secondaryColor
                                      : ColorsConfig.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.borderRadius19),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      TextString.rating4point5,
                                      style: TextStyle(
                                        fontSize: FontSize.body3,
                                        fontFamily: FontFamily.lexendRegular,
                                        fontWeight: FontWeight.w400,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: SizeConfig.width03,
                                    ),
                                    Image(
                                      image: const AssetImage(ImageConfig.star),
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                      width: SizeConfig.width12,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: SizeConfig.width10,
                              ),
                              Text(
                                TextString.ratingAndReviewTotal,
                                style: TextStyle(
                                  fontSize: FontSize.body2,
                                  fontFamily: FontFamily.lexendLight,
                                  fontWeight: FontWeight.w300,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.textColor
                                      : ColorsConfig.modeInactiveColor,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.lineColor
                                : ColorsConfig.lineDarkColor,
                            height: SizeConfig.height32,
                            thickness: SizeConfig.lineThickness01,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Image(
                                        image:
                                            AssetImage(ImageConfig.reviewMan1),
                                        width: SizeConfig.width32,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width10,
                                      ),
                                      Text(
                                        TextString.codyFisher,
                                        style: TextStyle(
                                          fontSize: FontSize.body2,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontWeight: FontWeight.w400,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    TextString.days5Ago,
                                    style: TextStyle(
                                      fontSize: FontSize.body3,
                                      fontFamily: FontFamily.lexendLight,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: SizeConfig.height10,
                              ),
                              Image(
                                image: AssetImage(
                                  darkModeController.isLightTheme.value
                                      ? ImageConfig.ratings
                                      : ImageConfig.ratingDark,
                                ),
                                width: SizeConfig.width68,
                                height: SizeConfig.height12,
                              ),
                              const SizedBox(
                                height: SizeConfig.height06,
                              ),
                              Text(
                                TextString.review1,
                                style: TextStyle(
                                  fontSize: FontSize.body3,
                                  fontFamily: FontFamily.lexendLight,
                                  fontWeight: FontWeight.w300,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.textColor
                                      : ColorsConfig.modeInactiveColor,
                                ),
                              ),
                              const SizedBox(
                                height: SizeConfig.height08,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            ImageConfig.likeFashion),
                                        width: SizeConfig.width14,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width04,
                                      ),
                                      Text(
                                        TextString.like20,
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontFamily: FontFamily.lexendLight,
                                          fontWeight: FontWeight.w300,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: SizeConfig.width16,
                                  ),
                                  Row(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            ImageConfig.dislikeFashion),
                                        width: SizeConfig.width14,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width04,
                                      ),
                                      Text(
                                        TextString.dislike12,
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontFamily: FontFamily.lexendLight,
                                          fontWeight: FontWeight.w300,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: SizeConfig.height24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Image(
                                        image:
                                            AssetImage(ImageConfig.reviewMan2),
                                        width: SizeConfig.width32,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width10,
                                      ),
                                      Text(
                                        TextString.jacobJones,
                                        style: TextStyle(
                                          fontSize: FontSize.body2,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontWeight: FontWeight.w400,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    TextString.month4Ago,
                                    style: TextStyle(
                                      fontSize: FontSize.body3,
                                      fontFamily: FontFamily.lexendLight,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: SizeConfig.height10,
                              ),
                              Image(
                                image: AssetImage(
                                  darkModeController.isLightTheme.value
                                      ? ImageConfig.ratings
                                      : ImageConfig.ratingDark,
                                ),
                                width: SizeConfig.width68,
                                height: SizeConfig.height12,
                              ),
                              const SizedBox(
                                height: SizeConfig.height06,
                              ),
                              Text(
                                TextString.review2,
                                style: TextStyle(
                                  fontSize: FontSize.body3,
                                  fontFamily: FontFamily.lexendLight,
                                  fontWeight: FontWeight.w300,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.textColor
                                      : ColorsConfig.modeInactiveColor,
                                ),
                              ),
                              const SizedBox(
                                height: SizeConfig.height08,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            ImageConfig.likeFashion),
                                        width: SizeConfig.width14,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width04,
                                      ),
                                      Text(
                                        TextString.like20,
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontFamily: FontFamily.lexendLight,
                                          fontWeight: FontWeight.w300,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: SizeConfig.width16,
                                  ),
                                  Row(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            ImageConfig.dislikeFashion),
                                        width: SizeConfig.width14,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width04,
                                      ),
                                      Text(
                                        TextString.dislike12,
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontFamily: FontFamily.lexendLight,
                                          fontWeight: FontWeight.w300,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: SizeConfig.height115,
                      padding: const EdgeInsets.only(
                        top: SizeConfig.padding12,
                        left: SizeConfig.padding24,
                        right: SizeConfig.padding24,
                        bottom: SizeConfig.padding12,
                      ),
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextString.returnPolicy,
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendMedium,
                              fontWeight: FontWeight.w500,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height10,
                          ),
                          Text.rich(
                            TextSpan(
                              text: TextString.returnPolicyDescription,
                              style: TextStyle(
                                fontSize: FontSize.body2,
                                fontFamily: FontFamily.lexendLight,
                                fontWeight: FontWeight.w300,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.textColor
                                    : ColorsConfig.modeInactiveColor,
                              ),
                              children: [
                                TextSpan(
                                  text: TextString.clickHere,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontWeight: FontWeight.w400,
                                    color: darkModeController.isLightTheme.value
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
                    Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding24,
                        right: SizeConfig.padding24,
                        top: SizeConfig.padding40,
                        bottom: SizeConfig.padding40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.lineColor
                                : ColorsConfig.lineDarkColor,
                            height: SizeConfig.height32,
                            thickness: SizeConfig.lineThickness01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                TextString.exploreNewProducts,
                                style: TextStyle(
                                  fontSize: FontSize.heading4,
                                  fontFamily: FontFamily.lexendMedium,
                                  fontWeight: FontWeight.w500,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                              Text(
                                TextString.seeMore,
                                style: TextStyle(
                                  fontSize: FontSize.body3,
                                  fontFamily: FontFamily.lexendRegular,
                                  fontWeight: FontWeight.w400,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.textColor
                                      : ColorsConfig.modeInactiveColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: SizeConfig.height24,
                          ),
                          Obx(() {
                            final List<Map<String, dynamic>> newarrived =
                                productcontroller.produts
                                    .where((product) =>
                                        product['category'] == 'b1' ||
                                        product['category'] == 'a9')
                                    .toList()
                                    .sublist(
                                      6,
                                    );
                            return SizedBox(
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: SizeConfig.padding24,
                                  crossAxisSpacing: SizeConfig.padding24,
                                  mainAxisExtent: 280,
                                ),
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  final imageNewIndex = index;
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FashionDetailsView(
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
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.secondaryColor
                                            : ColorsConfig.primaryColor,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // maxLines: 2,
                                                // softWrap: true,
                                                // overflow: TextOverflow
                                                //     .ellipsis,
                                                newarrived[index]['title'],
                                                style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                  fontFamily:
                                                      FontFamily.lexendMedium,
                                                  color: darkModeController
                                                          .isLightTheme.value
                                                      ? ColorsConfig
                                                          .primaryColor
                                                      : ColorsConfig
                                                          .secondaryColor,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      FontFamily.lexendLight,
                                                  color: darkModeController
                                                          .isLightTheme.value
                                                      ? ColorsConfig.textColor
                                                      : ColorsConfig
                                                          .modeInactiveColor,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    ('\u{20B9} ${newarrived[index]['price']}'),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      fontFamily: FontFamily
                                                          .lexendMedium,
                                                      color: darkModeController
                                                              .isLightTheme
                                                              .value
                                                          ? ColorsConfig
                                                              .primaryColor
                                                          : ColorsConfig
                                                              .secondaryColor,
                                                    ),
                                                  ),
                                                  Obx(
                                                    () => GestureDetector(
                                                      onTap: () {
                                                        fashionController
                                                            .toggleFavorite(
                                                                index);
                                                      },
                                                      child: Image(
                                                        image: AssetImage(
                                                          fashionController
                                                                  .isFavouriteList[
                                                                      index]
                                                                  .value
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
                                                                  ? ImageConfig
                                                                      .likeFill
                                                                  : ImageConfig
                                                                      .favouriteFill,
                                                        ),
                                                        width:
                                                            SizeConfig.width18,
                                                      ),
                                                    ),
                                                  ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
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
                  blurRadius: 15,
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
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.toNamed(AppRoutes.paymentView);
                  //   },
                  //   child: Container(
                  //     height: SizeConfig.height52,
                  //     width: SizeConfig.width116,
                  //     decoration: BoxDecoration(
                  //       borderRadius:
                  //           BorderRadius.circular(SizeConfig.borderRadius14),
                  //       border: Border.all(
                  //         color: darkModeController.isLightTheme.value
                  //             ? ColorsConfig.primaryColor
                  //             : ColorsConfig.secondaryColor,
                  //       ),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         TextString.textButtonBuyNow,
                  //         style: TextStyle(
                  //           fontSize: FontSize.body1,
                  //           fontWeight: FontWeight.w400,
                  //           fontFamily: FontFamily.lexendRegular,
                  //           color: darkModeController.isLightTheme.value
                  //               ? ColorsConfig.primaryColor
                  //               : ColorsConfig.secondaryColor,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    width: SizeConfig.width14,
                  ),
                  Obx(() {
                    final isInBag =
                        bagcontroller.isAddedMap[product['id']] ?? false;
                    return !isInBag
                        ? Expanded(
                            child: GestureDetector(
                              onTap: () {
                                bagcontroller.toggleaddToBag(
                                    user!.uid, product, qty, selectedSize);
                              },
                              child: Obx(
                                () {
                                  return Container(
                                    height: SizeConfig.height52,
                                    width: SizeConfig.width212,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.borderRadius14),
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Add to Bag',
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
                                  );
                                },
                              ),
                            ),
                          )
                        : Expanded(
                            child: GestureDetector(
                              onTap: () {
                                goToTab(4);
                              },
                              child: Obx(
                                () {
                                  return Container(
                                    height: SizeConfig.height52,
                                    width: SizeConfig.width212,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.borderRadius14),
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "View Bag",
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
                                  );
                                },
                              ),
                            ),
                          );
                  }),
                ],
              ),
            ),
          ),
        ));
  }

  buildDot({required int index}) {
    return Container(
      margin: const EdgeInsets.only(right: SizeConfig.margin6),
      height: fashionController.currentPage.value == index
          ? SizeConfig.height06
          : SizeConfig.height06,
      width: fashionController.currentPage.value == index
          ? SizeConfig.width14
          : SizeConfig.width06,
      decoration: BoxDecoration(
        color: fashionController.currentPage.value == index
            ? darkModeController.isLightTheme.value
                ? ColorsConfig.primaryColor
                : ColorsConfig.secondaryColor
            : darkModeController.isLightTheme.value
                ? ColorsConfig.dotIndicatorColor
                : ColorsConfig.unRatedColor,
        borderRadius: BorderRadius.circular(SizeConfig.borderRadius39),
      ),
    );
  }
}
