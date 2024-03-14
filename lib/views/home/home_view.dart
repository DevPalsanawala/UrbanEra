// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/colors.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/font_family.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/font_size.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/image.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/size.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/home_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/routes/app_routes.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/home/widget/filter_bottom_sheet.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/home/widget/search_with_image_bottom_sheet.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());
  DarkModeController darkModeController = Get.put(DarkModeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => WillPopScope(
          onWillPop: () async {
            Get.offAllNamed(AppRoutes.phoneview);
            return false;
          },
          child: Scaffold(
            backgroundColor: darkModeController.isLightTheme.value
                ? ColorsConfig.backgroundColor
                : ColorsConfig.buttonColor,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(SizeConfig.height125),
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
                    top: SizeConfig.padding30,
                    bottom: SizeConfig.padding08,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                TextString.hiRajan,
                                style: TextStyle(
                                  fontSize: FontSize.heading4,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: FontFamily.lexendMedium,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
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
                        height: SizeConfig.height30,
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(SizeConfig.height35),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: SizeConfig.padding24,
                      right: SizeConfig.padding24,
                      bottom: SizeConfig.padding24,
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
                                      image:
                                          const AssetImage(ImageConfig.camera),
                                      width: SizeConfig.width18,
                                      color:
                                          darkModeController.isLightTheme.value
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
                        GestureDetector(
                          onTap: () {
                            selectFilterBottomSheet(context);
                          },
                          child: Container(
                            width: SizeConfig.width48,
                            height: SizeConfig.height48,
                            decoration: BoxDecoration(
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.secondaryColor
                                  : ColorsConfig.primaryColor,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadius14),
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
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                left: SizeConfig.padding24,
                top: SizeConfig.padding15,
                right: SizeConfig.padding24,
                bottom: SizeConfig.padding12,
              ),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: SizeConfig.padding05),
                      child: MasonryGridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 23,
                        crossAxisSpacing: 23,
                        itemCount:
                            homeController.trendingProductsImage.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  TextString.trending,
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
                                  TextString.products,
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
                            final imageIndex = index - 1;
                            if (imageIndex % 2 == 0) {
                              return Transform.translate(
                                offset: const Offset(0, 5),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.fashionDetailsView);
                                  },
                                  child: Container(
                                    width: SizeConfig.width159,
                                    padding: const EdgeInsets.only(
                                      top: SizeConfig.padding12,
                                      bottom: SizeConfig.padding16,
                                      left: SizeConfig.padding12,
                                      right: SizeConfig.padding12,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.secondaryColor
                                              : ColorsConfig.primaryColor,
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.borderRadius14),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Image(
                                            image: AssetImage(homeController
                                                    .trendingProductsImage[
                                                imageIndex]),
                                            width: SizeConfig.width111,
                                            height: SizeConfig.height120,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: SizeConfig.height13,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              homeController
                                                      .trendingProductsTitle[
                                                  imageIndex],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: FontSize.body2,
                                                fontFamily:
                                                    FontFamily.lexendMedium,
                                                color: darkModeController
                                                        .isLightTheme.value
                                                    ? ColorsConfig.primaryColor
                                                    : ColorsConfig
                                                        .secondaryColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: SizeConfig.height02,
                                            ),
                                            Text(
                                              homeController
                                                      .trendingProductsSubtitle[
                                                  imageIndex],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: FontSize.body3,
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
                                              height: SizeConfig.height10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  homeController
                                                          .trendingProductsPrice[
                                                      imageIndex],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: FontSize.body2,
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
                                                Obx(
                                                  () => GestureDetector(
                                                    onTap: () {
                                                      homeController
                                                          .toggleFavorite(
                                                              imageIndex);
                                                    },
                                                    child: Image(
                                                      image: AssetImage(
                                                        homeController
                                                                .isFavouriteList[
                                                                    imageIndex]
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
                                                      width: SizeConfig.width18,
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
                                ),
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.fashionDetailsView);
                                },
                                child: Container(
                                  width: SizeConfig.width159,
                                  padding: const EdgeInsets.only(
                                    top: SizeConfig.padding12,
                                    bottom: SizeConfig.padding16,
                                    left: SizeConfig.padding12,
                                    right: SizeConfig.padding12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.secondaryColor
                                        : ColorsConfig.primaryColor,
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.borderRadius14),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Image(
                                          image: AssetImage(homeController
                                                  .trendingProductsImage[
                                              imageIndex]),
                                          width: SizeConfig.width111,
                                          height: SizeConfig.height120,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: SizeConfig.height13,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            homeController
                                                    .trendingProductsTitle[
                                                imageIndex],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: FontSize.body2,
                                              fontFamily:
                                                  FontFamily.lexendMedium,
                                              color: darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.primaryColor
                                                  : ColorsConfig.secondaryColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: SizeConfig.height02,
                                          ),
                                          Text(
                                            homeController
                                                    .trendingProductsSubtitle[
                                                imageIndex],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: FontSize.body3,
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
                                            height: SizeConfig.height10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                homeController
                                                        .trendingProductsPrice[
                                                    imageIndex],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: FontSize.body2,
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
                                              Obx(
                                                () => GestureDetector(
                                                  onTap: () {
                                                    homeController
                                                        .toggleFavorite(
                                                            imageIndex);
                                                  },
                                                  child: Image(
                                                    image: AssetImage(
                                                      homeController
                                                              .isFavouriteList[
                                                                  imageIndex]
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
                                                    width: SizeConfig.width18,
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
                            }
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: SizeConfig.height40,
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
                      height: SizeConfig.height24,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: SizeConfig.padding12),
                          child: Container(
                            height: SizeConfig.height80,
                            width: double.infinity,
                            padding: const EdgeInsets.all(SizeConfig.padding11),
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
                                      image: AssetImage(homeController
                                          .mostPopularImage[index]),
                                      height: SizeConfig.height56,
                                      width: SizeConfig.width64,
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
                                        Text(
                                          homeController
                                              .mostPopularTitle[index],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: FontSize.body2,
                                            fontFamily: FontFamily.lexendMedium,
                                            color: darkModeController
                                                    .isLightTheme.value
                                                ? ColorsConfig.primaryColor
                                                : ColorsConfig.secondaryColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: SizeConfig.height02,
                                        ),
                                        Text(
                                          homeController
                                              .mostPopularSubtitle[index],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: FontSize.body3,
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
                                  homeController.mostPopularPrice[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendMedium,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: SizeConfig.height30,
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
                      height: SizeConfig.height24,
                    ),
                    SizedBox(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: SizeConfig.padding24,
                          crossAxisSpacing: SizeConfig.padding24,
                          mainAxisExtent: SizeConfig.height224,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          final imageNewIndex = index;
                          return Container(
                            width: SizeConfig.width159,
                            padding: const EdgeInsets.all(SizeConfig.padding11),
                            decoration: BoxDecoration(
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.secondaryColor
                                  : ColorsConfig.primaryColor,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadius14),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                      homeController.newArrivedImage[index],
                                    ),
                                    width: SizeConfig.width111,
                                    height: SizeConfig.height120,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      homeController.newArrivedTitle[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: FontSize.body2,
                                        fontFamily: FontFamily.lexendMedium,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: SizeConfig.height02,
                                    ),
                                    Text(
                                      homeController.newArrivedSubtitle[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: FontSize.body3,
                                        fontFamily: FontFamily.lexendLight,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: SizeConfig.height10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          homeController.newArrivedPrice[index],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: FontSize.body2,
                                            fontFamily: FontFamily.lexendMedium,
                                            color: darkModeController
                                                    .isLightTheme.value
                                                ? ColorsConfig.primaryColor
                                                : ColorsConfig.secondaryColor,
                                          ),
                                        ),
                                        Obx(
                                          () => GestureDetector(
                                            onTap: () {
                                              homeController
                                                  .toggleArrivalFavorite(
                                                      imageNewIndex);
                                            },
                                            child: Image(
                                              image: AssetImage(
                                                homeController
                                                        .isFavouriteArrivalList[
                                                            imageNewIndex]
                                                        .value
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: SizeConfig.height04,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
