import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/bag/bag_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/category/category_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/home/home_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/profile/profile_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/wishlist/wishlist_view.dart';

class BottomNavigationController extends GetxController {
  int selectedIndex = 0;
  bool showBottomBar = true;

  void changePage(int index) {
    selectedIndex = index;
  }

  List<Widget> pages = [
    HomeView(),
    CategoryView(),
    ProfileView(),
    WishlistView(),
    BagView(),
  ];
}