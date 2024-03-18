import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController {
  late String _name;
  late String _email;
  late String _phone;

  String get name => _name;
  String get email => _email;
  String get phone => _phone;

  Future<void> fetchUserData(String userId) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        _name = snapshot.get('name');
        _email = snapshot.get('email');
        _phone = snapshot.get('phone');
        update(); // Notify listeners that data has been updated
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
}
