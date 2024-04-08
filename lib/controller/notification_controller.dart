import 'package:get/get.dart';
import 'package:UrbanEraFashion/config/text_string.dart';

class NotificationController extends GetxController {
  RxBool searchBoolean = false.obs;

  List<String> notificationTitle = [
    TextString.newUpdateAvailable,
    TextString.yourPaymentReceived,
    TextString.orderPlaced,
    TextString.checkFestivalOffers,
    TextString.orderDelivered,
    TextString.newOffersStartingNow,
  ];

  List<String> notificationSubtitle = [
    TextString.notification1,
    TextString.notification2,
    TextString.notification3,
    TextString.notification4,
    TextString.notification5,
    TextString.notification6,
  ];

  List<String> notificationDate = [
    TextString.notificationDate1,
    TextString.notificationDate2,
    TextString.notificationDate3,
    TextString.notificationDate3,
    TextString.notificationDate3,
    TextString.notificationDate3,
  ];

  List<String> notificationTime = [
    TextString.notificationTime1,
    TextString.notificationTime2,
    TextString.notificationTime2,
    TextString.notificationTime3,
    TextString.notificationTime3,
    TextString.notificationTime4,
  ];
}