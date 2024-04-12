import 'package:UrbanEraFashion/config/colors.dart';
import 'package:UrbanEraFashion/config/font_family.dart';
import 'package:UrbanEraFashion/config/font_size.dart';
import 'package:UrbanEraFashion/config/image.dart';
import 'package:UrbanEraFashion/config/size.dart';
import 'package:UrbanEraFashion/controller/button_controller.dart';
import 'package:UrbanEraFashion/controller/edit_profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:get/get.dart';

class CustomerSupportPage extends StatelessWidget {
  const CustomerSupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = userController.currentUser.value;
    Map<String, dynamic> userData = userController.userData.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: darkModeController.isLightTheme.value
              ? ColorsConfig.backgroundColor
              : ColorsConfig.buttonColor,
          elevation: 0,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image(
                  image: const AssetImage(ImageConfig.backArrow),
                  width: SizeConfig.width24,
                  height: SizeConfig.height24,
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.primaryColor
                      : ColorsConfig.secondaryColor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Customer Support',
                style: TextStyle(
                  fontSize: FontSize.heading4,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.lexendMedium,
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.primaryColor
                      : ColorsConfig.secondaryColor,
                ),
              ),
            ],
          ),
        ),
        body: Tawk(
          directChatLink:
              'https://tawk.to/chat/660ab5461ec1082f04dd8fe7/1hqct87ij',
          visitor: TawkVisitor(
            name: '${userData['name']}',
            email: '${userData['email']}',
          ),
          onLoad: () {
            print('Hello Tawk!');
          },
          onLinkTap: (String url) {
            print(url);
          },
          placeholder: Center(
            child: CircularProgressIndicator(
              color: ColorsConfig.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
