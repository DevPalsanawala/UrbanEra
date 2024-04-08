// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/size.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import '../../../config/colors.dart';
import '../../../config/font_family.dart';
import '../../../config/font_size.dart';

class CustomProgressBar extends StatelessWidget {
  final String text;
  final double width;
  final int value;
  final int totalValue;

  CustomProgressBar(
      {super.key,
      required this.text,
      required this.width,
      required this.value,
      required this.totalValue});

  DarkModeController darkModeController = Get.put(DarkModeController());

  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: FontSize.body3,
            fontFamily: FontFamily.lexendRegular,
            fontWeight: FontWeight.w400,
            color: darkModeController.isLightTheme.value
                ? ColorsConfig.primaryColor
                : ColorsConfig.secondaryColor,
          ),
        ),
        const SizedBox(width: SizeConfig.width06),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: width,
                  height: SizeConfig.height04,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.borderRadius27,
                    ),
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.reviewFillColor
                        : ColorsConfig.buttonColor,
                  ),
                ),
                Material(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.borderRadius27),
                  child: AnimatedContainer(
                    height: SizeConfig.height04,
                    width: width * ratio,
                    duration: Duration(milliseconds: totalValue),
                    decoration: BoxDecoration(
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                      borderRadius: BorderRadius.circular(
                        SizeConfig.borderRadius27,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
