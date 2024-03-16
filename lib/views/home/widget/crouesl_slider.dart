import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/crousel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Crousel extends StatelessWidget {
  Crousel({super.key});

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
              onPageChanged: (index, reson) {}),
          items: crouselcontroller.Mylist,
        ),
        const SizedBox(
          height: 10,
        ),
        // AnimatedSmoothIndicator(
        //   activeIndex: crouselcontroller.currentindex,
        //   count: crouselcontroller.Mylist.length,
        //   effect: const WormEffect(
        //     dotHeight: 9,
        //     dotWidth: 9,
        //     spacing: 10,
        //   ),
        // ),
      ],
    );
    ;
  }
}
