import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/views/bag/bag_view.dart';
import 'package:UrbanEraFashion/views/category/category_view.dart';
import 'package:UrbanEraFashion/views/home/home_view.dart';
import 'package:UrbanEraFashion/views/profile/profile_view.dart';
import 'package:UrbanEraFashion/views/wishlist/wishlist_view.dart';

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