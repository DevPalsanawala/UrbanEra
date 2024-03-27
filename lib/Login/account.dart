// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/Login/otp.dart';

import 'package:shoppers_ecommerce_flutter_ui_kit/config/colors.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/button_controller.dart';

final _firebase = FirebaseAuth.instance;

class account extends StatefulWidget {
  static String verify = "";

  const account({
    Key? key,
  }) : super(key: key);

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  TextEditingController countryycode = TextEditingController();
  @override
  void initState() {
    countryycode.text = "+91";
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();
  var _issecure = true;
  var _enteredname = "";
  var _enteredemail = "";
  var _enteredpassword = "";
  var _enteredphone = "";

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

  void _submit() async {
    final isValid = _formkey.currentState!.validate();

    if (!isValid) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 2000),
          content: Text("Please Enter Valid Data"),
        ),
      );
      return;
    }
    _formkey.currentState!.save();
    if (_enteredphone.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 2000),
          content: Text("Enter valid phone number"),
        ),
      );
    } else {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${countryycode.text + _enteredphone}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          account.verify = verificationId;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MyOtp(),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
    // print(
    //     "Name: $_enteredname, Email: $_enteredemail, Password: $_enteredpassword");
    try {
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enteredemail, password: _enteredpassword);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredentials.user!.uid)
          .set({
        "name": _enteredname,
        "phone": _enteredphone,
        "email": _enteredemail,
        // "password": _enteredpassword,
      });
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 3000),
          content: Text(error.message ?? "Authentication Error"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkModeController.isLightTheme.value
          ? ColorsConfig.backgroundColor
          : ColorsConfig.buttonColor,
      body: Form(
        key: _formkey,
        child: Container(
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
                      'Create Account',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 50),
                // Username text field
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  enableSuggestions: false,
                  style: TextStyle(
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                  decoration: InputDecoration(
                    labelText: "Name",
                    prefixIcon: Icon(
                      Icons.person_3_outlined,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter a valid Name";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _enteredname = newValue!;
                  },
                ),
                SizedBox(height: 20),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
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
                              fontSize: 15,
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
                            _enteredphone = value;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 10),
                              border: InputBorder.none,
                              hintText: "Phone",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Email text field
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  style: TextStyle(
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        !value.contains('@')) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _enteredemail = newValue!;
                  },
                ),
                SizedBox(height: 20),
                // Password text field
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  autocorrect: false,
                  obscureText: _issecure,
                  style: TextStyle(
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _issecure = !_issecure;
                        });
                      },
                      child: Icon(
                        _issecure
                            ? Ionicons.eye_off_sharp
                            : Icons.remove_red_eye_sharp,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.password_outlined,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().length < 6) {
                      return "Passwords must be at least 6 characters";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _enteredpassword = newValue!;
                  },
                ),
                SizedBox(height: 25),
                // Create account button
                SizedBox(
                  height: 53,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _submit();
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
                      // Add your signup logic here
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.secondaryColor
                            : ColorsConfig.primaryColor,
                        // fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
