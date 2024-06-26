import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:UrbanEraFashion/Admin/admin.dart';
import 'package:UrbanEraFashion/Login/gogle_sign_in_provider.dart';
import 'package:UrbanEraFashion/config/colors.dart';
import 'package:UrbanEraFashion/config/font_family.dart';
import 'package:UrbanEraFashion/config/font_size.dart';
import 'package:UrbanEraFashion/controller/button_controller.dart';

final _firebase = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var _issecure = true;
  var isLogin = false;
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  void _login(BuildContext context) async {
    if (_emailController.text == "adminofurbanera@gmail.com" &&
        _passwordController.text == "hydrakijay") {
      setState(() {
        isLogin = true;
      });
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AdminPage(),
      ));
    } else {
      try {
        setState(() {
          isLogin = true;
        });

        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
        if (userCredentials != null) {
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
        }
      } on FirebaseAuthException catch (error) {
        String errorMessage = "Invalid Credentials";

        switch (error.code) {
          case "invalid-email":
            errorMessage = "Invalid email address.";
            break;
          case "user-not-found":
            errorMessage = "User not found.";
            break;
          case "wrong-password":
            errorMessage = "Wrong password.";
            break;
          // Add more cases for other error codes as needed
        }

        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 3000),
            content: Text(errorMessage),
          ),
        );
        setState(() {
          isLogin = false;
        });
      } catch (error) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 3000),
            content: Text("An error occurred: $error"),
          ),
        );
        setState(() {
          isLogin = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: darkModeController.isLightTheme.value
          ? ColorsConfig.backgroundColor
          : ColorsConfig.buttonColor,
      // appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 50),
                  // Logo and Welcome Text
                  Column(
                    children: [
                      SizedBox(height: 50),
                      Container(
                        width: screenWidth * 0.5,
                        height: screenWidth * 0.5,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black12,
                        ),
                        child: Image.asset(
                          "assets/images/logindart.png",
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Welcome back you\'ve been missed!',
                        style: TextStyle(
                          fontFamily: FontFamily.lexendRegular,
                          fontSize: FontSize.body2,
                          fontWeight: FontWeight.w400,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ),
                    ],
                  ),

                  // Username text field
                  SizedBox(height: 30),
                  // Email text field
                  TextFormField(
                    cursorColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                    controller: _emailController,
                    style: TextStyle(
                      fontFamily: FontFamily.lexendRegular,
                      fontSize: FontSize.body2,
                      fontWeight: FontWeight.w400,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Email is empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter an email',
                      prefixIcon: Icon(Icons.email,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Password text field
                  TextFormField(
                    style: TextStyle(
                      fontFamily: FontFamily.lexendRegular,
                      fontSize: FontSize.body2,
                      fontWeight: FontWeight.w400,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                    controller: _passwordController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Password is empty';
                      }
                      return null;
                    },
                    obscureText: _issecure,
                    cursorColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
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
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  // Create account button
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.87,
                    height: 55,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _login(context);
                    },
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: isLogin
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.secondaryColor
                                    : ColorsConfig.primaryColor,
                              ),
                            ),
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.secondaryColor
                                  : ColorsConfig.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Google Sign-in Button
                  TextButton.icon(
                    onPressed: () {
                      // GoogleSignInProvider.googleLogin(context);
                    },
                    icon: Image.asset(
                      'assets/images/google.png', // Replace with your Google logo
                      width: 24.0,
                      height: 24.0,
                    ),
                    label: Text(
                      'Login in with Google',
                      style: TextStyle(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig
                                .secondaryColor, // Adjust for modern look
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
