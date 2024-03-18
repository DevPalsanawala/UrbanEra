import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/colors.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/button_controller.dart';

final _firebase = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var _issecure = true;

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  void _login(BuildContext context) async {
    try {
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
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 50),
              // Logo and Welcome Text
              Column(
                children: [
                  Container(
                    width: 250,
                    height: 250,
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
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              // Username text field
              SizedBox(height: 30),
              // Email text field
              TextFormField(
                controller: _emailController,
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
                controller: _passwordController,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Password is empty';
                  }
                  return null;
                },
                obscureText: _issecure,
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
                    child: Icon(_issecure
                        ? Icons.remove_red_eye_sharp
                        : Ionicons.eye_off_sharp),
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
                  _login(context);
                },
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.primaryColor
                    : ColorsConfig.secondaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
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
                        : ColorsConfig.secondaryColor, // Adjust for modern look
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
