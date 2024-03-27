// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/currentuser_controller.dart';
// import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/wishdata_controller.dart';

// class WishlistController1 extends GetxController {
//   final _firestore = FirebaseFirestore.instance;
//   RxSet<String> wishlistItems = Set<String>().obs;
//   RxMap isAddedMap = {}.obs;
//   RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     final UserController userController = Get.find();
//     User? user = userController.currentUser.value;
//     Map<String, dynamic> userData = userController.userData.value;
//     getWishlistItems(user!.uid);
//   }

//   void getWishlistItems(String userId) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final List<String> savedItems =
//         prefs.getStringList('wishlistItems_$userId') ?? [];
//     wishlistItems.assignAll(savedItems);
//     isAddedMap.assignAll(Map.fromIterable(
//       savedItems,
//       key: (item) => item,
//       value: (_) => true,
//     ));
//   }

//   Future<void> toggleWishlistItem(
//       String userId, Map<String, dynamic> productData) async {
//     try {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       final List<String> savedItems =
//           prefs.getStringList('wishlistItems_$userId') ?? [];
//       final docRef = _firestore.collection('wishlist').doc(userId);
//       final itemId = productData['id'];

//       if (isAddedMap[itemId] ?? false) {
//         await docRef.update({
//           'items': FieldValue.arrayRemove([productData])
//         });
//         // items.remove(productData);
//         savedItems.remove(itemId);

//         isAddedMap[itemId] = false;
//       } else {
//         await docRef.set({
//           'items': FieldValue.arrayUnion([productData])
//         }, SetOptions(merge: true));
//         // items.add(productData);
//         savedItems.add(itemId);

//         isAddedMap[itemId] = true;
//       }

//       await prefs.setStringList('wishlistItems_$userId', savedItems);
//       isAddedMap.refresh();
//     } catch (error) {
//       print('Error toggling wishlist item: $error');
//     }
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/currentuser_controller.dart';

class WishlistController1 extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  RxMap isAddedMap = {}.obs;
  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;

  Stream<List<Map<String, dynamic>>> wishlistStream(String userId) {
    return _firestore
        .collection('wishlist')
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
    fetchWishlistItems(user!.uid);
  }

  Future<void> fetchWishlistItems(String userId) async {
    try {
      var querySnapshot = await _firestore
          .collection('wishlist')
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

  Future<void> toggleWishlistItem(
      String userId, Map<String, dynamic> productData) async {
    try {
      final collectionRef = _firestore.collection('wishlist');
      final itemId = productData['id'];

      // Check if the item is already in the wishlist
      QuerySnapshot querySnapshot = await collectionRef
          .where('userId', isEqualTo: userId)
          .where('id', isEqualTo: itemId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // If the item is already in the wishlist, remove it
        isAddedMap[itemId] = false;
        String docId = querySnapshot.docs.first.id;
        await collectionRef.doc(docId).delete();
      } else {
        // If the item is not in the wishlist, add it
        isAddedMap[itemId] = true;
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
      await fetchWishlistItems(userId);
    } catch (error) {
      print('Error toggling wishlist item: $error');
    }
  }
}
