import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/Login/otp.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/colors.dart';

import 'package:shoppers_ecommerce_flutter_ui_kit/views/home/widget/filter_bottom_sheet.dart';

class MyPhone extends StatefulWidget {
  static String verify = "";

  @override
  State<StatefulWidget> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryycode = TextEditingController();
  var phone = "";
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  @override
  void initState() {
    countryycode.text = "+91";
    super.initState();
  }

  void _isvalid() async {
    if (phone.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 2000),
          content: Text("Enter valid phone number"),
        ),
      );
    } else {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${countryycode.text + phone}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          MyPhone.verify = verificationId;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MyOtp(),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkModeController.isLightTheme.value
          ? ColorsConfig.backgroundColor
          : ColorsConfig.buttonColor,
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),

              // Logo and Welcome Text
              Column(
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
                      "assets/images/account.png",
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'We need to register your account before getting started!',
                    style: TextStyle(
                      fontSize: 20,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.textColor
                          : ColorsConfig.modeInactiveColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              SizedBox(height: 50),

              // Username text field

              SizedBox(height: 20),

              // Phone number input
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: const CountryListThemeData(
                            bottomSheetHeight: 550,
                          ),
                          onSelect: (value) {
                            setState(() {
                              selectedCountry = value;
                              countryycode.text = value.phoneCode;
                            });
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                          style: TextStyle(
                            fontSize: 18,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 35, color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor),
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          phone = value;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Password text field

              SizedBox(height: 20),

              // Send code button
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.87,
                height: 55,
                onPressed: () {
                  _isvalid();
                },
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.primaryColor
                    : ColorsConfig.secondaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
