import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/colors.dart';
import 'package:UrbanEraFashion/config/image.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/controller/edit_profile_controller.dart';
import 'package:UrbanEraFashion/views/profile/widget/otp_varification_bottom_sheet.dart';
import '../../../config/font_family.dart';
import '../../../config/font_size.dart';
import '../../../config/size.dart';
import '../../../config/text_string.dart';

DarkModeController darkModeController = Get.put(DarkModeController());

changeMobileNumberBottomSheet(BuildContext context) {
  EditProfileController editProfileController = Get.put(EditProfileController());
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(SizeConfig.borderRadius24),
        topRight: Radius.circular(SizeConfig.borderRadius24),
      ),
      borderSide: BorderSide.none,
    ),
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          height: SizeConfig.height305,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                    editProfileController.changeMobileController.clear();
                  },
                  child: const Image(
                    image: AssetImage(ImageConfig.close),
                    width: SizeConfig.width24,
                  ),
                ),
              ),
              const SizedBox(
                height: SizeConfig.height18,
              ),
              Container(
                height: SizeConfig.height263,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(SizeConfig.borderRadius24),
                    topLeft: Radius.circular(SizeConfig.borderRadius24),
                  ),
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.backgroundColor
                      : ColorsConfig.buttonColor,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding24,
                        right: SizeConfig.padding24,
                        top: SizeConfig.padding32,
                        bottom: SizeConfig.padding24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextString.enterMobileNumber,
                            style: TextStyle(
                              fontSize: FontSize.heading4,
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamily.lexendMedium,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height24,
                          ),
                          TextField(
                            controller: editProfileController.changeMobileController,
                            cursorColor: darkModeController.isLightTheme.value
                                ? ColorsConfig.textColor
                                : ColorsConfig.secondaryColor,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            style: TextStyle(
                              fontFamily: FontFamily.lexendRegular,
                              fontSize: FontSize.body2,
                              fontWeight: FontWeight.w400,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: SizeConfig.padding22,
                                  vertical: SizeConfig.padding23),
                              hintText: TextString.mobileNumber,
                              hintStyle: TextStyle(
                                fontFamily: FontFamily.lexendRegular,
                                fontSize: FontSize.body2,
                                fontWeight: FontWeight.w400,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.textColor
                                    : ColorsConfig.modeInactiveColor,
                              ),
                              filled: true,
                              fillColor: darkModeController.isLightTheme.value
                                  ? ColorsConfig.secondaryColor
                                  : ColorsConfig.primaryColor,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.circular(SizeConfig.borderRadius14),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.circular(SizeConfig.borderRadius14),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.circular(SizeConfig.borderRadius14),
                              ),
                            ),
                            onChanged: (text) {
                              editProfileController.mobileNumber.value = text;
                              editProfileController.isButtonEnabled.value = text.isNotEmpty;
                              editProfileController.isPhoneNumber.value = text.length == 10;
                            },
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: SizeConfig.height94,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.backgroundColor
                              : ColorsConfig.primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: .1,
                              blurRadius: 15,
                              offset: const Offset(0, -4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: SizeConfig.padding24,
                            right: SizeConfig.padding24,
                            top: SizeConfig.padding18,
                            bottom: SizeConfig.padding24,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              verifyOTPVerificationBottomSheet(context);
                            },
                            child: Container(
                              height: SizeConfig.height52,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadius14),
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  TextString.textButtonSendOTPForVerification,
                                  style: TextStyle(
                                    fontSize: FontSize.body1,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontFamily.lexendRegular,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.secondaryColor
                                        : ColorsConfig.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
