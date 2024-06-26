import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:UrbanEraFashion/views/bottom_bar/bottom_navigation_bar_view.dart';
import 'package:UrbanEraFashion/views/home/home_view.dart';

class GoogleSignInProvider {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future googleLogin(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await _auth.signInWithCredential(credential);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationBarView()),
      );
      //"HOME SCREEN"
      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   "home_view",
      //   (route) => false,
      // );
      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   "bottom_navigation_bar_view",
      //   (route) => false,
      // );
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  static Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
