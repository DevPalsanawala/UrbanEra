import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Rx<User?> currentUser = Rx<User?>(null);
  Rx<Map<String, dynamic>> userData = Rx<Map<String, dynamic>>({});

  @override
  void onInit() {
    super.onInit();
    currentUser.bindStream(_auth.authStateChanges());
    ever(currentUser, _getUserData);
  }

  void _getUserData(User? user) async {
    if (user != null) {
      DocumentSnapshot doc = await _usersCollection.doc(user.uid).get();
      if (doc.exists) {
        userData.value = doc.data() as Map<String, dynamic>;
      }
    } else {
      userData.value = {};
    }
  }
}
