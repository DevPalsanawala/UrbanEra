import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController {
  final _firebase = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  RxString name = ''.obs;
  RxString phone = ''.obs;
  RxString email = ''.obs;
  RxString userid = ''.obs;
  Future<void> getUserData() async {
    try {
      final userId = _firebase.currentUser!.uid;
      final userData = await _firestore.collection('users').doc(userId).get();
      name.value = userData.get('name') ?? '';
      phone.value = userData.get('phone') ?? '';
      email.value = userData.get('email') ?? '';
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }
}
