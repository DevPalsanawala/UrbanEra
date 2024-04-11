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
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}
