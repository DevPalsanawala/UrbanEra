import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/colors.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/button_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/currentuser_controller.dart';

class Bagcontroller extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  RxMap isAddedMap = {}.obs;
  RxDouble payamount = 0.0.obs;
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
                'qty': doc['qty'],
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

  Future<void> toggleaddToBag(String userId, Map<String, dynamic> productData,
      int qty, String size) async {
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
          'qty': qty,
          'size': size,
          'userId': userId,
        });
      }

      // Refresh the items list
      await fetchBagtItems(userId);
    } catch (error) {
      print('Error toggling wishlist item: $error');
    }
  }

// order

  // void storeBagData(String userId) {
  //   Stream<List<Map<String, dynamic>>> bagItemsStream = bagStream(userId);

  //   bagItemsStream.listen((List<Map<String, dynamic>> bagItems) {
  //     // Save bag items to another collection in Firestore
  //     print(bagItems);
  //     DateTime now = DateTime.now();
  //     String formattedDate = DateFormat('d MMM yyyy').format(now);
  //     for (var item in bagItems) {
  //       item['date'] = formattedDate;
  //       FirebaseFirestore.instance.collection('Order').add(item);
  //     }
  //   });
  // }

  void storeBagData(String userId) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('bag')
        .where('userId', isEqualTo: userId)
        .get();

    List<Map<String, dynamic>> bagItems = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    // Save bag items to the "Order" collection in Firestore
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMM yyyy').format(now);
    for (var item in bagItems) {
      item['date'] = formattedDate;
      await FirebaseFirestore.instance.collection('Order').add(item);
    }

    // Delete bag items from the "bag" collection
    for (var doc in querySnapshot.docs) {
      isAddedMap[doc['id']] = false;
      await doc.reference.delete();
    }
  }

  RxBool isLoading = true.obs;
  Stream<List<Map<String, dynamic>>> orderStream(String userId) {
    isLoading.value = true;
    return _firestore
        .collection('Order')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      isLoading.value = false;
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }
}
