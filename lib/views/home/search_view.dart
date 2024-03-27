// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/home_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/search_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/product_controller.dart';
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
  List<Map<String, dynamic>> _allResults = [];
  List<Map<String, dynamic>> _resultList = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchedChanged);
    getClientStream();
  }

  _onSearchedChanged() {
    print(_searchController.text);
    searchResultList();
  }

  // Function to filter results based on search text
  searchResultList() {
    setState(() {
      _resultList = _allResults.where((product) {
        String subtitle = product['subtitle'].toString().toLowerCase();
        return subtitle.contains(_searchController.text.toLowerCase());
      }).toList();
    });
  }

  // Function to fetch all products from Firestore
  getClientStream() async {
    var data = await FirebaseFirestore.instance
        .collection('Products')
        .orderBy('title')
        .get();
    setState(() {
      _allResults =
          data.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      searchResultList(); // Filter initially
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: CupertinoSearchTextField(
                controller: _searchController,
              ),
            ),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
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
              leading: Hero(
                tag: 'product_${_resultList[index]['id']}',
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 25,
                  backgroundImage: AssetImage(
                    'assets/admin_site_images/all final images with background removed/${_resultList[index]['img']}',
                  ),
                ),
              ),
              title: Hero(
                tag: 'subtitle_${_resultList[index]['id']}',
                child: Text(_resultList[index]['subtitle']),
              ),
              subtitle: Text(_resultList[index]['title']),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
              ),
            ),
          );
        },
      ),
    );
  }
}
