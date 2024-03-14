// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/customer_care_controller.dart';

import '../../../config/colors.dart';
import '../../../config/font_family.dart';
import '../../../config/font_size.dart';
import '../../../config/image.dart';
import '../../../config/size.dart';
import '../../../config/text_string.dart';
import '../../../controller/dark_mode_controller.dart';

class CustomerCareView extends StatelessWidget {
  CustomerCareView({Key? key}) : super(key: key);

  CustomerCareController customerCareController = Get.put(CustomerCareController());
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
            left: SizeConfig.padding05,
          ),
          child: !customerCareController.searchBoolean.value
              ? Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      customerCareController.isFAQ1.value = false;
                      customerCareController.isFAQ2.value = false;
                      customerCareController.isFAQ3.value = false;
                      customerCareController.isFAQ4.value = false;
                      customerCareController.isFAQ5.value = false;
                      customerCareController.isFAQ6.value = false;
                      customerCareController.isFAQ7.value = false;
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
                    TextString.customerCare,
                    style: TextStyle(
                      fontFamily: FontFamily.lexendMedium,
                      fontSize: FontSize.heading4,
                      fontWeight: FontWeight.w500,
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
              top: SizeConfig.padding10,
              bottom: SizeConfig.padding10,
            ),
            child: !customerCareController.searchBoolean.value
                ? GestureDetector(
              onTap: () {
                customerCareController.searchBoolean.value = true;
              },
              child: Image(
                image: const AssetImage(ImageConfig.search),
                width: SizeConfig.width20,
                height: SizeConfig.height20,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.primaryColor
                    : ColorsConfig.secondaryColor,
              ),
            )
                : GestureDetector(
              onTap: () {
                customerCareController.searchBoolean.value = false;
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
          right: SizeConfig.padding24,
          top: SizeConfig.padding24,
          bottom: SizeConfig.padding10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  horizontalTitleGap: 0.0,
                  minVerticalPadding: 12,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    backgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    collapsedBackgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    title: Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding12,
                      ),
                      child: Obx(() => Text(
                        TextString.whatIsPremium,
                        style: TextStyle(
                          fontFamily: customerCareController.isFAQ1.value ? FontFamily.lexendRegular : FontFamily.lexendLight,
                          fontSize: FontSize.body2,
                          fontWeight: FontWeight.w400,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      )),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    clipBehavior: Clip.antiAlias,
                    childrenPadding: const EdgeInsets.only(
                      bottom: SizeConfig.padding12,
                      right: SizeConfig.padding12,
                      left: SizeConfig.padding12,
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(
                        right: SizeConfig.padding12,
                      ),
                      child: Obx(() => Image.asset(
                        customerCareController.isFAQ1.value == true ? ImageConfig.dropdownOpen : ImageConfig.dropdownClose,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                        width: SizeConfig.width20,
                      )),
                    ),
                    children: [
                      Divider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                        height: 0,
                      ),
                      const SizedBox(
                        height: SizeConfig.height12,
                      ),
                      Text(
                        TextString.expansionText,
                        style: TextStyle(
                          fontFamily: FontFamily.lexendLight,
                          fontSize: FontSize.body3,
                          fontWeight: FontWeight.w300,
                          color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.textColor
                                    : ColorsConfig.modeInactiveColor,
                        ),
                      ),
                    ],
                    onExpansionChanged: (bool expanded) {
                      customerCareController.isFAQ1.value = expanded;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height16,
              ),
              Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  horizontalTitleGap: 0.0,
                  minVerticalPadding: 12,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    backgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    collapsedBackgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    title: Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding12,
                      ),
                      child: Obx(() => Text(
                        TextString.howToUsePremium,
                        style: TextStyle(
                          fontFamily: customerCareController.isFAQ2.value ? FontFamily.lexendRegular : FontFamily.lexendLight,
                          fontSize: FontSize.body2,
                          fontWeight: FontWeight.w400,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      )),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    clipBehavior: Clip.antiAlias,
                    childrenPadding: const EdgeInsets.only(
                      bottom: SizeConfig.padding12,
                      right: SizeConfig.padding12,
                      left: SizeConfig.padding12,
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(
                        right: SizeConfig.padding12,
                      ),
                      child: Obx(() => Image.asset(
                        customerCareController.isFAQ2.value == true ? ImageConfig.dropdownOpen : ImageConfig.dropdownClose,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                        width: SizeConfig.width20,
                      )),
                    ),
                    children: [
                      Divider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                        height: 0,
                      ),
                      const SizedBox(
                        height: SizeConfig.height12,
                      ),
                      Text(
                        TextString.expansionText,
                        style: TextStyle(
                          fontFamily: FontFamily.lexendLight,
                          fontSize: FontSize.body3,
                          fontWeight: FontWeight.w300,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.textColor
                              : ColorsConfig.modeInactiveColor,
                        ),
                      ),
                    ],
                    onExpansionChanged: (bool expanded) {
                      customerCareController.isFAQ2.value = expanded;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height16,
              ),
              Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  horizontalTitleGap: 0.0,
                  minVerticalPadding: 12,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    backgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    collapsedBackgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    title: Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding12,
                      ),
                      child: Obx(() => Text(
                        TextString.howToICancelOrder,
                        style: TextStyle(
                          fontFamily: customerCareController.isFAQ3.value ? FontFamily.lexendRegular : FontFamily.lexendLight,
                          fontSize: FontSize.body2,
                          fontWeight: FontWeight.w400,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      )),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    clipBehavior: Clip.antiAlias,
                    childrenPadding: const EdgeInsets.only(
                      bottom: SizeConfig.padding12,
                      right: SizeConfig.padding12,
                      left: SizeConfig.padding12,
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(
                        right: SizeConfig.padding12,
                      ),
                      child: Obx(() => Image.asset(
                        customerCareController.isFAQ3.value == true ? ImageConfig.dropdownOpen : ImageConfig.dropdownClose,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                        width: SizeConfig.width20,
                      )),
                    ),
                    children: [
                      Divider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                        height: 0,
                      ),
                      const SizedBox(
                        height: SizeConfig.height12,
                      ),
                      Text(
                        TextString.expansionText,
                        style: TextStyle(
                          fontFamily: FontFamily.lexendLight,
                          fontSize: FontSize.body3,
                          fontWeight: FontWeight.w300,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.textColor
                              : ColorsConfig.modeInactiveColor,
                        ),
                      ),
                    ],
                    onExpansionChanged: (bool expanded) {
                      customerCareController.isFAQ3.value = expanded;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height16,
              ),
              Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  horizontalTitleGap: 0.0,
                  minVerticalPadding: 12,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    backgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    collapsedBackgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    title: Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding12,
                      ),
                      child: Obx(() => Text(
                        TextString.isPrimeFreeToUse,
                        style: TextStyle(
                          fontFamily: customerCareController.isFAQ4.value ? FontFamily.lexendRegular : FontFamily.lexendLight,
                          fontSize: FontSize.body2,
                          fontWeight: FontWeight.w400,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      )),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    clipBehavior: Clip.antiAlias,
                    childrenPadding: const EdgeInsets.only(
                      bottom: SizeConfig.padding12,
                      right: SizeConfig.padding12,
                      left: SizeConfig.padding12,
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(
                        right: SizeConfig.padding12,
                      ),
                      child: Obx(() => Image.asset(
                        customerCareController.isFAQ4.value == true ? ImageConfig.dropdownOpen : ImageConfig.dropdownClose,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                        width: SizeConfig.width20,
                      )),
                    ),
                    children: [
                      Divider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                        height: 0,
                      ),
                      const SizedBox(
                        height: SizeConfig.height12,
                      ),
                      Text(
                        TextString.expansionText,
                        style: TextStyle(
                          fontFamily: FontFamily.lexendLight,
                          fontSize: FontSize.body3,
                          fontWeight: FontWeight.w300,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.textColor
                              : ColorsConfig.modeInactiveColor,
                        ),
                      ),
                    ],
                    onExpansionChanged: (bool expanded) {
                      customerCareController.isFAQ4.value = expanded;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height16,
              ),
              Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  horizontalTitleGap: 0.0,
                  minVerticalPadding: 12,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    backgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    collapsedBackgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    title: Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding12,
                      ),
                      child: Obx(() => Text(
                        TextString.howToAddPromoOnPrime,
                        style: TextStyle(
                          fontFamily: customerCareController.isFAQ5.value ? FontFamily.lexendRegular : FontFamily.lexendLight,
                          fontSize: FontSize.body2,
                          fontWeight: FontWeight.w400,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      )),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    clipBehavior: Clip.antiAlias,
                    childrenPadding: const EdgeInsets.only(
                      bottom: SizeConfig.padding12,
                      right: SizeConfig.padding12,
                      left: SizeConfig.padding12,
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(
                        right: SizeConfig.padding12,
                      ),
                      child: Obx(() => Image.asset(
                        customerCareController.isFAQ5.value == true ? ImageConfig.dropdownOpen : ImageConfig.dropdownClose,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                        width: SizeConfig.width20,
                      )),
                    ),
                    children: [
                      Divider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                        height: 0,
                      ),
                      const SizedBox(
                        height: SizeConfig.height12,
                      ),
                      Text(
                        TextString.expansionText,
                        style: TextStyle(
                          fontFamily: FontFamily.lexendLight,
                          fontSize: FontSize.body3,
                          fontWeight: FontWeight.w300,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.textColor
                              : ColorsConfig.modeInactiveColor,
                        ),
                      ),
                    ],
                    onExpansionChanged: (bool expanded) {
                      customerCareController.isFAQ5.value = expanded;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height16,
              ),
              Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  horizontalTitleGap: 0.0,
                  minVerticalPadding: 12,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    backgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    collapsedBackgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    title: Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding12,
                      ),
                      child: Obx(() => Text(
                        TextString.howToUsePrime,
                        style: TextStyle(
                          fontFamily: customerCareController.isFAQ6.value ? FontFamily.lexendRegular : FontFamily.lexendLight,
                          fontSize: FontSize.body2,
                          fontWeight: FontWeight.w400,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      )),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    clipBehavior: Clip.antiAlias,
                    childrenPadding: const EdgeInsets.only(
                      bottom: SizeConfig.padding12,
                      right: SizeConfig.padding12,
                      left: SizeConfig.padding12,
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(
                        right: SizeConfig.padding12,
                      ),
                      child: Obx(() => Image.asset(
                        customerCareController.isFAQ6.value == true ? ImageConfig.dropdownOpen : ImageConfig.dropdownClose,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                        width: SizeConfig.width20,
                      )),
                    ),
                    children: [
                      Divider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                        height: 0,
                      ),
                      const SizedBox(
                        height: SizeConfig.height12,
                      ),
                      Text(
                        TextString.expansionText,
                        style: TextStyle(
                          fontFamily: FontFamily.lexendLight,
                          fontSize: FontSize.body3,
                          fontWeight: FontWeight.w300,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.textColor
                              : ColorsConfig.modeInactiveColor,
                        ),
                      ),
                    ],
                    onExpansionChanged: (bool expanded) {
                      customerCareController.isFAQ6.value = expanded;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height16,
              ),
              Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  horizontalTitleGap: 0.0,
                  minVerticalPadding: 12,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    backgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    collapsedBackgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    title: Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding12,
                      ),
                      child: Obx(() => Text(
                        TextString.howToICancelOrder,
                        style: TextStyle(
                          fontFamily: customerCareController.isFAQ7.value ? FontFamily.lexendRegular : FontFamily.lexendLight,
                          fontSize: FontSize.body2,
                          fontWeight: FontWeight.w400,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      )),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    clipBehavior: Clip.antiAlias,
                    childrenPadding: const EdgeInsets.only(
                      bottom: SizeConfig.padding12,
                      right: SizeConfig.padding12,
                      left: SizeConfig.padding12,
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(
                        right: SizeConfig.padding12,
                      ),
                      child: Obx(() => Image.asset(
                        customerCareController.isFAQ7.value == true ? ImageConfig.dropdownOpen : ImageConfig.dropdownClose,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                        width: SizeConfig.width20,
                      )),
                    ),
                    children: [
                      Divider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.lineColor
                            : ColorsConfig.lineDarkColor,
                        height: 0,
                      ),
                      const SizedBox(
                        height: SizeConfig.height12,
                      ),
                      Text(
                        TextString.expansionText,
                        style: TextStyle(
                          fontFamily: FontFamily.lexendLight,
                          fontSize: FontSize.body3,
                          fontWeight: FontWeight.w300,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.textColor
                              : ColorsConfig.modeInactiveColor,
                        ),
                      ),
                    ],
                    onExpansionChanged: (bool expanded) {
                      customerCareController.isFAQ7.value = expanded;
                    },
                  ),
                ),
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
