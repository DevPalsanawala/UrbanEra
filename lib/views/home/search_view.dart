// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/home_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/search_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/product_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/search/searchpage.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/category/fashion_details_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/home/widget/search_with_image_bottom_sheet.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List _allResults = [];
  List _resultList = [];
  List search = [
    "Tshirt",
    "Shirt",
    "Pants",
    "Shorts",
    "Shoes",
    "Socks",
    "Dress",
    "Cap",
    "Kurta",
  ];

  late TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchedChanged);
    // getClientStream();
  }

  _onSearchedChanged() {
    print(_searchController.text);
    searchResultList();
  }

  // Function to filter results based on search text
  searchResultList() {
    setState(() {
      if (_searchController.text != " ") {
        _resultList = search.where((product) {
          String subtitle = product.toString().toLowerCase();
          return subtitle.contains(_searchController.text.toLowerCase());
        }).toList();
      }
    });
  }

  // Function to fetch all products from Firestore
  // getClientStream() async {
  //   var data = await FirebaseFirestore.instance
  //       .collection('Products')
  //       .orderBy('title')
  //       .get();
  //   setState(() {
  //     _allResults =
  //         data.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  //     searchResultList(); // Filter initially
  //   });
  // }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchedChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkModeController.isLightTheme.value
          ? ColorsConfig.backgroundColor
          : ColorsConfig.buttonColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: darkModeController.isLightTheme.value
            ? ColorsConfig.backgroundColor
            : ColorsConfig.buttonColor,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
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
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                height: SizeConfig.height48,
                child: TextFormField(
                  controller: _searchController,
                  cursorColor: darkModeController.isLightTheme.value
                      ? ColorsConfig.primaryColor
                      : ColorsConfig.secondaryColor,
                  style: TextStyle(
                    fontFamily: FontFamily.lexendRegular,
                    fontSize: FontSize.body2,
                    fontWeight: FontWeight.w400,
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      left: SizeConfig.padding16,
                      right: SizeConfig.padding16,
                    ),
                    hintText: TextString.searchHere,
                    hintStyle: TextStyle(
                      fontFamily: FontFamily.lexendLight,
                      fontSize: FontSize.body3,
                      fontWeight: FontWeight.w300,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.textLightColor
                          : ColorsConfig.modeInactiveColor,
                    ),
                    filled: true,
                    fillColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        top: SizeConfig.padding15,
                        bottom: SizeConfig.padding15,
                      ),
                      child: Image(
                        image: const AssetImage(ImageConfig.search),
                        width: SizeConfig.width18,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(
                        top: SizeConfig.padding14,
                        bottom: SizeConfig.padding14,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          searchWithImageBottomSheet(context);
                        },
                        child: Image(
                          image: const AssetImage(ImageConfig.camera),
                          width: SizeConfig.width18,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.textColor
                              : ColorsConfig.modeInactiveColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: SizeConfig.width10,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _resultList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Searchpage(txt: _resultList[index]);
                  },
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ListTile(
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                      title: Text(
                        _resultList[index],
                        style: TextStyle(
                          fontFamily: FontFamily.lexendRegular,
                          fontSize: FontSize.body2,
                          fontWeight: FontWeight.w400,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ),
                      // leading: Hero(
                      //   tag: 'product_${_resultList[index]['id']}',
                      //   child: CircleAvatar(
                      //     backgroundColor: Colors.transparent,
                      //     radius: 25,
                      //     backgroundImage: AssetImage(
                      //       'assets/admin_site_images/all final images with background removed/${_resultList[index]['img']}',
                      //     ),
                      //   ),
                      // ),
                      // title: Hero(
                      //   tag: 'subtitle_${_resultList[index]['id']}',
                      //   child: Text(_resultList[index]['subtitle']),
                      // ),
                      // subtitle: Text(_resultList[index]['title']),
                      // trailing: Icon(
                      //   Icons.arrow_forward_ios_outlined,
                      //   size: 15,
                      // ),
                    ),
                  ),
                ),
                Divider(
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.lineColor
                      : ColorsConfig.lineDarkColor,
                  height: 10,
                  thickness: SizeConfig.lineThickness01,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
