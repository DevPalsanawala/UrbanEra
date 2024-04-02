// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/payment_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/bag_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controllermy/currentuser_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/payment/payment_successful_view.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/payment/phonepepayment.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';
import '../../routes/app_routes.dart';

class PaymentView extends StatefulWidget {
  PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  PaymentController paymentController = Get.put(PaymentController());

  DarkModeController darkModeController = Get.put(DarkModeController());

  Bagcontroller bagcontroller = Get.put(Bagcontroller());

  String environment = "SANDBOX";
  // comment
  String appId = "";

  String transactionId = DateTime.now().millisecondsSinceEpoch.toString();

  String merchantId = "PGTESTPAYUAT";
  //aapre jo merchant id change karie toh real payment thai sake
  bool enableLoggingk = true;

  String checksum = "";

  String saltkey = "099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";

  String saltIndex = "1";

  String callbackurl =
      "https://webhook.site/df450f01-e8a7-49c5-b593-cb5fce47f334";

  String body = "";

  Object? result;

  getChecksum() {
    final requestData = {
      "merchantId": merchantId,
      "merchantTransactionId": transactionId,
      "merchantUserId": "MUID123",
      "amount": 100 * 100,
      "callbackUrl": callbackurl,
      "mobileNumber": "9173848696@paytm",
      "paymentInstrument": {"type": "PAY_PAGE"}
    };
    String base64Body = base64.encode(utf8.encode(json.encode(requestData)));
    checksum =
        '${sha256.convert(utf8.encode(base64Body + apiEndPoint + saltkey)).toString()}###$saltIndex';

    return base64Body;
  }

  String apiEndPoint = "/pg/v1/pay";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    phonepeInit();
    body = getChecksum().toString();
  }

  void phonepeInit() {
    PhonePePaymentSdk.init(environment, appId, merchantId, enableLoggingk)
        .then((val) => {
              setState(() {
                result = 'PhonePe SDK Initialized - $val';
              })
            })
        .catchError((error) {
      handleError(error);
      return <dynamic>{};
    });
  }

  void startPgTransaction() async {
    PhonePePaymentSdk.startTransaction(body, callbackurl, checksum, "")
        .then((response) => {
              setState(() {
                if (response != null) {
                  String status = response['status'].toString();
                  String error = response['error'].toString();
                  if (status == 'SUCCESS') {
                    PaymentSuccessfulView();
                    result = "Flow Completed - Status: Success!";

                    checkStatus();
                  } else {
                    /* String result */ result =
                        "Transaction Completed - Status: $status and Error: $error";
                  }
                } else {
                  result = "transacrtion Incomplete";
                }
              })
            })
        .catchError((error) {
      // handleError(error)
      return <dynamic>{};
    });
  }

  void handleError(error) {
    setState(() {
      result = "error" + error.toString();
    });
  }

  checkStatus() async {
    try {
      String url =
          'https://apps-uat.phonepe.com/v3/transaction/status/$merchantId/$transactionId';

      String concateString =
          "/v3/transaction/$merchantId/$transactionId$saltkey"; // kadach error aave toh status bhusi nakhvu
      var bytes = utf8.encode(concateString);
      var digest = sha256.convert(bytes).toString();

      String xVerify = "$digest###$saltIndex";

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "X-VERIFY": xVerify,
        "X-MERCHANT-ID": merchantId
      }; //error aave toh merchantId kadhi nakhvu kemke documentation ma nathi

      await http.get(Uri.parse(url), headers: headers).then((value) {
        Map<String, dynamic> res = jsonDecode(value.body);

        print("SUBH $res");
        try {
          if (res["success"] &&
              res["code"] == "PAYMENT_SUCCESS" &&
              res['data']['state'] == "COMPLETED") {
            Fluttertoast.showToast(msg: res["message"]);
          } else {
            Fluttertoast.showToast(msg: "SOmething went wrong");
          }
        } on Exception catch (e) {
          Fluttertoast.showToast(msg: "Error of catch" + e.toString());
        }
      });
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: "Error of final catch" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    User? user = userController.currentUser.value;
    Map<String, dynamic> userData = userController.userData.value;
    return Obx(() => Scaffold(
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
              child: Row(
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
                  const SizedBox(
                    width: SizeConfig.width10,
                  ),
                  Text(
                    TextString.payment,
                    style: TextStyle(
                      fontFamily: FontFamily.lexendMedium,
                      fontSize: FontSize.heading4,
                      fontWeight: FontWeight.w500,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: SizeConfig.padding24,
                  top: SizeConfig.padding20,
                  bottom: SizeConfig.padding15,
                ),
                child: Text(
                  '\u{20B9} ${bagcontroller.payamount.value}',
                  style: TextStyle(
                    fontFamily: FontFamily.lexendMedium,
                    fontSize: FontSize.body1,
                    fontWeight: FontWeight.w500,
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.primaryColor
                        : ColorsConfig.secondaryColor,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: SizeConfig.padding24,
              right: SizeConfig.padding24,
              top: SizeConfig.padding15,
            ),
            child: Column(
              children: [
                Image(
                  image: const AssetImage(
                      "assets/admin_site_images/all final images with background removed/Money income-pana.png"),
                ),

                GestureDetector(
                  onTap: () {
                    startPgTransaction();
                  },
                  child: Container(
                    height: SizeConfig.height46,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                      left: SizeConfig.padding12,
                      right: SizeConfig.padding12,
                    ),
                    decoration: BoxDecoration(
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.borderRadius14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TextString.creditDebitCard,
                          style: TextStyle(
                            fontFamily: FontFamily.lexendRegular,
                            fontSize: FontSize.body2,
                            fontWeight: FontWeight.w400,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ),
                        Image(
                          image: const AssetImage(ImageConfig.add),
                          width: SizeConfig.width16,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: SizeConfig.height16,
                ),
                //
                Container(
                  height: SizeConfig.height46,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                    left: SizeConfig.padding12,
                    right: SizeConfig.padding12,
                  ),
                  decoration: BoxDecoration(
                    color: darkModeController.isLightTheme.value
                        ? ColorsConfig.secondaryColor
                        : ColorsConfig.primaryColor,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadius14),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        TextString.cashOnDelivery,
                        style: TextStyle(
                          fontFamily: FontFamily.lexendRegular,
                          fontSize: FontSize.body2,
                          fontWeight: FontWeight.w400,
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          paymentController.toggleImage();
                        },
                        child: Obx(
                          () => Image(
                            image: AssetImage(
                              paymentController.isImageToggled.value
                                  ? darkModeController.isLightTheme.value
                                      ? ImageConfig.fillRound
                                      : ImageConfig.fillRoundDark
                                  : darkModeController.isLightTheme.value
                                      ? ImageConfig.emptyRound
                                      : ImageConfig.emptyRoundDark,
                            ),
                            width: SizeConfig.width16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Obx(
            () => Visibility(
              visible: paymentController.isImageToggled.value,
              child: SizedBox(
                height: SizeConfig.height94,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: SizeConfig.padding24,
                    right: SizeConfig.padding24,
                    top: SizeConfig.padding18,
                    bottom: SizeConfig.padding24,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return PaymentSuccessfulView();
                        },
                      );
                      bagcontroller.storeBagData(user!.uid);
                    },
                    child: Container(
                      height: SizeConfig.height52,
                      width: SizeConfig.width212,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.borderRadius14,
                        ),
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                      child: Center(
                        child: Text(
                          TextString.textButtonPlaceOrder,
                          style: TextStyle(
                            fontSize: FontSize.body1,
                            fontWeight: FontWeight.w500,
                            fontFamily: FontFamily.lexendMedium,
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
          ),
        ));
  }
}
