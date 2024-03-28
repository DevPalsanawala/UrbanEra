import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/colors.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/button_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/crousel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Crousel extends StatefulWidget {
  Crousel({super.key});

  @override
  State<Crousel> createState() => _CrouselState();
}

class _CrouselState extends State<Crousel> {
  Crouselcontroller crouselcontroller = Get.put(Crouselcontroller());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              autoPlay: true,
              autoPlayInterval: Duration(milliseconds: 3000),
              scrollPhysics: BouncingScrollPhysics(),
              onPageChanged: (index, reson) {
                setState(() {
                  crouselcontroller.currentindex.value = index;
                });
              }),
          items: crouselcontroller.Mylist,
        ),
        const SizedBox(
          height: 10,
        ),
        AnimatedSmoothIndicator(
          activeIndex: crouselcontroller.currentindex.value,
          count: crouselcontroller.Mylist.length,
          effect: WormEffect(
            dotHeight: 4,
            dotWidth: 15,
            spacing: 6,
            dotColor: darkModeController.isLightTheme.value
                ? ColorsConfig.textColor
                : ColorsConfig.modeInactiveColor,
            activeDotColor: darkModeController.isLightTheme.value
                ? ColorsConfig.primaryColor
                : ColorsConfig.secondaryColor,
            paintStyle: PaintingStyle.fill,
            type: WormType.underground,
          ),
        ),
      ],
    );
    ;
  }
}
