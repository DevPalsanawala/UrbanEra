import 'package:UrbanEraFashion/config/colors.dart';
import 'package:UrbanEraFashion/config/font_family.dart';
import 'package:UrbanEraFashion/config/font_size.dart';
import 'package:UrbanEraFashion/config/image.dart';
import 'package:UrbanEraFashion/config/size.dart';
import 'package:UrbanEraFashion/config/text_string.dart';
import 'package:UrbanEraFashion/controller/button_controller.dart';
import 'package:UrbanEraFashion/controllermy/product_controller.dart';
import 'package:UrbanEraFashion/views/category/fashion_details_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorySearchView extends StatefulWidget {
  const CategorySearchView({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Map<String, dynamic> category;

  @override
  State<CategorySearchView> createState() => _CategorySearchViewState();
}

class _CategorySearchViewState extends State<CategorySearchView> {
  List<Map<String, dynamic>> _resultList = [];
  final TextEditingController _searchController = TextEditingController();
  Productcontroller productcontroller = Get.put(Productcontroller());

  List<Map<String, dynamic>> listofproducts = [];
  List<Map<String, dynamic>> _allResults = [];
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchedChanged);

    searchResultList();
    getClientStream();
  }

  _onSearchedChanged() {
    if (_searchController.text.isEmpty) {
      setState(() {
        _resultList = listofproducts;
      });
    } else {
      searchResultList();
    }
  }

  // Function to filter results based on search text
  searchResultList() {
    setState(() {
      _resultList = listofproducts.where((product) {
        String subtitle = product['subtitle'].toString().toLowerCase();
        String title = product['title'].toString().toLowerCase();
        String searchText = _searchController.text.toLowerCase();
        return subtitle.contains(searchText) || title.contains(searchText);
      }).toList();
    });
  }

//fetch all products from Firestore
  getClientStream() async {
    final cat = widget.category;

    var data = await FirebaseFirestore.instance
        .collection('Products')
        .orderBy('title')
        .get();

    setState(() {
      _allResults =
          data.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

      searchResultList(); // Filter initially
    });
    setState(() {
      listofproducts = (productcontroller.produts)
          .where((products) => products['category'] == cat['id'])
          .toList();
    });
  }

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
                      borderSide: BorderSide(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.textLightColor
                            : ColorsConfig.modeInactiveColor,
                      ),
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
                    //
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: SizeConfig.width20,
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _resultList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FashionDetailsView(product: _resultList[index]);
                  },
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 25,
                backgroundImage: AssetImage(
                  'assets/admin_site_images/all final images with background removed/${_resultList[index]['img']}',
                ),
              ),
              title: Text(
                _resultList[index]['subtitle'],
                style: TextStyle(
                  fontFamily: FontFamily.lexendRegular,
                  fontSize: FontSize.body2,
                  fontWeight: FontWeight.w400,
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.primaryColor
                      : ColorsConfig.secondaryColor,
                ),
              ),
              subtitle: Text(
                _resultList[index]['title'],
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                  fontSize: FontSize.body3,
                  fontFamily: FontFamily.lexendLight,
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.textColor
                      : ColorsConfig.modeInactiveColor,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 13,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.primaryColor
                    : ColorsConfig.secondaryColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
