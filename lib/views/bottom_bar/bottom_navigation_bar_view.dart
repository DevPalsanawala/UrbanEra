// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/colors.dart';
import 'package:UrbanEraFashion/config/size.dart';
import 'package:UrbanEraFashion/controller/bottom_navigation_controller.dart';
import 'package:UrbanEraFashion/controller/button_controller.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/controller/wishlist_controller.dart';

import '../../config/image.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  WishlistController wishlistController = Get.put(WishlistController());
  DarkModeController darkModeController = Get.put(DarkModeController());
  ButtonController buttonController = Get.put(ButtonController());

  void _onItemTapped(int index) {
    setState(() {
      bottomNavigationController.selectedIndex = index;

      if (index == 4 && !wishlistController.showFirstContent.value) {
        bottomNavigationController.showBottomBar = false;
      } else {
        bottomNavigationController.showBottomBar = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: darkModeController.isLightTheme.value
          ? ColorsConfig.backgroundColor
          : ColorsConfig.buttonColor,
      body: IndexedStack(
        index: bottomNavigationController.selectedIndex,
        children: [
          bottomNavigationController.pages[0],
          bottomNavigationController.pages[1],
          bottomNavigationController.pages[2],
          bottomNavigationController.pages[3],
          bottomNavigationController.pages[4],
        ],
      ),
      bottomNavigationBar: bottomNavigationController.showBottomBar
          ? Container(
        height: SizeConfig.height64,
        margin: const EdgeInsets.only(
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
          bottom: SizeConfig.padding10,
        ),
        padding: const EdgeInsets.only(
          left: SizeConfig.padding07point,
          right: SizeConfig.padding07point,
        ),
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(SizeConfig.borderRadius136),
          color: darkModeController.isLightTheme.value
              ? ColorsConfig.buttonColor
              : ColorsConfig.secondaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNavItem(
              0,
              Image(
                image: AssetImage(
                  darkModeController.isLightTheme.value
                  ? ImageConfig.homeFill
                  : ImageConfig.homeDarkFill,
                ),
                width: SizeConfig.width22,
              ),
              Image(
                image: const AssetImage(ImageConfig.home),
                width: SizeConfig.width20,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.bottomIconColor
                    : ColorsConfig.textLightColor,
              ),
            ),
            buildNavItem(
              1,
              Image(
                image: const AssetImage(ImageConfig.bookingFill),
                width: SizeConfig.width22,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.primaryColor
                    : ColorsConfig.secondaryColor,
              ),
              Image(
                image: const AssetImage(ImageConfig.booking),
                width: SizeConfig.width20,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.bottomIconColor
                    : ColorsConfig.textLightColor,
              ),
            ),
            buildNavItem(
              2,
              Image(
                image: const AssetImage(ImageConfig.profileFill),
                width: SizeConfig.width22,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.primaryColor
                    : ColorsConfig.secondaryColor,
              ),
              Image(
                image: const AssetImage(ImageConfig.profile),
                width: SizeConfig.width20,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.bottomIconColor
                    : ColorsConfig.textLightColor,
              ),
            ),
            buildNavItem(
              3,
              Image(
                image: const AssetImage(ImageConfig.likeFill),
                width: SizeConfig.width22,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.primaryColor
                    : ColorsConfig.secondaryColor,
              ),
              Image(
                image: const AssetImage(ImageConfig.favouriteBottom),
                width: SizeConfig.width20,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.bottomIconColor
                    : ColorsConfig.textLightColor,
              ),
            ),
            buildNavItem(
              4,
              Image(
                image: const AssetImage(ImageConfig.cartFill),
                width: SizeConfig.width22,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.primaryColor
                    : ColorsConfig.secondaryColor,
              ),
              Image(
                image: const AssetImage(ImageConfig.cart),
                width: SizeConfig.width20,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.bottomIconColor
                    : ColorsConfig.textLightColor,
              ),
            ),
          ],
        ),
      )
          : const SizedBox(),
    ));
  }

  Widget buildNavItem(int index, Widget selectedImage, Widget unselectedImage) {
    bool isSelected = bottomNavigationController.selectedIndex == index;
    Widget imageWidget = isSelected ? selectedImage : unselectedImage;

    return InkWell(
      onTap: () {
        _onItemTapped(index);
      },
      child: Container(
        width: SizeConfig.width52,
        height: SizeConfig.height52,
        decoration: isSelected
            ? BoxDecoration(
                shape: BoxShape.circle,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.secondaryColor
                    : ColorsConfig.primaryColor,
              )
            : null,
        child: Center(
          child: imageWidget,
        ),
      ),
    );
  }
}
