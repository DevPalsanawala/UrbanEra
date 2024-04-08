import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:UrbanEraFashion/Admin/data/opretiondata.dart';
import 'package:UrbanEraFashion/config/colors.dart';
import 'package:UrbanEraFashion/config/font_family.dart';
import 'package:UrbanEraFashion/config/font_size.dart';
import 'package:UrbanEraFashion/config/size.dart';
import 'package:UrbanEraFashion/controller/button_controller.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkModeController.isLightTheme.value
          ? ColorsConfig.backgroundColor
          : ColorsConfig.buttonColor,
      appBar: AppBar(
        backgroundColor: darkModeController.isLightTheme.value
            ? ColorsConfig.backgroundColor
            : ColorsConfig.buttonColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(
            left: SizeConfig.padding05,
          ),
          child: Text(
            "Admin",
            style: TextStyle(
              fontFamily: FontFamily.lexendMedium,
              fontSize: FontSize.heading4,
              fontWeight: FontWeight.w500,
              color: darkModeController.isLightTheme.value
                  ? ColorsConfig.primaryColor
                  : ColorsConfig.secondaryColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: SizeConfig.padding20,
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SizedBox(
            child: GridView.builder(
              semanticChildCount: null,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: SizeConfig.padding24,
                crossAxisSpacing: SizeConfig.padding24,
                mainAxisExtent: 240,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => FashionDetailsView(
                    //       product: item,
                    //     ),
                    //   ),
                    // );
                  },
                  child: Container(
                    width: 180,
                    padding: const EdgeInsets.only(
                      top: 0,
                      bottom: 14,
                      left: 15,
                      right: 15,
                    ),
                    decoration: BoxDecoration(
                      // color: Colors.grey.shade500,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Image(
                            image: AssetImage(
                                'assets/images/${data[index].image}'),
                            height: 190,
                            width: 190,
                          ),
                        ),
                        SizedBox(height: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // maxLines: 2,
                              // softWrap: true,
                              // overflow: TextOverflow
                              //     .ellipsis,
                              data[index].name,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                                fontSize: FontSize.heading4,
                                fontFamily: FontFamily.lexendMedium,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
