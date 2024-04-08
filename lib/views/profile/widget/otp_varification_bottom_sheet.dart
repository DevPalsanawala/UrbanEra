import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:UrbanEraFashion/config/colors.dart';
import 'package:UrbanEraFashion/config/image.dart';
import 'package:UrbanEraFashion/controller/dark_mode_controller.dart';
import 'package:UrbanEraFashion/controller/edit_profile_controller.dart';
import '../../../config/font_family.dart';
import '../../../config/font_size.dart';
import '../../../config/size.dart';
import '../../../config/text_string.dart';

DarkModeController darkModeController = Get.put(DarkModeController());

verifyOTPVerificationBottomSheet(BuildContext context) {
  EditProfileController editProfileController = Get.put(EditProfileController());
  final defaultPinTheme = PinTheme(
    width: SizeConfig.width70,
    height: SizeConfig.height64,
    textStyle: TextStyle(
      fontSize: FontSize.heading3,
      color: darkModeController.isLightTheme.value
          ? ColorsConfig.buttonColor
          : ColorsConfig.secondaryColor,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.lexendRegular,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
      color: darkModeController.isLightTheme.value
          ? ColorsConfig.secondaryColor
          : ColorsConfig.primaryColor,
    ),
  );

  final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    borderRadius: BorderRadius.circular(SizeConfig.borderRadius14),
  );

  final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: darkModeController.isLightTheme.value
          ? ColorsConfig.secondaryColor
          : ColorsConfig.primaryColor,
    ),
  );
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
          height: SizeConfig.height395,
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
                height: SizeConfig.height353,
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
                            TextString.otpVerification,
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
                            height: SizeConfig.height16,
                          ),
                          Text.rich(
                            TextSpan(
                              text: TextString.otpVerificationDescription,
                              style: TextStyle(
                                fontSize: FontSize.body2,
                                fontFamily: FontFamily.lexendLight,
                                fontWeight: FontWeight.w300,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.textColor
                                    : ColorsConfig.modeInactiveColor,
                              ),
                              children: [
                                TextSpan(
                                  text: TextString.editAddress,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontWeight: FontWeight.w400,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height24,
                          ),
                          Pinput(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: focusedPinTheme,
                            submittedPinTheme: submittedPinTheme,
                            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                            keyboardType: TextInputType.number,
                            controller: editProfileController.pinController,
                            focusNode: editProfileController.pinFocusNode,
                            showCursor: true,
                            onCompleted: (pin) {},
                          ),
                          const SizedBox(
                            height: SizeConfig.height16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {

                                },
                                child: Text(
                                  TextString.notReceiveOTP,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendLight,
                                    fontWeight: FontWeight.w300,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                  ),
                                ),
                              ),
                              Obx(
                                    () => GestureDetector(
                                  onTap: () {
                                    if (editProfileController.timerCompleted.value) {
                                      editProfileController.restartTimer();
                                    }
                                  },
                                  child: Text(
                                    editProfileController.timerCompleted.value
                                        ? TextString.resendOTP
                                        : editProfileController.getFormattedTime(),
                                    style: TextStyle(
                                      fontSize: FontSize.body2,
                                      fontFamily: FontFamily.lexendMedium,
                                      fontWeight: FontWeight.w500,
                                      color: darkModeController.isLightTheme.value
                                          ? ColorsConfig.primaryColor
                                          : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                              Get.back();
                              Get.back();
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
                                  TextString.textButtonConfirmOTP,
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
