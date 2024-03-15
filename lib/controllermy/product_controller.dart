import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/model/product_model.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/services/product_service.dart';

class Productcontroller extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<Map<String, dynamic>> produts = RxList<Map<String, dynamic>>([]);
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('Products').get();
      produts.value = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      isLoading(true);
    } catch (e) {
      print('Error fetching Products: $e');
    } finally {
      isLoading(false);
    }
  }
}
