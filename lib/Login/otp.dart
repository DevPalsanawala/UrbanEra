// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/Login/account.dart';

import 'package:shoppers_ecommerce_flutter_ui_kit/Login/phone.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/colors.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/button_controller.dart';

class MyOtp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    // ignore: unused_local_variable
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    // ignore: unused_local_variable
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    var code = "";

    return Scaffold(
      backgroundColor: darkModeController.isLightTheme.value
          ? ColorsConfig.backgroundColor
          : ColorsConfig.buttonColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple.shade50,
                ),
                child: Image.asset(
                  "assets/images/Enter OTP-bro.png",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'We need to register your otp before getting started!',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value) {
                  code = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 49,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: account.verify, smsCode: code);

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        "home_view",
                        (route) => false,
                      );
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        "bottom_navigation_bar_view",
                        (route) => false,
                      );

                      // Sign the user in (or link) with the credential
                      // await auth.signInWithCredential(credential);
                      // final userid = auth.currentUser!.uid;
                      // await FirebaseFirestore.instance
                      //     .collection('users')
                      //     .doc(auth.currentUser!.uid)
                      //     .set({
                      //   'phone': widget.phone,
                      //   // Add more user data as needed
                      // });
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => account(),
                      // ));
                      // Navigator.pushNamedAndRemoveUntil(
                      //   context,
                      //   "bottom_navigation_bar_view",
                      //   (route) => false,
                      // );
                    } catch (e) {
                      print("Wrong otp");
                    }
                  },
                  child: Text(
                    'Verify phone number',
                    style: TextStyle(
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              // Row(
              //   children: [
              //     TextButton(
              //         onPressed: () {
              //           Navigator.pushNamedAndRemoveUntil(
              //               context, 'phone', (route) => false);
              //         },
              //         child: Text(
              //           "Edit phone number?",
              //           style: TextStyle(color: Colors.black),
              //         ))
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
