import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/home/widget/crousel_img.dart';

class Crouselcontroller extends GetxController {
  List<Widget> Mylist = [
    const CarosulItems(
        imgurl:
            'assets/admin_site_images/all final images with background removed/ban1.jpg'),
    const CarosulItems(
        imgurl:
            'assets/admin_site_images/all final images with background removed/ban2.jpg'),
    const CarosulItems(
        imgurl:
            'assets/admin_site_images/all final images with background removed/ban3.jpg'),
    const CarosulItems(
        imgurl:
            'assets/admin_site_images/all final images with background removed/ban4.jpg'),
    const CarosulItems(
        imgurl:
            'assets/admin_site_images/all final images with background removed/ban5.jpg'),
    const CarosulItems(
        imgurl:
            'assets/admin_site_images/all final images with background removed/ban6.jpg'),
  ].obs;
}
