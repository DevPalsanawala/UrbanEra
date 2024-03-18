import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import 'package:http/http.dart' as http;
import 'package:shoppers_ecommerce_flutter_ui_kit/views/payment/payment_successful_view.dart';

class PhonePepayment extends StatefulWidget {
  const PhonePepayment({super.key});

  @override
  State<PhonePepayment> createState() => _PhonePepaymentState();
}

class _PhonePepaymentState extends State<PhonePepayment> {
  // String environment = "UAT_SIM"; //youtuber walu
  String environment = "SANDBOX"; // comment

  String appId = "";
  String transactionId = DateTime.now().millisecondsSinceEpoch.toString();
  String merchantId =
      "PGTESTPAYUAT"; //You typically acquire a merchant ID when you set up a merchant account with a credit card processor or payment gateway. The process typically involves a business verification procedure, including providing tax information and ownership details
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
      "amount": 100,
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
                        "Flow Completed - Status: $status and Error: $error";
                  }
                } else {
                  result = "Flow Incomplete";
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("phone pe payment gateway"),
        ),
        body: Column(
          children: [
            Container(
              child: ElevatedButton(
                child: Text("start transaction"),
                onPressed: () {
                  startPgTransaction();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Set button background color to black
                  onPrimary: Colors.white,
                  minimumSize: Size(300, 50),

                  // Set text color to white
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Result \n $result"),
          ],
        ),
      ),
    );
  }
}
