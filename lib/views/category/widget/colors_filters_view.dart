// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/colors.dart';
import 'package:UrbanEraFashion/config/size.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/controller/fliters_controller.dart';

class ColorsFiltersView extends StatelessWidget {
  ColorsFiltersView({Key? key}) : super(key: key);

  FiltersController filtersController = Get.put(FiltersController());
  DarkModeController darkModeController = Get.put(DarkModeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: SizeConfig.padding20,
        left: SizeConfig.padding12,
        right: SizeConfig.padding12,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisExtent: SizeConfig.height38,
          crossAxisSpacing: SizeConfig.width14,
          mainAxisSpacing: SizeConfig.height12,
        ),
        shrinkWrap: true,
        itemCount: filtersController.colorsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (filtersController.isSelected(index)) {
                filtersController.decreaseCount(index);
              } else {
                filtersController.increaseCount(index);
              }
              filtersController.toggleColorSelection(index);
            },
            child: Obx(
              () {
                final isSelected =
                  filtersController.selectedColorIndices.contains(index);
                return Container(
                  width: SizeConfig.width38,
                  height: SizeConfig.height38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor
                        : Colors.transparent,
                    border: Border.all(
                      color: isSelected
                          ? darkModeController.isLightTheme.value
                          ? ColorsConfig.textLightColor
                          : ColorsConfig.secondaryColor
                          : Colors.transparent,
                    ),
                    boxShadow: isSelected
                        ? [
                            const BoxShadow(
                              color: ColorsConfig.greyColor,
                              blurRadius: SizeConfig.blurRadius20,
                              spreadRadius: -5,
                              offset: Offset(0, 0),
                            ),
                          ]
                        : [],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(SizeConfig.padding05),
                      child: Container(
                        width: SizeConfig.width50,
                        decoration: BoxDecoration(
                          color: filtersController.colorsList[index],
                          shape: BoxShape.circle,
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
    );
  }
}
