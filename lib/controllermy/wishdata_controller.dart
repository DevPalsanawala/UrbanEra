import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/currentuser_controller.dart';

class WishlistdataController extends GetxController {
  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;
  late StreamController<List<Map<String, dynamic>>> _itemsStreamController;

  @override
  void onInit() {
    super.onInit();
    _itemsStreamController = StreamController<List<Map<String, dynamic>>>();
    final UserController userController = Get.find();
    User? user = userController.currentUser.value;
    Map<String, dynamic> userData = userController.userData.value;
    fetchWishlistItems(user!.uid);
  }

  Stream<List<Map<String, dynamic>>> get itemsStream =>
      _itemsStreamController.stream;

  Future<void> fetchWishlistItems(String userId) async {
    try {
      var document = await FirebaseFirestore.instance
          .collection('wishlist')
          .doc(userId)
          .get();

      if (document.exists) {
        var data = document.data();
        if (data != null && data.containsKey('items')) {
          items.value = List<Map<String, dynamic>>.from(data['items']);
          _itemsStreamController.add(items.toList());
          print('Wishlist items updated: ${items.length}');
        }
      } else {
        items.clear();
      }
    } catch (error) {
      // Handle error
      print('Error fetching wishlist items: $error');
    }
  }

  @override
  void onClose() {
    _itemsStreamController.close();
    super.onClose();
  }
}
