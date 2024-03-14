import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/model/category_model.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/services/category_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Categorycontroller extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<Map<String, dynamic>> categories = RxList<Map<String, dynamic>>([]);

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('Categoies').get();
      categories.value = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }
  // RxList<Category> category = <Category>[].obs;
  // var isLoading = true.obs;

  // @override
  // void onInit() {
  //   fetchCategory();
  //   super.onInit();
  // }

  // void fetchCategory() async {
  //   try {
  //     isLoading(true);
  //     var cat = await Categoryservices.fetchdata();
  //     if (cat != null) {
  //       category.value = cat;
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
