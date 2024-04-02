// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/home_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/my_orders_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/routes/app_routes.dart';

import '../../../../config/colors.dart';
import '../../../../config/font_family.dart';
import '../../../../config/font_size.dart';
import '../../../../config/image.dart';
import '../../../../config/size.dart';
import '../../../../config/text_string.dart';

class OrderDetailsView extends StatelessWidget {
  OrderDetailsView({
    Key? key,
  }) : super(key: key);

  HomeController homeController = Get.put(HomeController());
  MyOrdersController myOrdersController = Get.put(MyOrdersController());
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
                top: SizeConfig.padding10,
                left: SizeConfig.padding10,
              ),
              child: !myOrdersController.searchBoolean.value
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
                          TextString.orderDetails,
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
            actions: [
              Obx(() => Padding(
                    padding: const EdgeInsets.only(
                      right: SizeConfig.padding24,
                      top: SizeConfig.padding24,
                      bottom: SizeConfig.padding10,
                    ),
                    child: !myOrdersController.searchBoolean.value
                        ? Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  myOrdersController.searchBoolean.value = true;
                                },
                                child: Image(
                                  image: const AssetImage(ImageConfig.search),
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
                              myOrdersController.searchBoolean.value = false;
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
              left: SizeConfig.padding24,
              top: SizeConfig.padding10,
              right: SizeConfig.padding24,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: SizeConfig.height14,
                  ),
                  Container(
                    height: SizeConfig.height42,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                      left: SizeConfig.padding12,
                    ),
                    decoration: BoxDecoration(
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    child: Row(
                      children: [
                        Text(
                          TextString.orderIDNumber,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.lexendRegular,
                            fontSize: FontSize.body2,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ),
                        Text(
                          TextString.orderNumber,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: FontFamily.lexendLight,
                            fontSize: FontSize.body2,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  Container(
                    height: SizeConfig.height140,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(SizeConfig.padding12),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                      ImageConfig.trendingP2,
                                    ),
                                    width: SizeConfig.width65,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: SizeConfig.padding20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          TextString.mintJeansShirt,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: FontFamily.lexendMedium,
                                            fontSize: FontSize.body2,
                                            color: darkModeController
                                                    .isLightTheme.value
                                                ? ColorsConfig.primaryColor
                                                : ColorsConfig.secondaryColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: SizeConfig.height06,
                                        ),
                                        Text(
                                          TextString.mintShiner,
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
                                        const SizedBox(
                                          height: SizeConfig.height12,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              TextString.dollar260,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontFamily:
                                                    FontFamily.lexendRegular,
                                                fontSize: FontSize.body2,
                                                color: darkModeController
                                                        .isLightTheme.value
                                                    ? ColorsConfig.primaryColor
                                                    : ColorsConfig
                                                        .secondaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: SizeConfig.height12,
                              ),
                              Divider(
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.lineColor
                                    : ColorsConfig.lineDarkColor,
                                height: 0,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  TextString.deliveredComplete,
                                  style: TextStyle(
                                    fontSize: FontSize.body3,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontWeight: FontWeight.w400,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                                Text(
                                  TextString.freeDelivery,
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
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  Container(
                    height: SizeConfig.height149,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(SizeConfig.padding12),
                    decoration: BoxDecoration(
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                      borderRadius: BorderRadius.circular(
                        SizeConfig.borderRadius14,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: SizeConfig.width28,
                                  height: SizeConfig.height28,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorsConfig.buttonColor,
                                  ),
                                  child: const Center(
                                    child: Image(
                                      image: AssetImage(ImageConfig.scooter),
                                      width: SizeConfig.width16,
                                      height: SizeConfig.height16,
                                      color: ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: SizeConfig.width10,
                                ),
                                Text(
                                  TextString.orderConfirmed,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendLight,
                                    fontWeight: FontWeight.w300,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SizeConfig.height01,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: SizeConfig.padding13point,
                              ),
                              child: Container(
                                width: SizeConfig.width01,
                                height: SizeConfig.height28,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.lineDarkColor,
                              ),
                            ),
                            const SizedBox(
                              height: SizeConfig.height01,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: SizeConfig.width28,
                                  height: SizeConfig.height28,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorsConfig.buttonColor,
                                  ),
                                  child: const Center(
                                    child: Image(
                                      image: AssetImage(ImageConfig.done),
                                      width: SizeConfig.width16,
                                      height: SizeConfig.height16,
                                      color: ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: SizeConfig.width10,
                                ),
                                Text(
                                  TextString.delivered11October,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendLight,
                                    fontWeight: FontWeight.w300,
                                    color: darkModeController.isLightTheme.value
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
                          height: SizeConfig.height22,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.orderStatusView);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                TextString.viewMore,
                                style: TextStyle(
                                  fontSize: FontSize.body3,
                                  fontFamily: FontFamily.lexendRegular,
                                  fontWeight: FontWeight.w400,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                              const SizedBox(
                                width: SizeConfig.width04,
                              ),
                              Image(
                                image: const AssetImage(ImageConfig.nextArrow2),
                                width: SizeConfig.width12,
                                height: SizeConfig.height12,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height24,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.addReviewsView);
                    },
                    child: Container(
                      height: SizeConfig.height52,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.buttonColor
                              : ColorsConfig.secondaryColor,
                        ),
                        borderRadius:
                            BorderRadius.circular(SizeConfig.borderRadius14),
                      ),
                      child: Center(
                        child: Text(
                          TextString.textButtonAddReviews,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.lexendMedium,
                            fontSize: FontSize.body1,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.height16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(
                        msg: TextString.invoiceDownload,
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: darkModeController.isLightTheme.value
                            ? ColorsConfig.buttonColor
                            : ColorsConfig.secondaryColor,
                        textColor: darkModeController.isLightTheme.value
                            ? ColorsConfig.secondaryColor
                            : ColorsConfig.buttonColor,
                      );
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
                          TextString.textButtonDownloadInvoice,
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
                  const SizedBox(
                    height: SizeConfig.height40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        TextString.recommendedProducts,
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
                        padding:
                            const EdgeInsets.only(bottom: SizeConfig.padding12),
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
                                    image: AssetImage(
                                        homeController.mostPopularImage[index]),
                                    height: 56,
                                    width: 64,
                                  ),
                                  const SizedBox(
                                    width: SizeConfig.width12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        homeController.mostPopularTitle[index],
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
                                              : ColorsConfig.modeInactiveColor,
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
                        TextString.exploreNewProducts,
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
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 24,
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
                                      color:
                                          darkModeController.isLightTheme.value
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
                                      color:
                                          darkModeController.isLightTheme.value
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
                                            myOrdersController
                                                .toggleArrivalFavorite(
                                                    imageNewIndex);
                                          },
                                          child: Image(
                                            image: AssetImage(
                                              myOrdersController
                                                      .isFavouriteArrivalList[
                                                          imageNewIndex]
                                                      .value
                                                  ? ImageConfig.favourite
                                                  : ImageConfig.likeFill,
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
                    height: SizeConfig.height20,
                  ),
                ],
              ),
            ),
          ),
        ));
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
