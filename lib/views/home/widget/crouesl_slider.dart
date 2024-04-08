import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/colors.dart';
import 'package:UrbanEraFashion/controller/button_controller.dart';
import 'package:UrbanEraFashion/controllermy/crousel.dart';
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
              viewportFraction: 0.9,
              autoPlay: true,
              autoPlayInterval: Duration(milliseconds: 2000),
              scrollPhysics: BouncingScrollPhysics(),
              onPageChanged: (index, reson) {
                setState(() {
                  crouselcontroller.currentindex.value = index;
                });
              }),
          items: crouselcontroller.Mylist,
        ),
        const SizedBox(
          height: 8,
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
            paintStyle: PaintingStyle.stroke,
            type: WormType.underground,
          ),
        ),
      ],
    );
    ;
  }
}
