import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/colors.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/button_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/currentuser_controller.dart';

class Bagcontroller extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  RxMap isAddedMap = {}.obs;
  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;

  Stream<List<Map<String, dynamic>>> bagStream(String userId) {
    return _firestore
        .collection('bag')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  @override
  void onInit() {
    super.onInit();
    final UserController userController = Get.find();
    User? user = userController.currentUser.value;
    Map<String, dynamic> userData = userController.userData.value;
    fetchBagtItems(user!.uid);
  }

  Future<void> fetchBagtItems(String userId) async {
    try {
      var querySnapshot = await _firestore
          .collection('bag')
          .where('userId', isEqualTo: userId)
          .get();

      items.value = querySnapshot.docs
          .map((doc) => {
                'category': doc['category'],
                'id': doc['id'],
                'img': doc['img'],
                'mrp': doc['mrp'],
                'price': doc['price'],
                'sub_category': doc['sub_category'],
                'subtitle': doc['subtitle'],
                'title': doc['title'],
                'userId': doc['userId'],
              })
          .toList();

      isAddedMap.assignAll(Map.fromIterable(
        items,
        key: (item) => item['id'],
        value: (_) => true,
      ));
    } catch (error) {
      print('Error fetching wishlist items: $error');
    }
  }

  Future<void> toggleaddToBag(
      String userId, Map<String, dynamic> productData) async {
    try {
      final collectionRef = _firestore.collection('bag');
      final itemId = productData['id'];

      // Check if the item is already in the wishlist
      QuerySnapshot querySnapshot = await collectionRef
          .where('userId', isEqualTo: userId)
          .where('id', isEqualTo: itemId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // If the item is already in the wishlist, remove it
        isAddedMap[itemId] = false;
        Fluttertoast.showToast(
          msg: 'Item removed from bag',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
        );
        String docId = querySnapshot.docs.first.id;
        await collectionRef.doc(docId).delete();
      } else {
        // If the item is not in the wishlist, add it
        isAddedMap[itemId] = true;
        Fluttertoast.showToast(
          msg: 'Add to Bag',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
        );
        await collectionRef.add({
          'category': productData['category'],
          'id': productData['id'],
          'img': productData['img'],
          'mrp': productData['mrp'],
          'price': productData['price'],
          'sub_category': productData['sub_category'],
          'subtitle': productData['subtitle'],
          'title': productData['title'],
          'userId': userId,
        });
      }

      // Refresh the items list
      await fetchBagtItems(userId);
    } catch (error) {
      print('Error toggling wishlist item: $error');
    }
  }
}
