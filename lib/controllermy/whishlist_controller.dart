import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/currentuser_controller.dart';

class WishlistController1 extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  RxSet<String> wishlistItems = Set<String>().obs;
  RxMap isAddedMap = {}.obs;
  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    final UserController userController = Get.find();
    User? user = userController.currentUser.value;
    Map<String, dynamic> userData = userController.userData.value;
    getWishlistItems(user!.uid);

    // fetchWishlistItems(user!.uid);
  }

  void getWishlistItems(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> savedItems =
        prefs.getStringList('wishlistItems_$userId') ?? [];
    wishlistItems.assignAll(savedItems);
    isAddedMap.assignAll(Map.fromIterable(
      savedItems,
      key: (item) => item,
      value: (_) => true,
    ));
  }

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
        }
      } else {
        items.clear();
      }
    } catch (error) {
      // Handle error
      print('Error fetching wishlist items: $error');
    }
  }

  Future<void> toggleWishlistItem(
      String userId, Map<String, dynamic> productData) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String> savedItems =
          prefs.getStringList('wishlistItems_$userId') ?? [];
      final docRef = _firestore.collection('wishlist').doc(userId);
      final itemId = productData['id'];

      if (isAddedMap[itemId] ?? false) {
        await docRef.update({
          'items': FieldValue.arrayRemove([productData])
        });
        // items.remove(productData);
        savedItems.remove(itemId);
        isAddedMap[itemId] = false;
      } else {
        await docRef.set({
          'items': FieldValue.arrayUnion([productData])
        }, SetOptions(merge: true));
        // items.add(productData);
        savedItems.add(itemId);
        isAddedMap[itemId] = true;
      }

      await prefs.setStringList('wishlistItems_$userId', savedItems);
      isAddedMap.refresh();
    } catch (error) {
      print('Error toggling wishlist item: $error');
    }
  }
}
