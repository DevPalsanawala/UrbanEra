import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/Login/Login.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/Login/account.dart';

import 'package:shoppers_ecommerce_flutter_ui_kit/Login/phone.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/colors.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/bottom_bar/bottom_navigation_bar_view.dart';

class Welcome extends StatelessWidget {
  DarkModeController darkModeController = Get.put(DarkModeController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          ); // You'll need to define SplashScreen
        }
        if (snapshot.hasData) {
          return BottomNavigationBarView(); // Your home screen widget
        } else {
          return Scaffold(
            backgroundColor: darkModeController.isLightTheme.value
                ? ColorsConfig.backgroundColor
                : ColorsConfig.buttonColor,
            body: SafeArea(
              // Ensures content stays within safe areas (e.g., avoiding notches)
              child: Column(
                children: <Widget>[
                  // Text section with desired spacing
                  Expanded(
                    // Allows the text section to fill some vertical space
                    flex:
                        1, // Twice the space of the image and buttons sections
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center text vertically
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // Center text horizontally
                      children: <Widget>[
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Unleash Your Style in the Urban Fashion Frontier.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),

                  // Image container centered and sized appropriately
                  Container(
                    height: MediaQuery.of(context).size.height / 2.7,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/Online shopping-cuate.png'),
                      ),
                    ),
                  ),

                  // Button section with some spacing from the bottom
                  Expanded(
                    // Allows buttons to fill remaining space
                    flex: 1, // Equal space to the text section
                    child: Padding(
                      // Add some padding from the bottom
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Column(
                        // Wrap buttons vertically
                        mainAxisAlignment:
                            MainAxisAlignment.end, // Align buttons to bottom
                        children: <Widget>[
                          MaterialButton(
                            minWidth: MediaQuery.of(context).size.width * 0.87,
                            height: 55,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor),
                            ),
                          ),
                          SizedBox(height: 20),
                          MaterialButton(
                            minWidth: MediaQuery.of(context).size.width * 0.87,
                            height: 55,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => account()),
                              );
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
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
